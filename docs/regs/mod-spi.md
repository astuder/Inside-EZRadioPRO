# SPI Controller

The SPI peripheral of the EZRadioPRO handles the SPI API communication:
* Receiving argument stream
* Controlling CTS status and pin
* Sending the reply stream 

The SPI peripheral handles the following SPI API commands autonomously without invoking the 8051 MCU:
* cmd:READ_CMD_BUFF to send reply stream
* cmd:FRR_A_READ - cmd:FRR_D_READ to read fast response registers (FRR) A-D
* cmd:WRITE_TX_FIFO to write bytes into the transmit FIFO
* cmd:READ_RX_FIFO to read bytes from the receive FIFO

## SPI communication

After receiving a SPI API command that is not handled by the SPI peripheral itself, the MCU will receive a `COMMAND` interrupt (vector `INT_COMMAND`, `0x001F`).

The SPI API argument stream is passed to the 8051 in the registers reg:CMD_BUFF0 - reg:CMD_BUFF15, starting with `CMD` in reg:CMD_BUFF0. The length of the argument stream is available in reg:SPI_CMD_STATUS:`CMD_COUNT`.

The reply stream is also passed through reg:CMD_BUFF0 - reg:CMD_BUFF15, excluding the `CTS` byte. I.e. index `0x01` of the reply stream is written to reg:CMD_BUFF0.

The 8051 indicates completion of an SPI API command by setting reg:SPI_CMD_STATUS:`CMD_BUF_CLEAN`.

Command error conditions are signaled by setting reg:SPI_CMD_STATUS:`CMD_ERROR`.

The register reg:CTS is set to `0xff` when the 8051 completed processing of a command and/or is ready for a new command. This is likely the `CTS` field in the SPI response.

## Fast read registers (FRR)

The SPI API commands cmd:FRR_A_READ through cmd:FRR_D_READ provide fast access to arbritrary variables. The 8051 sets the content of FRR A through D by writing to reg:FAST_RES_A through reg:FAST_RES_D.

## RX and TX FIFOs

The SPI peripheral processes the commands cmd:READ_RX_FIFO and cmd:WRITE_TX_FIFO without invoking the 8051. The FIFOs are located in RAM and processed by DMA. See mod:SPI_DMA for more information.

## EZRadioPRO firmware implementation

In the EZRadioPRO firmware, most commands are processed synchronously within the `INT_COMMAND` interrupt service routine. The exceptions are cmd:GET_ADC_READING, cmd:IRCAL, cmd:PROTOCOL_CFG and undocumented cmd:WAIT_PROPERTY_PROCESSED (`0x1b`), which run asynchronously within the main loop.

Custom commands can be added by hooking `map.spi_unknown_cmd` (`0x0132`) for synchronous or `map.main_loop_unknown_cmd` (`0x0213`) for asynchronous processing.

If reg:SPI_CMD_STATUS:`CMD_ERROR` is set when done processing a SPI API command, the firmware will report the `CMD_ERROR_COMMAND_BUSY` error.
