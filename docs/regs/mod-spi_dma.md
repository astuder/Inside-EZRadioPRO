# SPI DMA Controller

The mod:SPI peripheral processes the `READ_RX_FIFO` and `WRITE_TX_FIFO` API commands without invoking the 8051 MCU. The SPI peripheral uses DMA to access RX and TX FIFOs located in the RAM address space of the 8051.

The two FIFO buffers are controlled by two sets of registers. Registers and fields that start with `DMARD` control the RX FIFO, Registers and fields that start with `DMAWR` control the TX FIFO. 

If the commands `READ_RX_FIFO` or `WRITE_TX_FIFO` cause a FIFO underflow or overlow condition, the 8051 will receive a `SPI_ERR` interrupt (vector `INT_SPI_ERR`, `0x002B`).

FIFOs are reset/emptied with flags in reg:DMA_RST.

## RX FIFO

Base address of the RX FIFO buffer is set in reg:DMARD_BASE_LSB and reg:DMA_BASE_MSBS[3:0]. Length (wrap point) of the RX FIFO buffer is set in reg:DMARD_WRPNT_LSB and reg:DMA_WRPNT_MSBS[2:0]. 

The 8051 indicates new data in the RX FIFO by updating (incrementing) reg:DMARD_LIMIT_LSB and reg:DMARD_LIMIT_MSB. When reading data with `READ_RX_FIFO`, the SPI DMA transfers data from RAM, updates reg:DMA_RDOFF_LSBS and reg:DMA_RDOFF_MSBS, and triggers a `DMARD` interrupt (vector `INT_DMARD`, `0x0027`)

The 8051 firmware must ensure that `DMARD_LIMIT` doesn't go past the read offset (`DMA_RDOFF`) and stays within the configured FIFO size (`DMARD_WRPNT`).

## TX FIFO

Base address of the TX FIFO buffer is set in reg:DMAWR_BASE_LSB and reg:DMA_BASE_MSBS[7:5]. Length (wrap point) of the TX FIFO buffer is set in reg:DMAWR_WRPNT_LSB and reg:DMA_WRPNT_MSBS[6:4]. 

When receiving new data with `WRITE_TX_FIFO`, the SPI DMA transfers the data into RAM, updates reg:DMAWR_LIMIT_LSB and reg:DMAWR_LIMIT_MSB, and triggers a `DMAWR` interrupt (vector `INT_DMAWR`, `0x0023`). When consuming data from the FIFO, the 8051 firmware updates (increments) reg:DMA_WROFF_LSBS and reg:DMA_WROFF_MSBS.

The 8051 firmware must ensure that `DMA_WROFF` doesn't go past the write limit (`DMAWR_LIMIT`) and stays within the configured FIFO size (`DMAWR_WRPNT`).

## DMA address space 

When dumping the memory range addressable by the DMA, `0x000` to `0x0ff` returns data that changes between dumps and is not found in other dumps. `0x100` to `0x7ff` is accessing RAM. `0x800` to `0xfff` is a mirror of `0x000` to `0x7ff`. Reading past `0x1000` by setting FIFO base address to `0xfff` also wraps around to `0x000`.
