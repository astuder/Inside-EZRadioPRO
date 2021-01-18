# SPI Command Buffer

For SPI API requests, this register contains the first byte (`CMD`, index `0x00`) of the argument stream. For SPI API responses, this register contains the second byte (index `0x01`) of the reply stream.

Additional bytes of the argument and reply streams are in the subsequent registers reg:CMD_BUFF1 through reg:CMD_BUFF15.
