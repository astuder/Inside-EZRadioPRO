# Memory map

| Start | End | Size | Type | Description |
| --- | --- | --- | --- | --- |
| 0x0000 | 0x07ff | 2 KB | RAM | |
| 0x5000 | 0x51ff | 512 B | XREG | |
| 0x5400 | 0x54ff | 256 B | INTMEM | mirror |
| 0x5500 | 0x74ff | 8 KB | NVM/OTP | Located at 0xc000 for B0B/B1B parts |
| 0x8000 | 0xffff | 32 KB | ROM | Only 16 KB for B0B/B1B parts |

In addition, there are the usual 8051 address spaces (INTMEM, SFR).

## Si4x6x-C2A

| Start | End | Type | Description |
| --- | --- | --- | --- |
| 0x0000 | 0x0052 | RAM | Interrupt vector table |
| 0x0058 | 0x02ea | RAM | Firmware jump table |
| 0x02eb | 0x03b5 | RAM | Firmware patches |
| 0x03b6 | 0x051d | RAM | unused |
| 0x051e | 0x07ef | RAM | Firmware variables (prop groups, FIFO, ACFG cache, cal data, ...) |
| 0x07f0 | 0x07ff | RAM | Part info |
| | | | --- |
| 0x5000 | 0x50ff | XREG | Registers, also mapped to PDATA (movx @rn) |
| 0x5100 | 0x5121 | XREG2 | More registers |
| | | | --- |
| 0x5400 | 0x54ff | INTMEM | Mirror of INTMEM address space |
| 0x5500 | 0x55ff | NVM/OTP | Part info, ACFG defaults, cal data, .. |
| 0x5600 | 0x56ff | NVM/OTP | Bootloader script (series of SPI API cmds) |
| 0x5700 | 0x74bf | NVM/OTP | FUNC image descriptors and scripts |
| 0x74c0 | 0x74ff | NVM/OTP | Production test data |
| | | | --- |
| 0x8000 | 0x876f | ROM | Bootloader |
| 0x8770 | 0xfff5 | ROM | Firmware |
| 0xfff6 | 0xffff | ROM | Die info (part, ROM ID, chip rev) |

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
