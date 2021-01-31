# App and library to explore Silicon Labs EZRadioPRO family of ISM radio ICs.
# - dump various memory spaces
# - run custom code
# - tested with Si446x and Si4362
# More info: https://github.com/astuder/Inside-EZRadioPRO/tree/master/python#ezradiopropy

import collections
import argparse
import RPi.GPIO as GPIO
import spidev as SPI

class EZRadioPRO:
    def __init__(self, sdn=17, cts=18, spi_dev=0):
        self._pin_SDN = sdn
        self._pin_CTS = cts
        self._spi_dev = spi_dev

    def open(self):
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self._pin_SDN, GPIO.OUT)
        GPIO.setup(self._pin_CTS, GPIO.IN)

        self._spi = SPI.SpiDev()
        self._spi.open(0, self._spi_dev)
        self._spi.max_speed_hz = 8000000

    def reset(self):
        GPIO.output(self._pin_SDN, GPIO.HIGH)
        GPIO.output(self._pin_SDN, GPIO.LOW)
        while not GPIO.input(self._pin_CTS):
            pass

    def close(self):
        self._spi.close()
        GPIO.cleanup()

    def command(self, cmd, input=None, output_bytes=0):
        cmd_in = [cmd]
        if input is not None:
            cmd_in.extend(input)
        while not GPIO.input(self._pin_CTS):
            pass
        self._spi.writebytes(cmd_in)
        if output_bytes > 0:
            cmd_out = [0x44, 0]
            cmd_out.extend([0] * output_bytes)
            while not GPIO.input(self._pin_CTS):
                pass
            cmd_out = self._spi.xfer2(cmd_out)
            return cmd_out[2:]

    def power_up(self, func=1):
        self.command(0x02, [func, 0x00, 0x01, 0xc9, 0xc3, 0x80])

    def part_info(self):
        data = self.command(0x01, output_bytes=8)
        out = collections.namedtuple('PartInfo', ['chiprev', 'part', 'pbuild', 'id', 'customer', 'romid'])
        out.chiprev = data[0]
        out.part = data[1] * 256 + data[2]
        out.pbuild = data[3]
        out.id = data[4] * 256 + data[5]
        out.customer = data[6]
        out.romid = data[7]
        return out

    def func_info(self):
        data = self.command(0x10, output_bytes=6)
        out = collections.namedtuple('FuncInfo', ['revext', 'revbranch', 'reavint', 'patch', 'func'])
        out.revext = data[0]
        out.revbranch = data[1]
        out.revint = data[2]
        out.patch = data[3] * 256 + data[4]
        out.func = data[5]
        if data[5] == 0:
            out.image = 'BOOT'
        elif data [5] == 1:
            out.image = 'MAIN'
        else:
            out.image = 'IMAGE%d' % data[5]
        return out

    def set_property(self, group, start_prop, prop_values):
        cmd_data = [group, len(prop_values), start_prop]
        cmd_data.extend(prop_values)
        self.command(0x11, cmd_data, 0)

    def get_property(self, group, num_props, start_prop):
        out = self.command(0x12, [group, num_props, start_prop], num_props)
        return out;

    def get_chip_status(self, clr_pending_mask=None):
        if clr_pending_mask is None:
            data = self.command(0x23, output_bytes=5)
        else:
            data = self.command(0x23, [clr_pending_mask], 5)
        out = collections.namedtuple('ChipStatus', ['chip_pend', 'chip_status', 'cmd_err_status', 'cmd_err_cmd_id', 'info_flags'])
        out.chip_pend = data[0]
        out.chip_status = data[1]
        out.cmd_err_status = data[2]
        out.cmd_err_cmd_id = data[3]
        out.info_flags = data[4]
        return out

    def fifo_info(self, reset_mask=0):
        data = self.command(0x15, [reset_mask], 2)
        out = collections.namedtuple('FifoInfo', ['rx_fifo_count', 'tx_fifo_space'])
        out.rx_fifo_count = data[0]
        out.tx_fifo_space = data[1]
        return out

    def read_rx_fifo(self, count=1):
        cmd_out = [0x77]
        cmd_out.extend([0] * count)
        cmd_out = self._spi.xfer2(cmd_out)
        return cmd_out[1:]

    def peek(self, addr):
        out = self.command(0xf0, [int(addr / 256), int(addr % 256)], 1)
        return out[0]

    def poke(self, addr, value):
        self.command(0xf1, [int(addr / 256), int(addr % 256), value], 0)

    def dump(self, start=0, end=65535):
        if end is None:
            end = 0xffff
        addr = start
        peek_out = []
        while addr <= end:
            peek_in = []
            for x in range(7):
                if addr + x <= end:
                    peek_in.append(int((addr + x) / 256))
                    peek_in.append(int((addr + x) % 256))
            peek_out.extend(self.command(0xf0, peek_in, int(len(peek_in)/2)))
            addr += 7
        return peek_out

    def install_patch(self, patch):
        # repurpose GET_PROPERTY command to read 16 bytes of CODE memory
        patch_cmd = 0x12
        patch_jmp = 0x0225
        patch_addr = 0x0488

        # vector changed with A2A and C2A chip revision (romid 6)
        if self.part_info().romid == 6:
            patch_jmp = 0x0168

        # free memory location different for func 2 and 3 (Si446x-A2A only)
        if self.func_info().func > 1:
            patch_addr = 0x0500

        p = patch_addr
        for b in patch:
            self.poke(p, b)
            p += 1

        self._patch_jmp = self.dump(patch_jmp + 1, patch_jmp + 2)
        self.poke(patch_jmp + 1, int(patch_addr / 256))
        self.poke(patch_jmp + 2, int(patch_addr % 256))

        return patch_cmd

    def remove_patch(self):
        # restore GET_PROPERTY command
        patch_jmp = 0x0225
        if self.part_info().romid == 6:
            patch_jmp = 0x0168
        self.poke(patch_jmp + 1, self._patch_jmp[0])
        self.poke(patch_jmp + 2, self._patch_jmp[1])

    def dump_code(self, start=0, end=65535):
        # TODO: if range includes 0x200-0x500, read with peek before
        # installing patch
        patch = [0x78, 0x71, 0xe2, 0xf5, 0x83, 0x08, 0xe2, 0xf5,
                 0x82, 0x78, 0x70, 0xe4, 0x93, 0xa3, 0xf2, 0x08,
                 0xb8, 0x80, 0xf8, 0x22]
        patch_cmd = self.install_patch(patch)
        # dump CODE memory (movc a, @a+dptr)
        if end is None:
            end = 0xffff
        addr = start
        mem_dump = []
        while addr < end:
            mem_dump.extend(self.command(patch_cmd,
                                   [int(addr / 256), int(addr % 256)], 16))
            addr += 16
        # remove patch
        self.remove_patch()
        return mem_dump

    def dump_xdata(self, start=0, end=65535):
        # TODO: if range includes 0x200-0x500, read with peek before
        # installing patch
        patch = [0x78, 0x71, 0xe2, 0xf5, 0x83, 0x08, 0xe2, 0xf5,
                 0x82, 0x78, 0x70, 0xe0, 0xa3, 0xf2, 0x08, 0xb8,
                 0x80, 0xf9, 0x22]
        patch_cmd = self.install_patch(patch)
        # dump XDATA memory (movx a, @dptr)
        if end is None:
            end = 0xffff
        addr = start
        mem_dump = []
        while addr < end:
            mem_dump.extend(self.command(patch_cmd,
                                    [int(addr / 256), int(addr % 256)], 16))
            addr += 16
        # remove patch
        self.remove_patch()
        return mem_dump

    def dump_pdata(self, start=0, end=255):
        # install patch
        patch = [0x79, 0x71, 0xe3, 0xf5, 0x01, 0x78, 0x70, 0xe3,
                 0x09, 0xf2, 0x08, 0xb8, 0x80, 0xf9, 0x22]
        patch_cmd = self.install_patch(patch)
        # dump PDATA memory (movx a, @r0)
        if end is None:
            end = 0xff
        addr = start
        mem_dump = []
        while addr < end:
            mem_dump.extend(self.command(patch_cmd,
                                    [int(addr % 256)], 16))
            addr += 16
        # remove patch
        self.remove_patch()
        return mem_dump

    def dump_sfr(self, start=128, end=255):
        # install patch
        patch = [0x79, 0x71, 0xe3, 0x90, 0x04, 0x92, 0xf0,
                 0x78, 0x70, 0xe5, 0x00, 0xf2, 0xe0, 0x04,
                 0xf0, 0x08, 0xb8, 0x80, 0xf6, 0x22]
        patch_cmd = self.install_patch(patch)
        # dump internal memory direct (mov a, 0x00)
        if end is None:
            end = 0xff
        addr = start
        mem_dump = []
        while addr < end:
            mem_dump.extend(self.command(patch_cmd,
                                    [int(addr % 256)], 16))
            addr += 16
        # remove patch
        self.remove_patch()
        return mem_dump

    def dump_memctl(self, start=0, end=65535):
        # install patch
        patch = [0x79, 0x71, 0xe3, 0xfc, 0x79, 0x72, 0xe3,
                 0xfd, 0x7a, 0x00, 0x7b, 0x01, 0x7e, 0x50,
                 0x7f, 0x70, 0x12, 0x00, 0x9c, 0x22]
        if self.part_info().romid == 6:
            patch = [0x79, 0x71, 0xe3, 0xfc, 0x79, 0x72, 0xe3,
                     0xfd, 0x7a, 0x00, 0x7b, 0x01, 0x7e, 0x50,
                     0x7f, 0x70, 0x12, 0x8b, 0x50, 0x22]
        patch_cmd = self.install_patch(patch)
        #dump memory via MEMCTL peripheral using ROM function call
        if end is None:
            end = 0xffff
        # memctl length is one short
        end += 1
        addr = start
        mem_dump = []
        while addr < end:
            mem_dump.extend(self.command(patch_cmd,
                                    [int(addr / 256), int(addr % 256)], 1))
            addr += 1
        # remove patch
        self.remove_patch()
        return mem_dump

    def dump_spidma(self, start=0, end=0x0fff):
        # install patch
        patch = [0x78, 0x72, 0xe2, 0x78, 0x8b, 0xf2, 0x78, 0x71,
                 0xe2, 0x54, 0x0f, 0xff, 0x78, 0x8c, 0x54, 0x0f,
                 0x4f, 0xf2, 0x78, 0x88, 0x74, 0x7f, 0xf2, 0x78,
                 0x8e, 0x74, 0xff, 0xf2, 0x22]
        patch_cmd = self.install_patch(patch)
        # dump address space accessible to SPI peripheral via RX FIFO
        if end is None:
            end = 0x0fff
        addr = start
        mem_dump = []
        while addr < end:
            # reset and configure RX FIFO
            self.fifo_info(0x02)
            self.command(patch_cmd, [int(addr / 256), int(addr % 256)])
            # read memory via RX FIFO
            count = 0
            while addr < end and count < 0x80:
                mem_dump.extend(self.read_rx_fifo(16))
                count += 16
                addr += 16
        # remove patch and reset fifo
        self.remove_patch()
        self.fifo_info(0x02)
        return mem_dump

