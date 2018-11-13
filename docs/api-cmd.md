# API commands

There are 5 known modes in which the EZRadioPRO processes API commands:
* `BOOT`: State after reset, before the `POWER_UP` command is run
* `FUNC1`: The normal mode of operation, entered on `POWER_UP` with `FUNC=1`
* `FUNC2`: Undocumented mode, entered on `POWER_UP` with `FUNC=2` (A2A only)
* `FUNC3`: Undocumented mode, entered on `POWER_UP` with `FUNC=3` (A2A only)
* `SPI`: Some commands are directly processed by the SPI peripheral and are always active

This list applies only to A2A and C2A devices.

|ID|Command|BOOT|FUNC1|FUNC2|FUNC3|SPI|Documented|
|--|--|--|--|--|--|--|--|
|0x00|NOP|&#x2713;|&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x01|PART_INFO|&#x2713;|&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x02|POWER_UP|&#x2713;|||||&#x2713;|
|0x03|PATCH_CLEAN|&#x2713;||||||
|0x04|PATCH_IMAGE|&#x2713;||||||
|0x05|PATCH_ARGS|&#x2713;||||||
|0x06|PATCH_COPY|&#x2713;||||||
|0x09|READ_FACTORY_DATA|&#x2713;||||||
|0x0a|PATCH_COPY|&#x2713;|||||same as 0x06|
|0x10|FUNC_INFO|&#x2713;|&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x11|SET_PROPERTY||&#x2713;|&#x2713;|&#x2713;||&#x2713; [more](#Property-groups)|
|0x12|GET_PROPERTY||&#x2713;|&#x2713;|&#x2713;||&#x2713; [more](#Property-groups)|
|0x13|GPIO_PIN_CFG||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x14|GET_ADC_READING||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x15|FIFO_INFO||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x17|IRCAL||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x18|PROTOCOL_CFG||&#x2713;|&#x2713;|&#x2713;||&#x2713; (EZRadio)|
|0x19|EZCONFIG_CHECK||&#x2713;||||&#x2713; (EZRadio)|
|0x1a|IRCAL_MANUAL||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x1b|CMD_1B||&#x2713;|&#x2713;|&#x2713;|||
|0x20|GET_INT_STATUS||&#x2713;||&#x2713;||&#x2713;|
|0x21|GET_PH_STATUS||&#x2713;||&#x2713;||&#x2713;|
|0x22|GET_MODEM_STATUS||&#x2713;||&#x2713;||&#x2713;|
|0x23|GET_CHIP_STATUS|&#x2713;|&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x31|START_TX||&#x2713;||&#x2713;||&#x2713;|
|0x32|START_RX||&#x2713;||&#x2713;||&#x2713;|
|0x33|REQUEST_DEVICE_STATE||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x34|CHANGE_STATE||&#x2713;||||&#x2713;|
|0x35|CMD_35||&#x2713;|&#x2713;|&#x2713;|||
|0x36|RX_HOP||&#x2713;||||&#x2713;|
|0x37|TX_HOP||&#x2713;||||&#x2713;|
|0x38|OFFLINE_RECAL||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x44|READ_CMD_BUFF|||||&#x2713;|&#x2713;|
|0x50|FRR_A_READ|||||&#x2713;|&#x2713;|
|0x51|FRR_B_READ|||||&#x2713;|&#x2713;|
|0x53|FRR_C_READ|||||&#x2713;|&#x2713;|
|0x57|FRR_D_READ|||||&#x2713;|&#x2713;|
|0x66|WRITE_TX_FIFO|||||&#x2713;|&#x2713;|
|0x77|READ_RX_FIFO|||||&#x2713;|&#x2713;|
|0x80|CMD_80|||&#x2713;||||
|0x81|CMD_81|||&#x2713;||||
|0x82|CMD_82|||&#x2713;|||0x20 GET_INT_STATUS|
|0x83|CMD_83|||&#x2713;|||0x21 GET_PH_STATUS|
|0x84|CMD_84|||&#x2713;|||0x22 GET_MODEM_STATUS|
|0x85|CMD_85|||&#x2713;||||
|0x87|CMD_87|||&#x2713;||||
|0x8a|CMD_8A|||&#x2713;||||
|0x8c|CMD_8C|||&#x2713;||||
|0x8d|CMD_8D|||&#x2713;||||
|0xd0|CMD_D0||&#x2713;|&#x2713;|&#x2713;|||
|0xe_|PATCH_DATA|&#x2713;||||||
|0xf0|PEEK||&#x2713;|&#x2713;|&#x2713;||knowledge base|
|0xf1|POKE||&#x2713;|&#x2713;|&#x2713;||knowledge base|
|0xf2|CMD_F2||&#x2713;|&#x2713;|&#x2713;|||
|0xfe|TAIL_ROM|&#x2713;||||||

# Property groups

|ID|Size|Name|Documented|
|--|--|--|--|
|0x00|0x0b|GLOBAL|&#x2713;|
|0x01|0x04|INT_CTL|&#x2713;|
|0x02|0x04|FRR_CTL|&#x2713;|
|0x10|0x0f|PREAMBLE|&#x2713;|
|0x11|0x0a|SYNC|&#x2713;|
|0x12|0x3a|PKT|&#x2713;|
|0x20|0x60|MODEM|&#x2713;|
|0x21|0x24|MODEM_CHFLT|&#x2713;|
|0x22|0x07|PA|&#x2713;|
|0x23|0x08|SYNTH|&#x2713;|
|0x24|0x09|EZCONFIG|&#x2713; (EZRadio)|
|0x30|0x0c|MATCH|&#x2713;|
|0x40|0x08|FREQ_CONTROL|&#x2713;|
|0x50|0x42|RX_HOP|&#x2713;|
|0xf0|0x05|PTI|&#x2713;|
|0xf2|0x37|CAL_DATA||
