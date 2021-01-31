# Install EZRadioPRO firmware patch

import argparse
from ezradiopro import EZRadioPRO

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Install EZRadioPRO firmware patch.')
    parser.add_argument('patch', type=argparse.FileType('r'),
                        help='Path and name of patch file to install.')
    args = parser.parse_args()

    patch_data = []
    for line in args.patch:
        if line.startswith('0x'):
            patch_entry = []
            for val in line.rstrip().split(','):
                patch_entry.append(int(val, 16))
            patch_data.append(patch_entry)

    radio = EZRadioPRO()
    radio.open()
    radio.reset()

    print('installing patch..')
    for entry in patch_data:
        radio.command(entry[0], entry[1:], 2)
        
    print('power up radio..')
    radio.power_up(0x80 + 63)
    print('checking radio status..')
    status = radio.get_chip_status()
    print('done')

    radio.close()