def dump_to_hex(dump, base):
    # convert to xxd hex dump format
    # 00001234: 1234 1234 1234 1234 1234 1234 1234 1234  1234567890abcdef
    idx = 0
    end = len(dump)
    str_out = ''
    while idx < end:
        str_out += '%08x: ' % (base + idx)
        for x in range(8):
            if idx < end:
                str_out += '%02x' % dump[idx]
            else:
                str_out += '  '
            idx += 1
            if idx < end:
                str_out += '%02x ' % dump[idx]
            else:
                str_out += '   '
            idx += 1
        str_out += ' '
        idx -= 16
        for x in range(16):
            if idx < end:
                if dump[idx] >= 32 and dump[idx] < 127:
                    str_out += chr(dump[idx])
                else:
                    str_out += '.'
            else:
                str_out += ' '
            idx += 1
        str_out += '\n'
    return str_out

def command_info(func):
    radio = EZRadioPRO()
    radio.open()
    radio.reset()

    part_info = radio.part_info()
    print('Found Si%04x rev %d build %d id 0x%04x customer %d rom %d' % (
                            part_info.part, part_info.chiprev,
                            part_info.pbuild, part_info.id,
                            part_info.customer, part_info.romid))

    func_info = radio.func_info()
    print('Func: ext %d branch %d int %d patch %d func %d (%s)' % (
                            func_info.revext, func_info.revbranch,
                            func_info.revint, func_info.patch, func_info.func,
                            func_info.image))

    chip_status = radio.get_chip_status()
    print('Chip status: 0x%02x  Info flags: 0x%02x' % (
                            chip_status.chip_status, chip_status.info_flags))

    print('Power up radio...')
    radio.power_up(func)

    func_info = radio.func_info()
    print('Func: ext %d branch %d int %d patch %d func %d (%s)' % (
                            func_info.revext, func_info.revbranch,
                            func_info.revint, func_info.patch, func_info.func,
                            func_info.image))

    chip_status = radio.get_chip_status()
    print('Chip status: 0x%02x  Info flags: 0x%02x' % (
                            chip_status.chip_status, chip_status.info_flags))

    radio.close()

