# Tools

This folder contains Python scripts to help with reverse engineering EZRadioPRO radio ICs.

- [wds-xml-extract.py](#wds-xml-extractpy) Script to extract hidden XML files from SiLabs Wireless Development Suite
- [ezradiopro.py](#ezradiopropy) Script and library to interact with EZRadioPRO radio IC from a Raspberry Pi, including dumping firmware
- [patchcrypto.py](#patchcryptopy) Script and library to encrypt and decrypt firmware patches
- [ihex2patch.py](#ihex2patchpy) Script to create encrypted firmware patches from Intel hex files, requires `patchcrypto.py`
- [patchradio.py](#patchradiopy) Script for deploying firmware patch to radio, requires `ezradiopro.py`

## wds-xml-extract.py

Script to extract XML files hidden in Silicon Labs Wireless Development Suite executable.
See [here](../docs/wds-xml-docs.md) for more information about the content of these files.

### Usage

Run the script providing the path to the WDS exectuable as command line parameter. All XML files will be extracted and saved in the current directory.

~~~~
wds-xml-extract.py path-to-wds/NewWDS.exe
~~~~

## ezradiopro.py

Script and library to communicate with EZRadioPRO from a Raspberry Pi.

Use this script to dump the firmware and other address spaces. It also includes
the [class EZRadioPRO](#ezradiopro-class) that can be used in other Python
scripts to interact with the radio.

The Si4362 or Si446x radio must be mounted on a breakout board with an XTAL and power supply decoupling caps.
Breakout boards that were tested include dAISy BoosterPack and E10-M4463D.

### Command Line Options

Output version information about the connected radio IC and its firmware.
~~~~
ezradiopro.py -i
~~~~

Read one byte from radio IC at 16-bit memory address with PEEK command.
~~~~
ezradiopro.py -p 0x1234
~~~~

Dump complete address space using PEEK as binary into file dump.bin.
~~~~
ezradiopro.py -d bin -o dump.bin
~~~~

Dump memory in address range using PEEK as binary into file dump.bin.
~~~~
ezradiopro.py -d bin --start 0x1000 --end 0x1fff -o dump.bin
~~~~

Dump memory in address range using PEEK as hex.
~~~~
ezradiopro.py -d hex --start 0x0100 --end 0x02ff
~~~~

Dump CODE address space into file dump.bin. This file is ready for disassembly
and exploration with tools like [radare2](https://www.radare.org) or
[Ghidra](https://ghidra-sre.org/).

~~~~
ezradiopro.py -d bin --code -o dump.bin
~~~~

Supported address spaces are `--peek` (PEEK API command), `--xdata` (`movx dptr`),
`--pdata` (`movx @r0`), `--code` (`movc dptr`), `--sfr`, `--memctl` ([MEMCTL](../docs/regs/mod-memctl.md)
peripheral) and `--spidma` ([SPI_DMA](../docs/regs/mod-spi_dma.md) peripheral).

Use `--help` to see additional options.

### EZRadioPRO Class

~~~~
from ezradiopro import EZRadioPRO
radio = EZRadioPRO()
radio.open()
radio.reset()
result = radio.command(1, None, 4)
print('Part #: {:04x}'.format(result[1] * 256 + result[2]))
radio.close()
~~~~

### Raspberry Pi to Radio IC Wiring

|RPi Header|Radio IC|
|----|----|
|01 3.3V|6/8 VDD|
|09 GND|PAD GND|
|11 GPIO17|1 SDN|
|12 GPIO18|10 GPIO1/CTS|
|19 GPIO10/SPI_MOSI|14 SDI|
|21 GPIO09/SPI_MISO|13 SDO|
|23 GPIO11/SPI_CLK|12 SCLK|
|24 GPIO08/SPI_CE0_N|15 nSEL|

### Raspberry Pi Prequisites

#### SpiDev Library

~~~~
sudo apt-get install python-dev
git clone https://github.com/doceme/py-spidev.git
cd py-spidev
make
sudo make install
~~~~

#### RPi.GPIO Library

~~~~
sudo apt-get install python-rpi.gpio
~~~~

#### Enable SPI on Raspberry Pi

~~~~
sudo rasp-config
~~~~

Interface Options > SPI -> answer with `Yes`

## patchcrypto.py

The firmware of the EZRadioPRO can be patched during power up. The patch commands are protected by a checksum and partially encrpyted. `patchcrypto.py` decrypts and encrypts firmware patches.

The library also includes the class `Crypto` that can be used in other Python scripts. See [`ihex2patch.py`](ihex2patch.py) for an example of how to use this class.

### Usage

Patches are encrypted using the ROM of the target device as key, the script therefore requires a dump of the `CODE` address space.

To decrypt a patch, run the script providing a binary ROM dump and a patch file. The output file will contain the patch commands with encryption removed.

~~~~
patchcrypto.py rom.bin patch.csg -o output-file
~~~~

To encrypt a patch, run the script providing a binary ROM dump and an unencrypted patch file and the option `-e`. The output file will contain the encrypted patch. CRC fields of the input file are ignored and replaced with the correct values.

~~~~
patchcrypto.py rom.bin unencrypted-patch -o output-file -e
~~~~

For experimentation, a few patch files can be found in `C:\Program Files (x86)\SiliconLabs\WDS3\Patch`.

## ihex2patch.py

Use this Python script to create the encrpyted firmware patch file from an Intel hex file. 

Prerequisites:
* `patchcrypto.py`
* ROM dump of the part to be patched

### Usage

Patches are encrypted using the ROM of the target device as key, the script therefore requires a dump of the `CODE` address space.

The example below creates a patch from an Intel hex file (`.ihx`). 

~~~~
ihex2patch.py romdump.bin myfw.ihx -o myfw.patch
~~~~

Use `--help` to see additional options.

We use the macro assembler included with [SDCC](http://sdcc.sourceforge.net/) to write patches. The following commands compile and link an assembly source file into an Intel hex file.

~~~~
sdas8051 -l -o -s myfw.asm
sdld -i myfw.rel
~~~~

## patchradio.py

Use this Python script to upload a firmware patch to the radio.

Prerequisites:
* `ezradiopro.py`
* Patch file generated with [`ihex2patch.py`](#ihex2patchpy)
