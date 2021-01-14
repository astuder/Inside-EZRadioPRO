# Ghidra tooling

This tooling was tested with Ghidra 9.2.

## si4440 processor

The EZRadioPRO runs on an 8051 core that is slightly different from the standard 8051 supported by Ghidra. We created a custom 8051 variant si4440 to ease reverse engineering of EZRadioPRO firmware:

- Code and external memory share the same 16 bit address space (RAM:)
- `MOVX @Ri` uses `XPAGE` SFR to determine MSB of 16 bit address (hard-coded to `0x5000`)
- Only 1 memory mapped register bank to free INTMEM used for variables
- Dropped unsupported 8051 SFR's 
- Mapped SFR bits for A, B, IE, IP and PSW
- Added entry points for reset, boot loader, interrupt vectors

To add the si4440 variant to a Ghidra installation, copy the contents of the folder [`./8051`](8051) into
`{ghidra-root}/Ghidra/Processors/8051/data/languages`. This will replace 2 existing files (`8051.ldefs`, `8051_main.sinc`)
and add 3 new files. 

After the next restart of Ghidra, si4440 will be available as 8051 variant:
![Ghidra dialog for selecting processor](../img/ghidra-8051-si4440.png)

As this processor has a flat 16 bit address space, we recommend using full 64 KB dumps of CODE or XMEM address space for firmware analysis.

## EZRadioPRO importer

The Python script [EZRadioPROimport.py](EZRadioPROimport.py) is a Ghidra plugin to import EZRadioPRO registers into a Ghidra program. It extracts [data hidden in Silabs WDS](../docs/wds-xml-docs.md), which includes register addresses and names.

For each register the script
- creates a label
- adds plate comment documenting register fields
- if applicable creates enum 
- assigns byte or enum data type

To add this script to your Ghidra installation, copy `EZRadioPROimport.py` into `{USER_HOME}/ghidra_scripts`.

The script will show up in the Script Manager under the category `Silabs`. Or simply filter for `ezradio` to locate the script.

When running the script, you will be prompted to locate `NewWDS.exe`. After reading the file, you are prompted to select the Silabs part number and revision.

Note:
- it's recommended to use the 8051 si4440 processor variant
- this script will replace existing labels
- this script is designed to be run repeatedly

Future versions of this script may import additional data. 