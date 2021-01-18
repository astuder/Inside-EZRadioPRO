To reset a specific parts of the SPI DMA, set the respective flags and then wait until the register goes back to 0.

To reset RX FIFO, the EZRadioPRO firmware first sets `RD_DMA_CLEAN|DMARD_2SPI_CLEAN|SPI_RDBUFF_CLEAN`, waits for `DMA_RST==0`, and then sets `SPI_RDBUFF_CLEAN` a second time.

To reset TX FIFO, the EZRadioPRO firmware sets `WR_DMA_CLEAN|SPI_WRBUFF_CLEAN`.