def command_peek(addr, func):
    radio = EZRadioPRO()
    radio.open()
    radio.reset()
    radio.power_up(func)
    print('0x%02x' % radio.peek(addr))
    radio.close()

def command_dump(args):
    radio = EZRadioPRO()
    radio.open()
    radio.reset()
    radio.power_up(args.func)

    dump = []
    if args.code == True:
        dump = radio.dump_code(args.start, args.end)
    elif args.xdata == True:
        dump = radio.dump_xdata(args.start, args.end)
    elif args.pdata == True:
        dump = radio.dump_pdata(args.start, args.end)
    elif args.sfr == True:
        dump = radio.dump_sfr(args.start, args.end)
    elif args.memctl == True:
        dump = radio.dump_memctl(args.start, args.end)
    elif args.spidma == True:
        dump = radio.dump_spidma(args.start, args.end)
    else:
        dump = radio.dump(args.start, args.end)

    if args.dump == 'hex':
        if args.out is None:
            print(dump_to_hex(dump, args.start))
        else:
            args.out.write(dump_to_hex(dump, args.start))
            args.out.close()
    elif args.dump == 'bin':
        if args.out is None:
            print('use -o to specify output file to dump binary data')
        else:
            args.out.write(bytearray(dump))
            args.out.close()

    radio.close()

