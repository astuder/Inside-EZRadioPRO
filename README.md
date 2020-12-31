# Inside the Silicon Labs EZRadioPRO

Reverse engineering the SiLabs EZRadioPRO family of RF ICs with the goal of writing custom firmware patches.

To avoid copyright violations, this repository does not contain firmware images. Use the provided tools to extract and analyze your own images.

The recording of my talk about this project at the 2018 radare2 conference is now available on YouTube:
https://www.youtube.com/watch?v=iu_TeS0ahi8

Pull requests are welcome.

## Progress

- Dump all memory address spaces, including CODE and NVRAM
  - Si4362-B1B, Si4362-C2A, Si4460-C2A, Si4463-B1B, Si4467-A2A
- Run custom code on radio IC
- Analyze and annotate large parts of the firmware using radare2
  - Si4362-C2A: bootloader, main application image (FUNC1)
- Found internal documentation for API and registers hidden in WDS

[To-do](TODO.md)

## Findings

The digital portion of the radio is run by an 8051 core, which implements:
- Boot and power up process
- Most of the SPI API (exceptions: CTS, FIFO read/write, FRR access)
- Device state machine and interrupts, watchdog timer, IRCAL, channel hopping
- Majority of packet handler functionality

The remaining functionality is implemented in hardware: 
- SPI communication is handled by a dedicated peripheral using DMA to interact with 8051 address space.
- GPIO seems to be controlled by multiplexers, with only indirect ways for the 8051 MCU to interact with pins.
- According to [patents](https://patents.google.com/patent/US8050313B2), the RF modem is implemented with a DSP. No access to DSP RAM or firmware has been found (yet).

It is likely, that members of the EZRadio and EZRadioPRO product families share the same silicon die, and are differentiated at the factory through programming of the NVRAM. See also [this patent](https://patents.google.com/patent/US7613913B2/en). Evidence for this conclusion includes:
- The firmware ROM is identical for all C2A and A2A parts, but significantly changes from older B1B to the newer C2A/A2A parts.
- Code in RAM is identical among the C2A parts investigated, with small differences compared to A2A parts.
- Code in RAM, hardware presets and calibration data is copied from NVRAM during boot and power up.
- NVRAM organization and locking is similar to what's described in application note [AN518 Si4010 Memory Overlay Technique](https://www.silabs.com/documents/public/application-notes/AN518.pdf).
- The firmware includes code for EZConfig commands, which are only documented for the EZRadio product family (Si4355, Si4455)
- The string ```si4440``` found towards the end of the firmware ROM matches die marking [found on Si4362-C2A](https://github.com/astuder/Inside-EZRadioPRO/blob/master/docs/Si4362-C2A-marking.jpg). It also was found in the Si4355 by [TechInsights](http://www.techinsights.com/reports-and-subscriptions/open-market-reports/Report-Profile/?ReportKey=FAR-1606-804).


## Tools

- [/python/ezradiopro.py](python/wds-xml-extract.py): Python script to extract XML files with internal documentation hidden in SiLabs WDS.
- [/python/ezradiopro.py](python/ezradiopro.py): Python library and command line tool to talk to radio, dump memory and upload custom code. See [readme](python/README.md) for usage.
- [/radare2/*.r2](radare2): Scripts to process dumped firmware with [radare2](https://github.com/radare/radare2). Launch with *r2 -a 8051 -i ./radare2/func1-c2a.r2 ./dumps/Si4362-C2A-code.bin*. Use Vp command to explore.
- [/python/find-refs.py](python/find-refs.py): Python script to create r2 xrefs for indirect data and register access

## Documentation

- [Memory map](docs/memory-map.md)
- [API commands](docs/api-cmd.md)
- [SPI peripheral](docs/spi.md)
- [Talks](talks)
