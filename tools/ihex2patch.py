# Create EZRadioPRO patches from ihex files

import argparse
from patchcrypto import Crypto

def parse_ihx(file):
    fragments = []
    count = 0
    for line in file:
        count += 1
        if not line.startswith(':'):
            print('ERROR: File is not Intel hex format.')
            return None
        line = line.rstrip()
        checksum = 0
        for c in range(1, len(line), 2):
            checksum += int(line[c:c+2], 16)
        if (checksum & 0xff) != 0x00:
            print('ERROR: Invalid checksum in line {}.'.format(line))
            return None
        length = int(line[1:3], 16)
        address = int(line[3:7], 16)
        record_type = int(line[7:9], 16)
        if record_type == 0:
            # data record
            data_str = line[9:-2]
            data = []
            for i in range(0, len(data_str), 2):
                data.append(int(data_str[i:i+2], 16))
            fragment = {}
            fragment['length'] = length
            fragment['address'] = address
            fragment['data'] = data
            fragments.append(fragment)
        elif record_type == 1:
            # end of file
            return fragments
        else:
            print('WARNING: Unhandled record type {:2X}'.format(record_type))
    print('ERROR: Missing EOF record.')
    return None

def hex_list(data, prefix=''):
    hex_str = ''
    for b in data:
        if hex_str == '':
            hex_str += '{}{:02X}'.format(prefix, b)
        else:
            hex_str += ',{}{:02X}'.format(prefix, b)
    return hex_str

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Create EZRadioPRO patch from ihex file.')
    parser.add_argument('rom', type=argparse.FileType('rb'),
                        help='Path and name of a binary dump of CODE address space to extract ROM data.')
    parser.add_argument('ihex', type=argparse.FileType('r'),
                        help='Path and name of ihex file to convert into patch.')
    parser.add_argument('-o', '--out',
                        help='Path and name to save patch file.')
    parser.add_argument('-f', '--func', type=int, default=1,
                        help='FUNC image number for patch')
    parser.add_argument('-c', '--crc', type=lambda x: int(x,0),
                        help='CRC of FUNC image loaded from NVM. Optional, useful to avoid patching unsupported chip rev.')
    parser.add_argument('-n', '--nonvm', action='store_true', default=False,
                        help='Don\'t load FUNC image from NVM.' )
    parser.add_argument('-k', '--key', type=lambda x: int(x,0), default=0x1337,
                        help='Encryption key to use for patch (0-65535).')
    args = parser.parse_args()

    if not args.out is None:
        try:
            outfile = open(args.out, 'w')
        except:
            print('ERROR: Failed to open output file.')
            exit()
    else:
        outfile = None

    # process ihex file
    fragments = parse_ihx(args.ihex)
    if fragments is None or len(fragments) == 0:
        # nothing to process
        print('ERROR: No data to create patch from.')
        exit()

    # load boot rom into RAM array
    rom_dump = args.rom.read()
    args.rom.close()
    print('{} bytes ROM data loaded.'.format(len(rom_dump)))

    key1 = (args.key >> 8) & 0xff
    key2 = args.key & 0xff

    # decode patch
    crypto = Crypto()
    crypto.load_rom(rom_dump)
    crypto.init(key1, key2)

    PATCH_IMAGE = 0x04
    PATCH_ARGS = 0x05
    PATCH_DATA = 0xe0

    patch = []

    flags = 0x00
    if args.crc is None:
        func_crc = 0
    else:
        func_crc = args.crc & 0xffff
        flags |= 0x20
    if args.nonvm == True:
        flags |= 0x10
    if args.func < 0x10:
        flags |= args.func
    else:
        print('ERROR: FUNC must be < 0x10')
        exit()
    pimage = [ PATCH_IMAGE, flags, func_crc >> 8, func_crc & 0xff, 0, 0, key1, key2 ]
    patch.append( pimage )

    for f in fragments:
        address = f['address'] & 0xffff
        pargs = [ PATCH_ARGS, 1, 0, address >> 8, address & 0xff, 0, 0, 0 ]
        pargs = crypto.encode_buffer(pargs, 0x3e)
        pargs[6] = crypto.get_crc() >> 8
        pargs[7] = crypto.get_crc() & 0xff
        patch.append( pargs)
        
        data = f['data']
        for d in range(0, len(data), 7):
            payload = data[d:d+7]
            length = len(payload)
            if length < 7:
                payload += [0] * (7 - length)
            pdata = [ PATCH_DATA ] + payload
            pdata = crypto.encode_buffer(pdata, 0xfe)
            pdata[0] = PATCH_DATA + ((crypto.get_crc() & 1) << 3) + length
            patch.append(pdata)

    pargs = [ PATCH_ARGS, 0, 0, 0, 0, 0, 0, 0 ]
    pargs = crypto.encode_buffer(pargs, 0x3e)
    pargs[6] = crypto.get_crc() >> 8
    pargs[7] = crypto.get_crc() & 0xff
    patch.append( pargs)

    if not args.out is None:
        try:
            outfile = open(args.out, 'w')
        except:
            print('Failed to open output file.')
            exit()
    else:
        outfile = None

    for p in patch:
        hexstr = hex_list(p, '0x')
        if outfile is None:
            print(hexstr)
        else:
            print(hexstr, file=outfile)

    if not outfile is None:
        print('Success!')
        outfile.close()


