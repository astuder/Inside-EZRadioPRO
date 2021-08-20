# Inside the Silicon Labs EZRadioPRO

Reverse engineering the SiLabs EZRadioPRO family of RF ICs with the goal of writing custom firmware patches.

To avoid copyright violations, this repository does not contain firmware images or documents auto-generated from SiLabs binaries. Use the provided Python scripts to extract firmware images or generate documentation.

Pull requests are welcome, especially [reverse engineering notes](docs/regs) that augment documentation.

## Progress

- Dump all memory address spaces, including CODE and NVM
  - Si4362-B1B, Si4362-C2A, Si4460-C2A, Si4463-B1B, Si4467-A2A
- Run custom code on radio IC
- Analyze and annotate large parts of the firmware using radare2
  - Si4362-C2A: bootloader, main application image (FUNC1)
- Found [internal documentation](docs/wds-xml-docs.md) for API and registers hidden in WDS
- Created [tooling](ghidra) for firmware analysis with Ghidra

## Documentation

- [Register and API documentation](docs/wds-xml-docs.md) generated from data hidden in WDS, augmented with RE notes
- [List of API commands](docs/api-cmd.md) in different modes, including undocumented commands
- [Memory map](docs/memory-map.md)
- [Bootloader](docs/boot.md)
- [Talks](talks)

## Tools

- [tools/ezradiopro.py](tools/README.md#ezradiopropy): Python library and command line tool to talk to radio, dump memory and upload custom code.
- [docs/generate-docs.py](docs/generate-docs.py): Python script generating HTML documentation from information hidden in SiLabs WDS executable.
- [tools/wds-xml-extract.py](tools/README.md#wds-xml-extractpy): Python script to extract XML files with internal documentation hidden in SiLabs WDS.
- [tools/patchcrypto.py](tools/README.md#patchcryptopy): Python script to decrypt and encrypt firmware patches.
- [tools/ihex2patch.py](tools#ihex2patchpy): Python script to create patch file from Intel hex file.
- [ghidra](ghidra): Tooling to analyze dumped firmware with [Ghidra](https://ghidra-sre.org/), including custom processor definition for 8051 core and plugin to import EZRadioPRO registers
- [radare2](radare2): Tooling to analyze dumped firmware with [radare2](https://github.com/radareorg/radare2), including firmware annotations.

## Findings

The digital portion of the radio is run by an 8051 core, which implements:
- [Boot and power up process](docs/boot.md)
- Most of the SPI API (exceptions: CTS, FIFO read/write, FRR access)
- Device state machine and interrupts, watchdog timer, IRCAL, channel hopping
- Majority of packet handler functionality

The remaining functionality is implemented in hardware: 
- SPI communication is handled by a [dedicated peripheral](docs/regs/mod-spi.md) using [DMA](docs/regs/mod-spi_dma.md) to interact with 8051 address space.
- GPIO seems to be controlled by multiplexers, with only indirect ways for the 8051 MCU to interact with pins.
- According to [patents](https://patents.google.com/patent/US8050313B2), the RF modem is implemented with a DSP. No access to DSP RAM or firmware has been found (yet).

Members of the EZRadio and EZRadioPRO product families share the same silicon die, and are differentiated at the factory through on-time programming (OTP) of non-volatile memory (NVM). See also [this patent](https://patents.google.com/patent/US7613913B2/en). Evidence for this conclusion includes:
- Register maps and firmware ROM are identical across parts of the same revision (B1B, C2A/A2A), but differ significantly between older B1B and newer C2A/A2A parts.
- Code in RAM is identical among the C2A parts investigated, with small differences compared to A2A parts.
- Code in RAM, hardware presets and calibration data is copied from NVM during boot and power up.
- Content of NVM is significantly different between C2A and A2A parts.
- NVM organization and locking is similar to what's described in application note [AN518 Si4010 Memory Overlay Technique](https://www.silabs.com/documents/public/application-notes/AN518.pdf).
- The firmware of EZRadioPRO parts includes code for EZConfig commands, which are only documented for the EZRadio product family (Si4355, Si4455)
- The string `si4440` found towards the end of the firmware ROM matches die marking [found on Si4362-C2A](https://github.com/astuder/Inside-EZRadioPRO/blob/master/img/Si4362-C2A-marking.jpg). It also was found in the Si4355 by [TechInsights](http://www.techinsights.com/reports-and-subscriptions/open-market-reports/Report-Profile/?ReportKey=FAR-1606-804).
