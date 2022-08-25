# Modem Interrupt Enable

Enable register for modem interrupts. Interrupts are handled by interrupt vector `INT_MODEM` (0x0007). 

These interrupts are gated globally by `MODEME` (bit 1) in reg:IE.

In case of an interrupt, use reg:MODEMRPT_STUS to determine source.

### RSSI_IRPT_EN - RSSI Threshold Interrupt Enable

Interrupt when RSSI exceeds a given threshold. See prop:MODEM_RSSI_THRESH.

### RX_CLK_OR_TXBITCLK_IRPT_EN - RX and TX Clock Interrupt Enable

For RX, the source of this interrupt is controlled by `RXCLK_IRPT_SRC` in reg:DUTY_CYCLING.
