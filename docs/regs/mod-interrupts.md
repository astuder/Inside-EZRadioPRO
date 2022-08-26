# Interrupt Controller

## Interrupt Vectors

<table>
    <thead>
        <tr><td>Address</td><td align="left">Vector</td><td align="left">Peripheral</td><td>Enable</td><td>Priority</td><td>Flag</td><td>Granular EN</td><td>Granular Flag</td></tr>
    </thead><tbody>
        <tr><td>0x0007</td><td align="left">INT_MODEM</td><td align="left">mod:MODEM</td><td>reg:IE</td><td>reg:IP</td><td>reg:IRQ</td><td>reg:MODEMRPT_EN</td><td>reg:MODEMRPT_STUS</td></tr>
        <tr><td>0x000B</td><td align="left">INT_DEBUG</td><td align="left">mod:BREAKPOINTS</td><td>reg:IE</td><td>reg:IP</td><td>reg:IRQ</td></tr>
        <tr><td>0x000F</td><td align="left">INT_TIMER0</td><td align="left">mod:MCU_TIMER</td><td>reg:IE</td><td>reg:IP</td><td>reg:IRQ</td></tr>
        <tr><td>0x0013</td><td align="left">INT_TIMER1</td><td align="left">mod:MCU_TIMER</td><td>reg:IE</td><td>reg:IP</td><td>reg:IRQ</td></tr>
        <tr><td>0x0017</td><td align="left">INT_PA_RAMP</td><td align="left">mod:PA</td><td>reg:IE</td><td>reg:IP</td><td>reg:IRQ</td></tr>
        <tr><td>0x001B</td><td align="left">INT_PH_INFO</td><td align="left">mod:PACKET_HANDLER</td><td>reg:IE</td><td>reg:IP</td><td>reg:IRQ</td><td>reg:PH_INT_ENABLE_1<br />reg:PH_INT_ENABLE_2</td><td>reg:PH_INT_STATUS_1<br />reg:PH_INT_STATUS_2</td></tr>
        <tr><td>0x001F</td><td align="left">INT_COMMAND</td><td align="left">mod:SPI</td><td>reg:EIE1</td><td>reg:EIP1</td><td>reg:EIRQ1</td></tr>
        <tr><td>0x0023</td><td align="left">INT_DMAWR</td><td align="left">mod:SPI_DMA</td><td>reg:EIE1</td><td>reg:EIP1</td><td>reg:EIRQ1</td></tr>
        <tr><td>0x0027</td><td align="left">INT_DMARD</td><td align="left">mod:SPI_DMA</td><td>reg:EIE1</td><td>reg:EIP1</td><td>reg:EIRQ1</td></tr>
        <tr><td>0x002B</td><td align="left">INT_SPI_ERR</td><td align="left">mod:SPI</td><td>reg:EIE1</td><td>reg:EIP1</td><td>reg:EIRQ1</td></tr>
        <tr><td>0x002F</td><td align="left">INT_PH_ERR</td><td align="left">mod:PACKET_HANDLER</td><td>reg:EIE1</td><td>reg:EIP1</td><td>reg:EIRQ1</td></tr>
        <tr><td>0x0033</td><td align="left">INT_TX_PH_AE</td><td align="left">mod:PACKET_HANDLER</td><td>reg:EIE1</td><td>reg:EIP1</td><td>reg:EIRQ1</td></tr>
        <tr><td>0x0037</td><td align="left">INT_RX_PH_AF</td><td align="left">mod:PACKET_HANDLER</td><td>reg:EIE1</td><td>reg:EIP1</td><td>reg:EIRQ1</td></tr>
        <tr><td>0x003B</td><td align="left">INT_PH_HALT</td><td align="left">mod:PACKET_HANDLER</td><td>reg:EIE2</td><td>reg:EIP2</td><td>reg:EIRQ2</td></tr>
        <tr><td>0x003F</td><td align="left">INT_WUT</td><td align="left">mod:WUT</td><td>reg:EIE2</td><td>reg:EIP2</td><td>reg:EIRQ2</td></tr>
        <tr><td>0x0043</td><td align="left">INT_MCTLCMD</td><td align="left">mod:MEMCTL</td><td>reg:EIE2</td><td>reg:EIP2</td><td>reg:EIRQ2</td></tr>
        <tr><td>0x0047</td><td align="left">INT_BITCLK</td><td align="left"></td><td>reg:EIE2</td><td>reg:EIP2</td><td>reg:EIRQ2</td></tr>
        <tr><td>0x004B</td><td align="left">INT_XOSC_OK</td><td align="left"></td><td>reg:EIE2</td><td>reg:EIP2</td><td>reg:EIRQ2</td></tr>
        <tr><td>0x004F</td><td align="left">INT_MCUSW</td><td align="left"></td><td>reg:EIE2</td><td>reg:EIP2</td><td>reg:EIRQ2</td></tr>
    </tbody>
</table>

Note: For all known FUNC images, addresses 0x0047 and higher are used for unrelated code and don't contain valid interrupt vectors.

Note: In boot mode (before the cmd:POWER_UP command), only `INT_COMMAND` and `INT_MCTLCMD` contain valid interrupt vectors. As the bootloader runs from ROM their addresses are 0x801F and 0x8043 respectively.