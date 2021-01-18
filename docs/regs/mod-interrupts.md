# Interrupt Controller
Interrupt vectors start at `RAM:0007`, or `RAM:8007` for the bootloader, in the same order as their respective flags in `reg:IE`, `reg:EIE1` and `reg:EIE2`.
