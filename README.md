# Inside the Silicon Labs EZRadioPRO
Reverse engineering the SiLabs EZRadioPRO family of RF ICs with the goal of writing custom firmware patches.

## Progress

- Dump the all memory address spaces, including CODE and NVRAM address spaces.
-- Si4362-B1B, Si4362-C2A, Si4460-A2A, Si4463-B1B, Si4467-A2A
- Run custom code on radio IC
- Analyze and anotate large parts of the firmware using radare2
-- Si4362-C2A: bootloader, main application image (FUNC1)

[To-do list](TODO.md)

## Tools

- [ezradiopro.py](python/ezradiopro.py): Python library and command line tool to talk to radio, dump memory and upload custom code. See --help for usage.
- [find-refs.py](python/find-refs.py): Python script to create r2 xrefs for indirect idata and xreg access
- [radare2](radare2): Scripts to anotate dumped firmware with radare2. Launch with *r2 -a 8051 -i ./radare2/func1-c2a.r2 ./dumps/Si4362-C2A-code.bin*

## Documentation

- [Talks](talks)
