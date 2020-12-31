# Helper scripts

This folder contains Python scripts to help with reverse engineering EZRadioPRO radio ICs.

* [wds-xml-extract.py](#wds-xml-extract.py) Script to extract hidden XML files from SiLabs Wireless Development Suite
* [ezradiopro.py](#ezradiopro.py) Script to dump firmware and other memory content of EZRadioPRO radio IC from a Raspberry Pi

# wds-xml-extract.py

The exectuable of the SiLabs Wireless Development Suite contains hidden XML files. Besides all the information in the official API documentation, these XML files also contain information about:
* Undocumented API commands (e.g. for MFSK TX)
* Undocumented power-up modes (e.g. for IEEE 802.15.4)
* List of register names and fields (8051 SFRs, etc.)

## Usage

Run the script providing the path to the WDS exectuable as command line parameter. All XML files will be extracted and saved in the current directory.

~~~~
wds-xml-extract.py path-to-wds/NewWDS.exe
~~~~

# ezradiopro.py

The Si4362 or Si446x radio must be mounted on a breakout board with an XTAL and power supply decoupling caps.
Breakout boards that were tested include dAISy BoosterPack and E10-M4463D.

## Command Line Options

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
disassembly and exploration with tools like [radare2](http://www.radare.org).
~~~~
ezradiopro.py -d bin --start 0x8000 --end 0xcfff --code -o dump.bin
~~~~

## Raspberry Pi to Radio IC Wiring

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

## Raspberry Pi Prequisites

### SpiDev Library

sudo apt-get install python-dev

git clone https://github.com/doceme/py-spidev.git

cd py-spidev

make

sudo make install

### RPi.GPIO Library

sudo apt-get install python-rpi.gpio

### Enable SPI on Raspberry Pi

sudo rasp-config

Advanced Options > SPI -> set everything to Yes
