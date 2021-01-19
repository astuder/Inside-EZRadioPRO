# Memory Controller
The Memory Controller peripheral transfers data from ROM and one-time programmable (OTP) non-volatile memory (NVM) into the 8051 RAM address space.

It is used during the boot process to copy device and calibration data from NVM into RAM. It is also used by the cmd:POWER_UP command to initialize the selected FUNC image, as well as various PATCH commands.
