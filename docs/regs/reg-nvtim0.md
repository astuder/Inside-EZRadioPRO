# Non-volatile memory access timing - fine

100ns resolution timing for accessing NVM. Set to 10 for first access during boot, then set using value retrieved from NVM address 0x5501.

After power up, the value stored in prop:OTP_VARS_NVM_TIMING is used.

According to the documentation of prop:OTP_VARS_NVM_TIMING, this register defines the number of MCU cycles per 100ns, which would imply an MCU clock of up to 100 MHz!
