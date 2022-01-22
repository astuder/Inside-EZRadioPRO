# Notes

Use argument stream to pass 16-bit memory addresses (MSB, LSB). Up to 7 addresses can be read per invocation. Data read is returned in reply stream. 

## Errors

* `CMD_ERROR_BAD_COMMAND`: PEEK command is disabled
* `CMD_ERROR_BAD_ARG`: invalid address

## Address Ranges

* 0x0000-0x0000: always returns 0x00
* 0x0001-0x00ff: `SFR`, starts at 0x80, lower half is mirror, uses reg:DSROP
* 0x0100-0x51ff: `XDATA`, details see below
* 0x5200-0x54ff: `IMEM`, msb of address is ignored, repeats after 0x5300
* 0x5500-0x74ff: `NVRAM`, uses mod:MEMCTL DMA, details see below
* 0x7500-0xdfff: reads `address - 0x6b00` (translates to 0x0a00-0x74ff) with mod:MEMCTL DMA
* 0xe000-0xf0ff: `ACFG` cache, msb address is ignored, repeats after 0xe100, equivalent to `XDATA` 0x0798-0x0897
* 0xf100-0xffff: invalid address

### XDATA peek range
* 0x0100-0x07ff: XDATA (RAM)
* 0x0800-0x3fff: mirror ROM 0x8800-0xbfff
* 0x4000-0x47ff: mirror XDATA 0x0000-0x07ff
* 0x4800-0x48ff: ???
* 0x5000-0x51ff: XREG

### NVRAM peek range
* tbd
