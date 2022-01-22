# Memory Controller
The Memory Controller peripheral transfers data from ROM and one-time programmable (OTP) non-volatile memory (NVM) into the 8051 RAM address space.

The memory controller is used during the boot process to copy device and calibration data from NVM into RAM. The cmd:POWER_UP command to initialize the selected FUNC image. The various PATCH commands use the memory controller to write and copy data.

cmd:PEEK address range 0x5500-0x74ff uses the memory controller to read NVM.