def arg_address(x):
    addr = int(x, 0)
    if (addr < 0) or (addr > 0xffff):
        msg = '%r is outside of valid address range (0-0xffff)' % x
        raise argparse.ArgumentTypeError(msg)
    return addr

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--dump', choices=['hex', 'bin'],
                        help='dump memory of radio IC as hex or bin')
    parser.add_argument('--start', type=arg_address, default=0,
                        help='start address for dump, for example 0x0100')
    parser.add_argument('--end', type=arg_address,
                        help='end address for dump, for example 0x1000')
    parser.add_argument('--code', action='store_true',
                        help='dump CODE address space')
    parser.add_argument('--xdata', action='store_true',
                        help='dump XDATA address space')
    parser.add_argument('--pdata', action='store_true',
                        help='dump PDATA address space')
    parser.add_argument('--sfr', action='store_true',
                        help='dump SFR address space')
    parser.add_argument('--memctl', action='store_true',
                        help='dump MEMCTL address space')
    parser.add_argument('--spidma', action='store_true',
                        help='dump SPI_DMA address space')
    parser.add_argument('-o', '--out', type=argparse.FileType('wb', 0),
                        help='output file for dump command')
    parser.add_argument('-p', '--peek', type=arg_address,
                        help='peek memory at address')
    parser.add_argument('-f', '--func', type=int, default=1,
                        help='select func image for power-up')
    parser.add_argument('-i', '--info', action='store_true',
                        help='return information about radio IC')
    args = parser.parse_args()

    if args.info == True:
        command_info(args.func)
    elif args.peek is not None:
        command_peek(args.peek, args.func)
    elif args.dump is not None:
        command_dump(args)
    else:
        parser.print_usage()
