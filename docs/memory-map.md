# Memory map

| Start | End | Size | Type | Description |
| --- | --- | --- | --- | --- |
| 0x0000 | 0x07ff | 2 KB | RAM | |
| 0x5000 | 0x51ff | 512 B | XREG | |
| 0x5400 | 0x54ff | 256 B | IDATA | mirror |
| 0x5500 | 0x74ff | 8 KB | NVRAM | Located at 0xc000 for B0B/B1B parts |
| 0x8000 | 0xffff | 32 KB | ROM | Only 16 KB for B0B/B1B parts |

In addition, there are the usual 8051 address spaces (IDATA, SFR).

## Si4x6x-C2A

| Start | End | Type | Description |
| --- | --- | --- | --- |
| 0x0000 | 0x0056 | RAM | Interrupt vector table |
| 0x0058 | 0x02ea | RAM | Firmware jump table |
| 0x02eb | 0x03b5 | RAM | Firmware patches |
| 0x03b6 | 0x051d | RAM | unused |
| 0x051e | 0x07ef | RAM | Firmware variables (prop groups, FIFO, DSP cache, cal data, ...) |
| 0x07f0 | 0x07ff | RAM | Part info |
| | | | --- |
| 0x5000 | 0x50ff | XREG | Registers, also mapped to PDATA (movx @rn) |
| 0x5100 | 0x5121 | XREG2 | More registers |
| | | | --- |
| 0x5400 | 0x54ff | IDATA | Mirror of IDATA address space |
| 0x5500 | 0x55ff | NVRAM | Part info, DSP defaults, cal data, .. |
| 0x5600 | 0x56ff | NVRAM | Bootloader setup script |
| 0x5700 | 0x74bf | NVRAM | FUNC image descriptors and scripts |
| 0x74c0 | 0x74ff | NVRAM | Production data? |
| | | | --- |
| 0x8000 | 0x876f | ROM | Bootloader |
| 0x8770 | 0xfffc | ROM | Firmware |
| 0xfffd | 0xffff | ROM | ROM rev, chip rev |

## Si446x-A2A

In normal operation (FUNC 1), the memory map of A2A and C2A parts is identical, except for the space occupied by firmware patches:

| Start | End | Type | Description |
| --- | --- | --- | --- |
| 0x02eb | 0x0465 | RAM | Firmware patches |
| 0x0466 | 0x051d | RAM | unused |

Si446x-A2A parts include undocumented FUNC images 2 and 3.

### FUNC 2

tbd

### FUNC 3

tbd
