# SPI peripheral

The SPI peripheral of the EZRadioPRO handles the SPI communication:
* Receiving command and argument stream
* Controlling CTS status and pin
* Sending the reply stream via the command `READ_CMD_BUFF`

The SPI peripheral handles the following commands autonomously without invoking the 8051 core:
* `FRR_x_READ` to read fast response registers (FRR) A-D
* `WRITE_TX_FIFO` to write bytes into the transmit FIFO
* `READ_RX_FIFO` to read bytes from the receive FIFO

## SPI communication

After receiving a SPI command that is not handled by the SPI peripheral itself, the 8051 will receive an interrupt on `vector.spi_cmd` (0x1f).

The SPI argument stream is accessible to the EZRadioPRO firmware in `xreg.spi_buffer` (XREG 0x70-0x7f, IDATA 0x5070-0x507f), starting with CMD at `xreg.spi_buffer + 0`. 

The length of the argument buffer is available in `xreg.spi_status[0:4]` (XREG 0x91, IDATA 0x5091, bits 0-4). The maximum length is 0x10 bytes.

The commands implemented in firmware write the reply stream into `xreg.spi_buffer`, excluding the CTS byte. I.e. index 0x01 of the reply stream is written to `xreg.spi_buffer + 0`.

Most commands are processed synchronously within the SPI interrupt service routine. The exceptions are `GET_ADC_READING` (0x14), `IRCAL` (0x17), `PROTOCOL_CFG` (0x18) and undocumented command 0x1b, which run asynchronously within the main loop.

Custom commands can be added by hooking `map.spi_unknown_cmd` (0x0132) for the SPI ISR or `map.main_loop_unknown_cmd` (0x0213) for the main loop. 

The firmware indicates completion of a SPI command by setting bit `xreg.spi_status[7]` (XREG 0x91, IDATA 0x5091, bit 7). The bit is also set if the command causes an error. This bit may control CTS.

If the bit `xreg.spi_status[5]` (XREG 0x91, IDATA 0x5091, bit 5) is set when done processing a SPI command, the firmware will raise the `CMD_ERROR_COMMAND_BUSY` error.

The register `xreg.spi_unk0x84` (XREG 84, IDATA 0x5084) is set to `0xff` when the firmware completed processing of a command and/or is ready for a new command.

### Registers

<table>
<tr><th>Index</th><th>Name</th><th>7</th><th>6</th><th>5</th><th>4</th><th>3</th><th>2</th><th>1</th><th>0</th></tr>
<tr><td>0x70</td><td>spi_buffer</td><td align="center" colspan="8">SPI_DATA0</td></tr>
<tr><td>0x71</td><td></td><td align="center" colspan="8">SPI_DATA1</td></tr>
<tr><td>0x72</td><td></td><td align="center" colspan="8">SPI_DATA2</td></tr>
<tr><td>0x73</td><td></td><td align="center" colspan="8">SPI_DATA3</td></tr>
<tr><td>0x74</td><td></td><td align="center" colspan="8">SPI_DATA4</td></tr>
<tr><td>0x75</td><td></td><td align="center" colspan="8">SPI_DATA5</td></tr>
<tr><td>0x76</td><td></td><td align="center" colspan="8">SPI_DATA6</td></tr>
<tr><td>0x77</td><td></td><td align="center" colspan="8">SPI_DATA7</td></tr>
<tr><td>0x78</td><td></td><td align="center" colspan="8">SPI_DATA8</td></tr>
<tr><td>0x79</td><td></td><td align="center" colspan="8">SPI_DATA9</td></tr>
<tr><td>0x7a</td><td></td><td align="center" colspan="8">SPI_DATA10</td></tr>
<tr><td>0x7b</td><td></td><td align="center" colspan="8">SPI_DATA11</td></tr>
<tr><td>0x7c</td><td></td><td align="center" colspan="8">SPI_DATA12</td></tr>
<tr><td>0x7d</td><td></td><td align="center" colspan="8">SPI_DATA13</td></tr>
<tr><td>0x7e</td><td></td><td align="center" colspan="8">SPI_DATA14</td></tr>
<tr><td>0x7f</td><td></td><td align="center" colspan="8">SPI_DATA15</td></tr>
</table>

