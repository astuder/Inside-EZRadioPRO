# Radare2 tooling

**no longer maintained - current focus is on [Ghidra](../ghidra)**

*These scripts include a lot of (wrong) guesswork as they were created before discovering the documentation hidden in WDS.*

The `*.r2` files are radare2 scripts with labels, functions and comments to annotate firmware dumps. 

Files starting with `func` and `boot` are for different POWER_UP modes. They will include the other files as needed.

Launch: `r2 -a 8051 -i func1-c2a.r2 ./dumps/Si4362-C2A-code.bin`

Use Vp command to explore.

[/radare2/find-refs.py](find-refs.py) is a python script to create r2 xrefs for indirect data and register access.
