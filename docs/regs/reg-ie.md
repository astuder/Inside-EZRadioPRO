# Interrupt Enable

### GIE - Global Interrupt Enable

Enable and disable all interrupts. When `GIE=0` no interrupt is active. When `GIE=1` the individually enabled interrupts are active.

### MODEME - Modem Interrupt Enable

Enable and disable interrupts from the mod:MODEM peripheral. See reg:MODEMRPT_EN for granular interrupt control.
