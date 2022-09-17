# OTP charge pump control

## VDDIO

Set during boot to `3` before enabling reg:ANA_MISC2 `ENREG_CPOTP`. Later set to a value read from NCM address 0x5503, or to `7` if NVM content is `0` or invalid.