<table>
<tr><th>Index</th><th>Name</th><th>7</th><th>6</th><th>5</th><th>4</th><th>3</th><th>2</th><th>1</th><th>0</th></tr>
<tr><td>0x84</td><td>spi_unk0x84</td><td align="center" colspan="8">unknown</td></tr>
</table>

<table>
<tr><th>Index</th><th>Name</th><th>7</th><th>6</th><th>5</th><th>4</th><th>3</th><th>2</th><th>1</th><th>0</th></tr>
<tr><td>0x91</td><td>spi_status</td><td>SPI_CTS</td><td></td><td>SPI_BUSY</td><td align="center" colspan="5">SPI_LENGTH</td></tr>
</table>

## Fast read registers (FRR)

The SPI commands `FRR_A_READ` through `FRR_D_READ` provide fast access to configurable system variables, like for example the latched RSSI value. The firmware sets the content of FRR A through D by writing to `xreg.frr_a` through `xreg.frr_d` (XREG 0x80-0x83, IDATA 0x5080-0x5083).

### Registers

<table>
<tr><th>Index</th><th>Name</th><th>7</th><th>6</th><th>5</th><th>4</th><th>3</th><th>2</th><th>1</th><th>0</th></tr>
<tr><td>0x80</td><td>spi_frr_a</td><td align="center" colspan="8">FRR_A</td></tr>
<tr><td>0x81</td><td>spi_frr_b</td><td align="center" colspan="8">FRR_B</td></tr>
<tr><td>0x82</td><td>spi_frr_c</td><td align="center" colspan="8">FRR_C</td></tr>
<tr><td>0x83</td><td>spi_frr_d</td><td align="center" colspan="8">FRR_D</td></tr>
</table>

## RX and TX FIFOs

The SPI peripheral processes the commands `READ_RX_FIFO` and `WRITE_TX_FIFO` without invoking the 8051. The FIFOs are located in XDATA RAM and accessed by the SPI peripheral with DMA.

Location and size of the FIFOs in RAM is configured through the XREG registers 0x8a-0x8c (location) and 0x87-0x88 (size).

If a read or write SPI command causes a FIFO underflow or overlow condition, the 8051 will receive an interrupt on `vector.spi_fifo_err` (0x2b).

### Registers

<table>
<tr><th>Index</th><th>Name</th><th>7</th><th>6</th><th>5</th><th>4</th><th>3</th><th>2</th><th>1</th><th>0</th></tr>
<tr><td>0x6a</td><td>spi_fifo_tx_pos_wr</td><td align="center" colspan="8">SPI_TX_FIFO_WRITE_POS</td></tr>
<tr><td>0x6b</td><td>spi_fifo_rx_pos_rd</td><td align="center" colspan="8">SPI_RX_FIFO_READ_POS</td></tr>
<tr><td>0x87</td><td>spi_fifo_tx_size</td><td align="center" colspan="8">SPI_TX_FIFO_SIZE</td></tr>
<tr><td>0x88</td><td>spi_fifo_rx_size</td><td align="center" colspan="8">SPI_RX_FIFO_SIZE</td></tr>
<tr><td>0x8a</td><td>spi_fifo_tx_loc_lsb</td><td align="center" colspan="8">SPI_TX_FIFO_LOC[7:0]</td></tr>
<tr><td>0x8b</td><td>spi_fifo_rx_loc_lsb</td><td align="center" colspan="8">SPI_RX_FIFO_LOC[7:0]</td></tr>
<tr><td>0x8c</td><td>spi_fifo_loc_msb</td><td align="center" colspan="4">SPI_TX_FIFO_LOC[11:8]</td><td align="center" colspan="4">SPI_RX_FIFO_LOC[11:8]</td></tr>
<tr><td>0x8d</td><td>spi_fifo_tx_pos_rd</td><td align="center" colspan="8">SPI_TX_FIFO_READ_POS</td></tr>
<tr><td>0x8e</td><td>spi_fifo_rx_pos_rd</td><td align="center" colspan="8">SPI_RX_FIFO_WRITE_POS</td></tr>
</table>
