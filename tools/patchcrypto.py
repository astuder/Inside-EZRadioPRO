# Decoding and encoding EZRadioPRO patches - requires a copy of the ROM of the target device

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
            print('crc: {:02X}, {:02X}, {:02X}, {:02X}'.format(self.crc[0], self.crc[1], self.crc[2], self.crc[3]))
            print('idx1: {:04X}'.format(self.idx1))
            print('idx2: {:04X}'.format(self.idx2))
            print('e: {:02X}'.format(self.e))

    def decode_byte(self, byte):
        # decrypt byte
        val = RAM[self.idx2 + self.e]
        self.e ^= val ^ byte
        val ^= RAM[self.idx1 + val] ^ self.crc[0] ^ byte
        self.update_crc(val)

        if self.debug == True:
            print('{:02x} => {:02x}'.format(byte, val))
            print('crc: {:02X}, {:02X}, {:02X}, {:02X}'.format(self.crc[0], self.crc[1], self.crc[2], self.crc[3]))
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

    def encode_byte(self, byte):
        # decrypt byte        
        val = RAM[self.idx2 + self.e]
        self.e ^= val
        val ^= RAM[self.idx1 + val] ^ self.crc[0] ^ byte
        self.e ^= val
        self.update_crc(byte)


        if self.debug == True:
            print('{:02x} => {:02x}'.format(byte, val))
            print('crc: {:02X}, {:02X}, {:02X}, {:02X}'.format(self.crc[0], self.crc[1], self.crc[2], self.crc[3]))
            print('idx1: {:04X}'.format(self.idx1))
            print('idx2: {:04X}'.format(self.idx2))
            print('e: {:02X}'.format(self.e))

        return val

    def encode_buffer(self, buffer, mask):
        out = []
        for b in buffer:
            if mask & 0x01:
                out.append(self.encode_byte(b))
            else:
                out.append(b)
            mask = mask >> 1
        return out

    def update_crc(self, val):
        # update CRC
        tmp1 = (self.crc[1] >> 1) ^ self.crc[1]
        tmp2 = (((self.crc[0] >> 1) | (self.crc[1] << 7)) ^ self.crc[0]) & 0xff
        self.crc[0] = self.crc[1]
        self.crc[1] = self.crc[2]
        self.crc[2] = (((tmp2 >> 1) | (tmp1 << 7)) ^ self.crc[3]) & 0xff
        self.crc[3] = val

    def get_crc(self):
        return self.crc[0]*256 + self.crc[1]

def hex_list(data, prefix=''):
    hex_str = ''
    for b in data:
        if hex_str == '':
            hex_str += '{}{:02X}'.format(prefix, b)
        else:
            hex_str += ',{}{:02X}'.format(prefix, b)
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

    parser = argparse.ArgumentParser(description='EZRadioPRO patch decryption and encryption.')
    parser.add_argument('rom', type=argparse.FileType('rb'),
                        help='Path and name of a binary dump of CODE address space to extract ROM data.')
    parser.add_argument('patch', type=argparse.FileType('r'),
                        help='Path and name of patch file to decrypt or encrypt.')
    parser.add_argument('-o', '--out',
                        help='Path and name to save decrypted/encrypted patch file.')
    parser.add_argument('-e', '--encrypt', action='store_true', default=False,
                        help='Encode patch.')
    args = parser.parse_args()

    if not args.out is None:
        try:
            outfile = open(args.out, 'w')
        except:
            print('Failed to open output file.')
            exit()
    else:
        outfile = None

    # load boot rom into RAM array
    rom_dump = args.rom.read()
    args.rom.close()
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
            params = []
            for i in items:
                params.append(int(i, 16))
            cmd = params[0]
            if cmd == PATCH_IMAGE:
                print('CMD: PATCH_IMAGE')
                flags = params[1]
                verify_crc = (flags >> 5) & 1 == 1
                crc = params[2]*256 + params[3]
                key1 = params[6]
                key2 = params[7]
                print('CRC: {:04X}'.format(crc))
                print('VERIFY_CRC: {}'.format(verify_crc))
                print('KEYS: {:02X}, {:02X}'.format(key1, key2))
                print()
                crypto.init(key1, key2)
            elif cmd == PATCH_ARGS:
                print('CMD: PATCH_ARGS')
                if args.encrypt == True:
                    params = crypto.encode_buffer(params, 0x3e)
                    params[6] = crypto.get_crc() >> 8
                    params[7] = crypto.get_crc() & 0xff
                else:
                    params = crypto.decode_buffer(params, 0x3e)
                pip = params[1]
                dest_addr = params[3]*256 + params[4]
                crc = params[6]*256 + params[7]
                print('PIP: {:02X}'.format(pip))
                print('DEST_ADDR: {:04X}'.format(dest_addr))
                print('CRC: {:04X} (actual: {:04X})'.format(crc, crypto.get_crc()))
                print()
                if args.encrypt == False:
                    if pip > 1:
                        print('ERROR: PIP > 1')
                        exit()
                    if verify_crc == True and crc != crypto.get_crc():
                        print('ERROR: INVALID CRC')
                        exit()
            elif cmd == PATCH_COPY or cmd == PATCH_COPY2:
                print('CMD: PATCH_COPY')
                if args.encrypt == True:
                    params = crypto.encode_buffer(params, 0xfe)
                    params[0] = (params[0] & 0xf7) | ((crypto.get_crc() & 1) << 3)
                else:
                    params = crypto.decode_buffer(params, 0xfe)
                crc_lsb = (params[0] >> 3) & 1
                src_addr = params[1]*256 + params[2]
                dest_addr = params[3]*256 + params[4]
                count = params[5]*256 + params[6]
                print('CRC_LSB: {}'.format(crc_lsb))
                print('SRC_ADDR: {:04X}'.format(src_addr))
                print('DEST_ADDR: {:04X}'.format(dest_addr))
                print('COUNT: {:04X}'.format(count))
                print()
                if args.encrypt == False:
                    if verify_crc == True and crc_lsb != crypto.get_crc() & 1:
                        print('ERROR: INVALID CRC')
                        exit()
            elif cmd & 0xf0 == PATCH_DATA:
                print('CMD: PATCH_DATA')
                if args.encrypt == True:
                    params = crypto.encode_buffer(params, 0xfe)
                    params[0] = (params[0] & 0xf7) | ((crypto.get_crc() & 1) << 3)
                else:
                    params = crypto.decode_buffer(params, 0xfe)
                crc_lsb = (params[0] >> 3) & 1
                count = params[0] & 0x7
                data = params[1:count+1]
                print('CRC_LSB: {} (actual: {})'.format(crc_lsb, crypto.get_crc() & 1))
                print('COUNT: {}'.format(count))
                print('DATA: {}'.format(hex_list(data)))
                print()
                if args.encrypt == False:
                    if verify_crc == True and crc_lsb != crypto.get_crc() & 1:
                        print('ERROR: INVALID CRC')
                        exit()
            if not outfile is None:
                print(hex_list(params, '0x'), file=outfile)

    if not outfile is None:
        outfile.close()
