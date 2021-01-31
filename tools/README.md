# Tools

This folder contains Python scripts to help with reverse engineering EZRadioPRO radio ICs.

- [wds-xml-extract.py](#wds-xml-extractpy) Script to extract hidden XML files from SiLabs Wireless Development Suite
- [ihex2patch.py](ihex2patch.py) Script to create firmware patches from Intel hex files (**work in progress**)
- [patchcrypto.py](#patchcryptopy) Script to decrypt firmware patches
- [ezradiopro.py](#ezradiopropy) Script to dump firmware and other memory content of EZRadioPRO radio IC from a Raspberry Pi

## wds-xml-extract.py

Script to extract XML files hidden in Silicon Labs Wireless Development Suite executable.
See [here](../docs/wds-xml-docs.md) for more information about the content of these files.

### Usage

Run the script providing the path to the WDS exectuable as command line parameter. All XML files will be extracted and saved in the current directory.

~~~~
wds-xml-extract.py path-to-wds/NewWDS.exe
~~~~

## patchcrypto.py

The firmware of the EZRadioPRO can be patched during power up. The patch commands are protected by a checksum and partially encrpyted. `patchcrypto.py` decrypts and encrypts firmware patches.

### Usage

The algorithm uses ROM content of the target device as encryption key, the script therefore requires a dump of the CODE address space.

To decrypt a patch, run the script providing a binary ROM dump and a patch file. The output file will contain the patch commands with encryption removed.

~~~~
patchcrypto.py rom.bin patch.csg -o output-file
~~~~

To encrypt a patch, run the script providing a binary ROM dump and an unencrypted patch file and the option `-e`. The output file will contain the encrypted patch. CRC fields of the input file are ignored and replaced with the correct values.

~~~~
patchcrypto.py rom.bin unencrypted-patch -o output-file -e
~~~~

For experimentation, a few patch files can be found in `C:\Program Files (x86)\SiliconLabs\WDS3\Patch`.

## ezradiopro.py

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

Dump CODE memory in address range into file dump.bin. This file is ready for
disassembly and exploration with tools like [radare2](https://www.radare.org)
or [Ghidra](https://ghidra-sre.org/).
~~~~
ezradiopro.py -d bin --start 0x8000 --end 0xcfff --code -o dump.bin
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
