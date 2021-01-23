# Decoding EZRadioPRO patches - requires a copy of the ROM of the target device

import argparse

class Crypto:
    crc = [0,0,0,0]
    idx1 = 0
    idx2 = 0
    e = 0
    debug = False

    def init(self, key1, key2):
        self.crc[0] = key1 ^ ROM_ID
        self.crc[1] = key2 ^ ROM_ID
        self.crc[2] = self.crc[0]
        self.crc[3] = self.crc[1]

        addr = self.crc[0] * 8
        self.idx1 = RAM[addr]*8 + RAM[addr+1]
        addr = self.crc[1] * 8 + 2
        self.idx2 = RAM[addr]*8 + RAM[addr+1]

        self.e = 0

        if self.debug == True:
            print('key: {:02X}, {:02X}, {:02X}, {:02X}'.format(self.crc[0], self.crc[1], self.crc[2], self.crc[3]))
            print('idx1: {:04X}'.format(self.idx1))
            print('idx2: {:04X}'.format(self.idx2))
            print('e: {:02X}'.format(self.e))

    def decode_byte(self, byte):
        # decrypt byte
        val = RAM[self.idx2 + self.e]
        self.e ^= val ^ byte
        val ^= RAM[self.idx1 + val] ^ self.crc[0] ^ byte

        # update CRC
        tmp1 = (self.crc[1] >> 1) ^ self.crc[1]
        tmp2 = (((self.crc[0] >> 1) | (self.crc[1] << 7)) ^ self.crc[0]) & 0xff
        self.crc[0] = self.crc[1]
        self.crc[1] = self.crc[2]
        self.crc[2] = (((tmp2 >> 1) | (tmp1 << 7)) ^ self.crc[3]) & 0xff
        self.crc[3] = val

        if self.debug == True:
            print('{:02x} => {:02x}'.format(byte, val))
            print('key: {:02X}, {:02X}, {:02X}, {:02X}'.format(self.crc[0], self.crc[1], self.crc[2], self.crc[3]))
            print('idx1: {:04X}'.format(self.idx1))
            print('idx2: {:04X}'.format(self.idx2))
            print('e: {:02X}'.format(self.e))            

        return val

    def decode_buffer(self, buffer, mask):
        out = []
        for b in buffer:
            if mask & 0x01:
                out.append(self.decode_byte(b))
            else:
                out.append(b)
            mask = mask >> 1
        return out

    def get_crc(self):
        return self.crc[0]*256 + self.crc[1]

def hex_list(data):
    hex_str = ''
    for b in data:
        if hex_str == '':
            hex_str += '{:02X}'.format(b)
        else:
            hex_str += ',{:02X}'.format(b)
    return hex_str

PATCH_IMAGE = 0x04
PATCH_ARGS = 0x05
PATCH_COPY = 0x06
PATCH_COPY2 = 0x0a
PATCH_DATA = 0xe0

patch_error = False
image_valid = False
patch_func = 0
patch_crc = 0

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='EZRadioPRO patch decryption.')
    parser.add_argument('rom', type=argparse.FileType('rb'),
                        help='Path and name of a binary dump of CODE address space to extract ROM data.')
    parser.add_argument('patch', type=argparse.FileType('r'),
                        help='Path and name of patch file to decode.')
    args = parser.parse_args()

    rom_dump = args.rom.read()
    args.rom.close()

    # load boot rom into RAM array
    print('{} bytes ROM data loaded.'.format(len(rom_dump)))
    RAM = rom_dump[0x8000:0x8900]
    ROM_ID = rom_dump[0xfffe]
    
    # decode patch
    crypto = Crypto()
    for line in args.patch:
        line = line.rstrip()
        if line != '' and line[0] != '#':
            print(line)
            items = line.split(',')
            args = []
            for i in items:
                args.append(int(i, 16))
            cmd = args[0]
            if cmd == PATCH_IMAGE:
                print('CMD: PATCH_IMAGE')
                flags = args[1]
                crc = args[2]*256 + args[3]
                key1 = args[6]
                key2 = args[7]                
                print('CRC: {:04X}'.format(crc))
                print('VERIFY_CRC: {}'.format((flags >> 5) & 0x01))
                print('KEYS: {:02X}, {:02X}'.format(key1, key2))
                print()
                crypto.init(key1, key2)
            elif cmd == PATCH_ARGS:
                print('CMD: PATCH_ARGS')
                args = crypto.decode_buffer(args, 0x3e)
                pip = args[1]
                dest_addr = args[3]*256 + args[4]
                crc = args[6]*256 + args[7]
                print('PIP: {:02X}'.format(pip))
                print('DEST_ADDR: {:04X}'.format(dest_addr))
                print('CRC: {:04X} (actual: {:04X})'.format(crc, crypto.get_crc()))
                print()
                if pip > 1:
                    print('ERROR: PIP > 1')
                    exit()
            elif cmd == PATCH_COPY or cmd == PATCH_COPY2:
                print('CMD: PATCH_COPY')
                args = crypto.decode_buffer(args, 0xfe)
                crc_lsb = (args[0] >> 3) & 1
                src_addr = args[1]*256 + args[2]
                dest_addr = args[3]*256 + args[4]
                count = args[5]*256 + args[6]
                print('CRC_LSB: {}'.format(crc_lsb))
                print('SRC_ADDR: {:04X}'.format(src_addr))
                print('DEST_ADDR: {:04X}'.format(dest_addr))
                print('COUNT: {:04X}'.format(count))
                print()
            elif cmd & 0xf0 == PATCH_DATA:
                print('CMD: PATCH_DATA')
                args = crypto.decode_buffer(args, 0xfe)
                crc_lsb = (args[0] >> 3) & 1
                count = args[0] & 0x7
                data = args[1:count+1]
                print('CRC_LSB: {} (actual: {})'.format(crc_lsb, crypto.get_crc() & 1))
                print('COUNT: {}'.format(count))
                print('DATA: {}'.format(hex_list(data)))
                print()
