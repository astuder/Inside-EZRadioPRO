### RXCLK_IRPT_SRC 

Source for RX CLK interrupt.

* 0 when prop:MODEM_MDM_CTRL `FIFO_SRC_SEL` is packet handler
* 2 when prop:MODEM_MDM_CTRL `FIFO_SRC_SEL` is phase samples

The interrupt driven by this source is enabled by setting `RX_CLK_OR_TXBITCLK_IRPT_EN` (bit 0) in reg:MODEMRPT_EN.
