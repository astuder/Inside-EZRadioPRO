# API commands

There are 5 known modes in which the EZRadioPRO processes API commands:
* `BOOT`: State after reset, before the `POWER_UP` command is run
* `FUNC1`: The normal mode of operation, entered on `POWER_UP` with `FUNC=1`
* `FUNC2`: IEEE 802.15.4 mode, entered on `POWER_UP` with `FUNC=2` (A2A only)
* `FUNC3`: MBUS mode, entered on `POWER_UP` with `FUNC=3` (A2A only)
* `SPI`: Some commands are directly processed by the SPI peripheral and are always active

`FUNC2` and `FUNC3` are not mentioned in the official documentation and it is unknown if they are fully functional in Si446x-A2A devices.

This list applies only to A2A and C2A devices.

`root.xml` refers to a file extracted from SiLabs Wireless Development Suite using [wds-xml-extract.py](../python/README.md#wds-xml-extractpy).

|ID|Command|BOOT|FUNC1|FUNC2|FUNC3|SPI|Documented|
|--|--|--|--|--|--|--|--|
|0x00|NOP|&#x2713;|&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x01|PART_INFO|&#x2713;|&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x02|POWER_UP|&#x2713;|||||&#x2713;|
|0x03|RAM_TEST|&#x2713;|||||root.xml|
|0x04|PATCH_IMAGE|&#x2713;|||||root.xml|
|0x05|PATCH_ARGS|&#x2713;|||||root.xml|
|0x06|PATCH_COPY|&#x2713;|||||root.xml|
|0x09|TEST_DATA|&#x2713;|||||root.xml|
|0x0a|PATCH_COPY_2|&#x2713;|||||root.xml (sames as 0x06)|
|0x10|FUNC_INFO|&#x2713;|&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x11|SET_PROPERTY||&#x2713;|&#x2713;|&#x2713;||&#x2713; [more](#Property-groups)|
|0x12|GET_PROPERTY||&#x2713;|&#x2713;|&#x2713;||&#x2713; [more](#Property-groups)|
|0x13|GPIO_PIN_CFG||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x14|GET_ADC_READING||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x15|FIFO_INFO||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x16|PACKET_INFO||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x17|IRCAL||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x18|PROTOCOL_CFG||&#x2713;|&#x2713;|&#x2713;||&#x2713; (EZRadio)|
|0x19|EZCONFIG_CHECK||&#x2713;||||&#x2713; (EZRadio)|
|0x1a|IRCAL_MANUAL||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x1b|WAIT_PROPERTY_PROCESSED||&#x2713;|&#x2713;|&#x2713;||root.xml|
|0x20|GET_INT_STATUS||&#x2713;||&#x2713;||&#x2713;|
|0x21|GET_PH_STATUS||&#x2713;||&#x2713;||&#x2713;|
|0x22|GET_MODEM_STATUS||&#x2713;||&#x2713;||&#x2713;|
|0x23|GET_CHIP_STATUS|&#x2713;|&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x31|START_TX||&#x2713;||&#x2713;||&#x2713;|
|0x32|START_RX||&#x2713;||&#x2713;||&#x2713;|
|0x33|REQUEST_DEVICE_STATE||&#x2713;|&#x2713;|&#x2713;||&#x2713;|
|0x34|CHANGE_STATE||&#x2713;||||&#x2713;|
|0x35|START_MFSK||&#x2713;|&#x2713;|&#x2713;||root.xml|
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
|0x80|IE154_START_TX|||&#x2713;|||root.xml|
|0x81|IE154_START_RX|||&#x2713;|||root.xml|
|0x82|IE154_GET_INT_STATUS|||&#x2713;|||root.xml|
|0x83|IE154_GET_TX_STATUS|||&#x2713;|||root.xml|
|0x84|IE154_GET_RX_STATUS|||&#x2713;|||root.xml|
|0x85|IE154_OVERRIDE_NEXT_ACK|||&#x2713;|||root.xml|
|0x86|IE154_GET_MAC_TIMER||||||root.xml (not implemented)|
|0x87|IE154_START_ENERGY_DETECT|||&#x2713;|||root.xml|
|0x89|IE154_IS_CHANNEL_CLEAR||||||root.xml (not implemented)|
|0x8a|IE154_QUERY_MODE|||&#x2713;|||root.xml|
|0x8c|IE154_START_IDLE|||&#x2713;|||root.xml|
|0x8d|IE154_START_SLEEP|||&#x2713;|||root.xml|
|0xd0|AGC_OVERRIDE||&#x2713;|&#x2713;|&#x2713;||root.xml|
|0xe_|PATCH_DATA|&#x2713;|||||root.xml|
|0xf0|PEEK||&#x2713;|&#x2713;|&#x2713;||root.xml, knowledge base|
|0xf1|POKE||&#x2713;|&#x2713;|&#x2713;||root.xml, knowledge base|
|0xf2|SRAND||&#x2713;|&#x2713;|&#x2713;||root.xml|
|0xfe|DIE_INFO|&#x2713;|||||root.xml|

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
|0xf2|0x37|OTP_VARS|root.xml|
