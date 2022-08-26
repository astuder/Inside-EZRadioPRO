echo annotating rom
echo ..boot rom

.(fcn 0x8000 0x800c boot.vect_reset)
f boot.vect_entry 1 @ 0x8003
CCu launch EZRadioPRO firmware @ 0x8009
Cd 1 4 @ 0x800c
f boot.rom_magic 2 @ 0x800d
.(fcn 0x8010 0x8018 boot.acfg_write)
.(fcn 0x8018 0x801d boot.set_patch_dest_addr_r6r7)
.(fcn 0x801d 0x801e boot.reti)
.(fcn 0x801f 0x8022 boot.vect_command)
.(fcn 0x8022 0x803a boot.dma_count_r2r3_cmd_copy)
axd 0x5109 @ 0x8029
CCu cmd: READ @ 0x802c
f boot.dma_cmd_r7_execute 1 @ 0x802e
.(fcn 0x803a 0x8042 boot.read_xdata_at_src_addr_to_a)
.(fcn 0x8043 0x8046 boot.vect_mctlcmd)
.(fcn 0x8046 0x8072 boot.copy_factory_part_cfg)
CCu dest: 0x07f0 part data @ 0x8048
CCu len: 0x10 @ 0x804c
CCu nvram src: 0x5510 @ 0x8050
CCu dest: 0x0761 cal data? @ 0x8056
CCu len: 0x37 @ 0x805a
CCu nvram src: 0x5578 @ 0x805e
CCu dest: 0x0798 dsp defaults? @ 0x8064
CCu len: 0x58 @ 0x8068
CCu nvram src: 0x5520 @ 0x806c
.(fcn 0x8072 0x80ea boot.copy_srcr4r5_dstimemr7_lenr3)
CCu XDATA 0x5400 is mirror of IMEM @ 0x8072
f boot.copy_srcr4r5_dstr6r7_lenr2r3 1 @ 0x8077
CCu compare src msb to #0x55 @ 0x807f
CCu branch if less @ 0x8084
CCu compare src to 0x7500 @ 0x8086
CCu branch if less @ 0x808f
CCu src below 0x5500 or above 0x7500 @ 0x8091
CCu increment src addr @ 0x8096
axd 0x5103 @ 0x80a2
CCu decrement len msb if necessary @ 0x80af
CCu check if dst is IMEM mirror @ 0x80b5
CCu store in IMEM:dst @ 0x80bd
CCu store in XMEM:dst @ 0x80c3
CCu src within NVRAM (0x5500-0x74ff) @ 0x80cb
CCu a = src addr lsb @ 0x80cd
CCu clr dma src addr @ 0x80d9
CCu don't disable NVRAM if set @ 0x80e4
.(fcn 0x80ea 0x8118 boot.run_boot_script)
CCu run cmds at r6r7 @ 0x80ea
CCu counter = 0 @ 0x80ee
CCu imem dest: 0x2b (spi cmd buffer) @ 0x80f1
CCu nrvam src: start + 16*counter @ 0x80f7
CCu len: 0x10 @ 0x8109
CCu repeat until cmd response is 0 @ 0x8113
.(fcn 0x8118 0x8155 boot.nvm_init)
CCu Set NVRAM protection to User? @ 0x8118
axd dsp_base+0x48 @ 0x811a
axd xreg_base+0xe2 @ 0x812a
CCu imem dest: 0x3d @ 0x812e
axd _idata+0x3d @ 0x812e
CCu length: 5 (0x3d-0x41) @ 0x8131
CCu nvram src: 0x5500 (is ff03030a0a) @ 0x8133
CCu evaluate copied data (is 0a) @ 0x8139
CCu (is 0a) @ 0x813d
CCu (is 03) @ 0x8140
CCu (is 03) @ 0x8142
CCu (is 0a) @ 0x8148
CCu (is 03) @ 0x814b
CCu Set NVRAM protection to Run? @ 0x814f
axd dsp_base+0x48 @ 0x8151
.(fcn 0x8155 0x81c7 boot.load_func_image_r7)
CCu r5 = r7 = func image (1-3) @ 0x8155
CCu init return value to 1 (success) @ 0x8157
CCu dest: 0x5423 (IMEM:0x23) @ 0x815c
CCu nvram src: (func * 4) + 0x56fc (ptr to script) @ 0x8169
CCu count: 4 @ 0x817a
CCu is script ptr 0? @ 0x8180
CCu exit if yes @ 0x8184
CCu script copies fragments from NVRAM and ROM @ 0x8186
CCu dest: IMEM:0x42 @ 0x8187
CCu count: 4 @ 0x818c
CCu src: script ptr @ 0x818e
CCu move script ptr to next step @ 0x8194
CCu if upper 2 bytes = 0, we're done @ 0x81a3
CCu if lower 2 bytes = 0, it's a new dest addr @ 0x81a9
CCu copy block from NVRAM or ROM @ 0x81ab
CCu process next script step @ 0x81b5
CCu set new dest address @ 0x81b7
CCu process next script step @ 0x81bd
CCu return value 0 (will cause CMD ERR 32) @ 0x81bf
.(fcn 0x81c7 0x823b boot.bootloader)
CCu enable interrupts @ 0x81df
CCu only run once on power-up?? @ 0x81e9
CCu indicate multiple NRAM reads @ 0x81f0
CCu nvram src: 0x5600 @ 0x81f4
CCu disable interrupts @ 0x8220
.(fcn 0x823b 0x8245 boot.nvm_disable)
.(fcn 0x8245 0x82a5 boot.checksum_memory)
CCu src addr MSB/LSB @ 0x8245
CCu length MSB/LSB @ 0x824b
CCu decrement length @ 0x8258
CCu is remaining length 0? @ 0x8262
CCu pointing at NVRAM (5500-7fff)? @ 0x8265
CCu read byte from XDATA @ 0x8272
CCu read byte from NVRAM @ 0x8280
CCu process retrieved byte @ 0x829b
CCu increment src addr @ 0x8293
CCu process next byte @ 0x82a1
.(fcn 0x82a5 0x82ce boot.failed)
CCu set bit 2 @ 0x82aa
CCu wait for bit 2 clr @ 0x82b0
f boot.clk_init 1 @ 0x82b3
axd xreg_base+0xab @ 0x82bc
axd dsp_base+0x54 @ 0x82ca
.(fcn 0x82ce 0x82ed boot.prepare_exit)
.(fcn 0x82ed 0x8301 boot.cmd_test_data)
CCu dest addr: response buffer @ 0x82f1
CCu src addr: 0x7400+arg[1] @ 0x82f3
CCu length: 16 bytes @ 0x82fb
.(fcn 0x8301 0x835b boot.parse_cmd)
CCu cmd 0x00: NOP @ 0x8303
CCu cmd 0x01: PART_INFO @ 0x8305
CCu cmd 0xfe: DIE_INFO @ 0x830a
CCu cmd 0x10: FUNC_INFO @ 0x830f
f boot.cmd_func_info 1 @ 0x8312
CCu cmd 0x02: POWER_UP @ 0x831c
CCu cmd 0x03: RAM_TEST @ 0x8321
CCu cmd 0x04: PATCH_IMAGE @ 0x8326
CCu cmd 0x05: PATCH_ARGS @ 0x832b
CCu cmd 0x23: GET_CHIP_STATUS @ 0x8330
CCu cmd 0x09: TEST_DATA @ 0x8335
CCu cmd 0x06: PATCH_COPY @ 0x833c
CCu cmd 0x0a: PATCH_COPY2 @ 0x8342
CCu cmd 0xe0-0xef: PATCH_DATA @ 0x8349
CCu CMD_ERROR_BAD_CMD @ 0x8356
.(fcn 0x835b 0x837b boot.cmd_patch_copy)
CCu CMD_ERROR_BAD_PATCH @ 0x8367
.(fcn 0x837b 0x8388 boot.clr_cmd_buffer)
.(fcn 0x8388 0x83c5 boot.cmd_ram_test)
CCu fill flag set in arg[1]? @ 0x8391
CCu fill byte = arg[6] @ 0x8396
CCu crc flag set in arg[1]? @ 0x839c
CCu return block crc @ 0x83a5
CCu return patch image crc @ 0x83ab
f boot.exit_cmd_with_error_30 1 @ 0x83b5
CCu CMD_ERROR_BAD_PATCH @ 0x83b5
f boot.exit_cmd_with_error_r7 1 @ 0x83b7
CCu set NIRQ pin low? @ 0x83c0
.(fcn 0x83c5 0x8415 boot.cmd_patch_image)
CCu set patch number to 0 @ 0x83c8
axd 0x4760 @ 0x83cc
CCu bit 4: if set, don't load func image @ 0x83dc
CCu load func image @ 0x83df
CCu CMD_ERROR_BAD_IMAGE @ 0x83ed
CCu bit 5: if set, verify CRC @ 0x83f3
CCu verify func image CRC @ 0x83f6
CCu bit 4: will be clear if func image was loaded @ 0x8402
CCu func image CRC does not match @ 0x8405
CCu CMD_ERROR_BAD_ARG @ 0x8409
CCu setup CRC/crypto? @ 0x840d
.(fcn 0x8415 0x8445 boot.cmd_part_info)
CCu CMD_ERROR_BAD_PATCH @ 0x8441
.(fcn 0x8445 0x8475 boot.cmd_patch_args)
CCu check if there was a patch error @ 0x8445
CCu arg bytes to decrypt (1-5) @ 0x8448
CCu arg[7] @ 0x844c
CCu arg[6] @ 0x844e
CCu c set on error @ 0x8452
CCu arg[1] @ 0x8454
CCu arg[4] @ 0x845a
CCu arg[3] @ 0x845c
CCu target addr for patch_data @ 0x845e
CCu check if there was a patch error @ 0x8460
CCu CMD_ERROR_BAD_PATCH @ 0x8463
CCu update patch ID @ 0x8469
CCu arg[6] @ 0x846c
CCu arg[7] @ 0x8470
CCu cmd done @ 0x8473
.(fcn 0x8475 0x84a8 boot.cmd_patch_data)
CCu check if there was a patch error @ 0x8475
CCu c set on error @ 0x847c
CCu check if there was a patch error @ 0x847e
CCu CMD_ERROR_BAD_PATCH @ 0x8481
CCu length (0-7) @ 0x8487
CCu target addr (from patch_args) @ 0x848c
CCu last byte? @ 0x8495
CCu target addr for next round @ 0x849e
.(fcn 0x84a8 0x84c9 boot.decrypt_arg_buffer)
CCu bitmask, set bit = decrypt arg byte @ 0x84a8
CCu ptr to arg buffer @ 0x84aa
CCu all bytes descrypted? @ 0x84af
CCu decrypt this arg byte? @ 0x84b1
CCu r7 = arg byte @ 0x84b7
CCu store decrypted arg byte @ 0x84ba
CCu get next bit/byte @ 0x84be
CCu done @ 0x84c8
.(fcn 0x84c9 0x84e8 boot.cmd_die_info)
.(fcn 0x84e8 0x8523 boot.cmd_power_up)
CCu CMD_ERROR_BAD_PATCH @ 0x8512
CCu CMD_ERROR_BAD_ARG @ 0x851c
.(fcn 0x8523 0x8532 boot.verify_cmd_crc_lsb)
.(fcn 0x8532 0x8549 boot.dma_xdata_unk0x8532)
CCu dest: 0x4000 (XMEM mirror) @ 0x8532
axd 0x5105 @ 0x8537
axd 0x5109 @ 0x8541
CCu count: 0x0760 @ 0x853e
CCu cmd: 2 (clear memory?) @ 0x8545
.(fcn 0x8549 0x8568 boot.cmd_get_chip_status)
CCu CMD_ERR_STATUS @ 0x854b
CCu CMD_ERR_CMD_ID @ 0x854e
CCu if cmd err, set pend/status flags @ 0x8555
CCu set NIRQ pin high? @ 0x855d
.(fcn 0x8568 0x8587 boot.copy_srcr6r7_dst2728_lenr4r5_dst_plus_len)
CCu src: r6 r7 @ 0x856c
CCu count: r4 r5 @ 0x8570
CCu dest: 0x27 0x28 @ 0x8574
CCu add count to destination address @ 0x857a
.(fcn 0x8587 0x85a9 boot.read_rom_magic)
CCu imem dest: 0x5c @ 0x858e
CCu rom src: 0x800d @ 0x8596
axd 0x800d @ 0x8596
CCu length: 2 @ 0x859a
CCu if copied is not 2, set 0x21.4 @ 0x85a6
.(fcn 0x85a9 0x85d2 boot.decrypt_byte_r7)
.(fcn 0x85d2 0x860d boot.init_patch_crypto)
CCu r4 = ROMID xor patch_image.arg[6] @ 0x85da
CCu r5 = ROMID xor patch_image.arg[7] @ 0x85dd
CCu ba = r4 * 8 @ 0x85df
CCu r6:r7 = [ba] * 8, a = [ba+1] @ 0x85e6
CCu 4b:4c = r6:r7 + a @ 0x85e8
CCu ba = r5 * 8 + 2 @ 0x85f1
CCu r6:r7 = [ba] * 8, a = [ba+1] @ 0x85f8
CCu 4d:4e = r6:r7 + a @ 0x85fa
CCu 47:48 = r4:r5 @ 0x8601
CCu 49:4a = r4:r5 @ 0x8605
.(fcn 0x860d 0x8663 boot.spi_cmd_handler)
CCu copy SPI buffer to IMEM 0x2b-3a @ 0x862c
CCu copy IMEM 0x2b-3a to SPI buffer @ 0x863d
.(fcn 0x8663 0x866d boot.timer0_start)
.(fcn 0x866d 0x867a boot.verify_args_checksum)
.(fcn 0x867a 0x8691 boot.nvram_enable)
CCu already enabled? @ 0x867a
CCu busy wait #0x14 loops @ 0x8684
.(fcn 0x8691 0x86a9 boot.wipe_xdata)
CCu fill xdata with r7 and xored r7 @ 0x86a0
.(fcn 0x86a9 0x86d2 boot.update_crc)
.(fcn 0x86d2 0x86fd boot.checksum_byte_r7)
CCu r4 is counter, loop 8 times @ 0x86d4
CCu r7 = bit0 @ 0x86d6
CCu prepare next bit in r5 @ 0x86da
.(fcn 0x86fd 0x871b boot.read_ba_into_r6r7_a)
CCu r6r7 = [ba] * 8 @ 0x8701
CCu a = [ba+1] @ 0x8717
.(fcn 0x871b 0x8723 boot.load_0x2c_0x2d_from_dptr)
.(fcn 0x8723 0x872c boot.dma_set_src_lo_a_src_hi_0x58)
axd 0x5103 @ 0x8729
.(fcn 0x872c 0x8736 boot.dma_set_dst_a_to_len_dec_len)
.(fcn 0x8736 0x8740 boot.init_spi_buffer_vars)
.(fcn 0x8740 0x874f boot.decrypt_arg_buffer_get_cmd_bit3)
CCu decrypt all bytes except command @ 0x8740
CCu extract bit 3 of command @ 0x8744
.(fcn 0x874f 0x8759 boot.nvm_enable)
CCu enable a=3, disable a=4 @ 0x8751
CCu clr bits 2-3 @ 0x8755
.(fcn 0x8759 0x8765 boot.get_cmd_buffer_ptr)
CCu returns ptr to var.cmd_buffer in r6r7 @ 0x8759
.(fcn 0x8765 0x8771 boot.load_0x2e_to_0x30_from_dptr)

echo ..firmware rom

.(fcn 0x8771 0x8783 rom.math_mul16)
.(fcn 0x8783 0x87d2 rom.math_mul32)
.(fcn 0x87d2 0x87de rom.movx_dptr_to_r4r5r6r7)
.(fcn 0x87de 0x87ea rom.movx_xreg_to_r4r5r6r7)
.(fcn 0x87ea 0x87f6 rom.movx_r4r5r6r7_to_dptr)
.(fcn 0x87f6 0x8802 rom.movx_r4r5r6r7_to_xreg)
.(fcn 0x8802 0x880e rom.math_mul_ab_add_to_dptr)
.(fcn 0x880e 0x8830 rom.math_div_ab_signed)
CCu psw.5 = general purpose flag @ 0x880e
.(fcn 0x8830 0x883e rom.math_div16)
CCu div 8bit by 8bit @ 0x8836
.(fcn 0x883e 0x885f rom.math_div16_16)
.(fcn 0x885f 0x8885 rom.math_div16_8)
.(fcn 0x8885 0x88c1 rom.math_div32_32)
.(fcn 0x88c1 0x88f7 rom.math_div32)
CCu e.g. r0r1r2r3=32K r4r5r6r7=XO_FREQ @ 0x88c1
CCu div 32bit by 8bit @ 0x88ca
.(fcn 0x88f7 0x8920 rom.math_div32_16)
CCu counter @ 0x88f7
CCu shift left r1r4r5r6r7 @ 0x88f9
CCu compare r1r4 to r2r3 @ 0x890b
CCu r1r4 -= r2r3 @ 0x8910
CCu set bit0 of r7 @ 0x8916
CCu loop until r0 is 0 @ 0x8917
CCu r2r3 = r1r4, r1r4 = 0 @ 0x8919
.(fcn 0x8920 0x8953 rom.math_div32_24)
.(fcn 0x8953 0x8966 rom.math_rrc_arg2_by_r0)
.(fcn 0x8966 0x8a57 rom.ph_config_pkt)
CCu DST_FIELD @ 0x896b
CCu variable pkt len disabled @ 0x896e
CCu SIZE @ 0x8971
CCu len size is 2 bytes @ 0x8974
axd 0x06d9 @ 0x897a
CCu SRC_FIELD @ 0x897c
CCu 0 and 1 are the same @ 0x8985
CCu number of pkt field configs @ 0x8986
CCu config/reset all fields @ 0x8989
CCu field @ 0x8994
CCu clr CRC errors @ 0x899d
CCu config field 1 @ 0x89a1
CCu if TX @ 0x89a6
CCu PKT_FIELD_n_LENGTH msb @ 0x89b3
axd 0x06de @ 0x89b6
CCu PKT_FIELD_n_LENGTH lsb @ 0x89b7
axd 0x06df @ 0x89ba
CCu multiply by 8 (len in bits) @ 0x89c7
CCu start hw multiplier @ 0x89cd
CCu PKT_FIELD_n_CONFIG @ 0x89d0
axd 0x06e0 @ 0x89d2
CCu PKT_FIELD_n_CRC_CONFIG @ 0x89d3
axd 0x06e1 @ 0x89d5
CCu 1st field? (r4=0) @ 0x89d7
CCu PN_START @ 0x89da
CCu CRC_START @ 0x89e1
CCu ALT_CRC_START @ 0x89e8
CCu 4FSK,WHITEN,MANCH @ 0x89ef
CCu various CRC config flags @ 0x89f4
CCu last field? (len=0) @ 0x8a02
CCu if this is pkt len src field @ 0x8a09
CCu if tx (=0) @ 0x8a0c
CCu pkt len 2 bytes? @ 0x8a13
CCu pkt len w/o len field @ 0x8a1b
CCu config next field @ 0x8a25
CCu dec field counter @ 0x8a2a
CCu process next field @ 0x8a2e
CCu only 1 field cfg? @ 0x8a31
CCu bit for prev field @ 0x8a33
CCu bit for field 5 @ 0x8a37
CCu TX? (r7=0) @ 0x8a3d
CCu INFINITE_LEN rx @ 0x8a43
CCu don't repeat fields (not infinite) @ 0x8a46
CCu TX? (r7=0) @ 0x8a4a
.(fcn 0x8a57 0x8ad8 rom.config_frequency)
CCu init hw multiplier @ 0x8a58
CCu CHANNEL_STEP_SIZE[15:8] @ 0x8a61
axd 0x06a7 @ 0x8a64
CCu CHANNEL_STEP_SIZE[7:0] @ 0x8a65
CCu channel number @ 0x8a6b
CCu start 16bit hw multiply @ 0x8a6e
CCu INTE @ 0x8a76
axd 0x06a3 @ 0x8a80
axd 0x06a4 @ 0x8a86
axd 0x06a5 @ 0x8a89
CCu FRAC[19:16] @ 0x8a81
CCu FRAC[15:8] @ 0x8a87
CCu FRAC[7:0] @ 0x8a8a
CCu r6r5r4r3 = PLL divider for base freq (13.19 fixed point) @ 0x8a8b
CCu add base PLL div and ch offset @ 0x8a8c
CCu set int part of PLL divider @ 0x8aa3
CCu set frac part of PLL divider @ 0x8ab9
.(fcn 0x8ad8 0x8b06 rom.crypto_on_r4_r5_r6_r7)
CCu r0 = loop cnt @ 0x8ad8
CCu if r4r5r6r7=0, init with 0xa5a50000 @ 0x8ada
CCu r4r5r6r7 shr 1 @ 0x8ae4
CCu if lsb was 0, skip xor @ 0x8af1
CCu r4r5r6r7 xor 0xcc4c4ece @ 0x8af3
CCu repeat r0 times @ 0x8b03
.(fcn 0x8b06 0x8b31 rom.isr_entry2)
.(fcn 0x8b31 0x8b50 rom.isr_exit2)
.(fcn 0x8b50 0x8b6e rom.dma_copy_src_r4r5_dst_r6r7_len_r2r3)
axd 0x5103 @ 0x8b55
axd 0x5104 @ 0x8b59
axd 0x5105 @ 0x8b5c
axd 0x5109 @ 0x8b68
.(fcn 0x8b6e 0x8b8b rom.update_frr_data)
CCu frr a-d at xreg 0x80-83 @ 0x8b75
axd xreg_base+0x81 @ 0x8b7c
axd xreg_base+0x82 @ 0x8b82
axd xreg_base+0x83 @ 0x8b88
f rom.gpio_pin_mode_map @ 0x8c2b
Cd 2 40 @ 0x8c2b
CCu TRISTATE @ 0x8c2d
CCu DRIVE0 @ 0x8c2f
CCu DRIVE1 @ 0x8c31
CCu INPUT @ 0x8c33
CCu 32K_CLK @ 0x8c35
CCu BOOT_CLK @ 0x8c37
CCu DIV_CLK @ 0x8c39
CCu CTS @ 0x8c3b
CCu INV_CTS @ 0x8c3d
CCu CMD_OVERLAP @ 0x8c3f
CCu SDO @ 0x8c41
CCu POR @ 0x8c43
CCu CAL_WUT @ 0x8c45
CCu WUT @ 0x8c47
CCu EN_PA @ 0x8c49
CCu TX_DATA_CLK @ 0x8c4b
CCu RX_DATA_CLK @ 0x8c4d
CCu EN_LNA @ 0x8c4f
CCu TX_DATA @ 0x8c51
CCu RX_DATA @ 0x8c53
CCu RX_RAW_DATA @ 0x8c55
CCu ANTENNA1_SW @ 0x8c57
CCu ANTENNA2_SW @ 0x8c59
CCu VALID_PREAMBLE @ 0x8c5b
CCu INVALID_PREAMBLE @ 0x8c5d
CCu SYNC_WORD_DETECT @ 0x8c5f
CCu CCA @ 0x8c61
CCu IN_SLEEP @ 0x8c63
CCu PKT_TRACE @ 0x8c65
CCu BUFDIV_CLK @ 0x8c67
CCu TX_RX_DATA_CLK @ 0x8c69
CCu TX_STATE @ 0x8c6b
CCu RX_STATE @ 0x8c6d
CCu RX_FIFO_FULL @ 0x8c6f
CCu TX_FIFO_EMPTY @ 0x8c71
CCu LOW_BATT @ 0x8c73
CCu CCA_LATCH @ 0x8c75
CCu HOPPED @ 0x8c77
CCu HOP_TABLE_WRAP/NIRQ @ 0x8c79
f rom.modem_fsk4_map @ 0x8c7b
Cd 1 0x48 @ 0x8c7b
CCu FSK4 deviation lookup 24x3 entries, 0:? 1:TX 2:RX @ 0x8c7b
f rom.crc_poly_table @ 0x8cc3
Cd 2 0x14 @ 0x8cc3
CCu none @ 0x8cc3
CCu ITU-T CRC8 @ 0x8cc7
CCu IEC-16 @ 0x8ccb
CCu Baicheva-16 @ 0x8ccf
CCu CRC-16 (IBM) @ 0x8cd3
CCu CCIT-16 @ 0x8cd7
CCu Koopman @ 0x8cdb
CCu IEEE 802.3 @ 0x8cdf
CCu Castagnoli @ 0x8ce3
CCu CRC-16-DNP @ 0x8ce7
f rom.crc_alt_poly_idx @ 0x8ceb
Cd 1 7 @ 0x8ceb
CCu none @ 0x8ceb
CCu ITU-T CRC8 @ 0x8cec
CCu IEC-16 @ 0x8ced
CCu Baicheva-16 @ 0x8cee
CCu CRC-16 (IBM) @ 0x8cef
CCu CCIT-16 @ 0x8cf0
CCu CRC-16-DNP @ 0x8cf1
f rom.lookup_bitno_to_bit 8 @ 0x8cf2
Cd 1 8 @ 0x8cf2
f rom.lookup_dsp_rx 8 @ 0x8cfa
CCu 4x2 bytes, 1:written to dsp 0x2b, 2: dsp reg @ 0x8cfa
Cd 1 8 @ 0x8cfa
.(fcn 0x8d02 0x8d47 rom.main_loop)
CCu change state @ 0x8d1b
CCu parse commands @ 0x8d21
CCu extended flags @ 0x8d29
CCu WUT event @ 0x8d30
f rom.main_loop_idle 1 @ 0x8d42
.(fcn 0x8d47 0x8d5c rom.main_loop_rxtx_event)
CCu rx flag? @ 0x8d47
CCu rx @ 0x8d4c
CCu tx flag? @ 0x8d4e
CCu tx @ 0x8d53
.(fcn 0x8d5c 0x8d73 rom.fifo_rx_check_almost_full)
.(fcn 0x8d73 0x8d76 rom.main_loop_parse_cfg_entry)
.(fcn 0x8d76 0x8d7d rom.main_loop_raise_event_r7)
.(fcn 0x8d7d 0x8d89 rom.cmd_wait_property_processed)
CCu if scratch 0x91-93 is 0 @ 0x8d81
.(fcn 0x8d89 0x8d97 rom.raise_config_event_0x8d89)
CCu raise config event @ 0x8d90
.(fcn 0x8d97 0x8dab rom.raise_config_event_0x8d97)
CCu raise config event @ 0x8da4
.(fcn 0x8dab 0x8e55 rom.config_cmd_unk0x01)
axd dsp_base+0x02 @ 0x8e30
CCu THRESHOLD @ 0x8e41
.(fcn 0x8e55 0x8e6d rom.dsp_set_reg_56_mask_3f_val_c0)
f rom.dsp_set_reg_56_mask_3f_val_r3 1 @ 0x8e57
axd dsp_base+0x56 @ 0x8e59
f rom.dsp_set_reg_r7_mask_r5_val_r3 1 @ 0x8e5b
CCu store copy in cache @ 0x8e67
.(fcn 0x8e6d 0x8ecc rom.config_bufclk)
CCu DIV_MODE, DIVX @ 0x8e72
CCu BUFCLK supported? @ 0x8e7a
CCu DIVIDED_BUFCLK_MODE @ 0x8e7e
CCu DISABLE @ 0x8e80
CCu SOUTH_AND_GPIO @ 0x8e83
CCu NORTH_SOUTH_AND_GPIO @ 0x8e86
CCu mode NORTH @ 0x8e8b
CCu mode SOUTH_AND_GPIO @ 0x8e95
CCu mode NORTH_SOUTH_AND_GPIO @ 0x8e9d
CCu SPI_ACTIVE @ 0x8eab
CCu mode DISABLE @ 0x8eb4
axd dsp_base+0x55 @ 0x8ec8
.(fcn 0x8ecc 0x8ee5 rom.dsp_set_reg_r7_val_acc_and_0x7f)
f rom.dsp_set_reg_r7_val_r5 @ 0x8ecf
CCu check that dsp addr 0x58 or less @ 0x8ed4
CCu store dsp val in cache 1 @ 0x8ed9
.(fcn 0x8ee5 0x8f43 rom.config_synth)
axd dsp_base+0x0e @ 0x8f06
.(fcn 0x8f43 0x8fb8 rom.config_modem_etsi)
CCu check ETSI support @ 0x8f5a
CCu ETSI_868 @ 0x8f61
CCu check ETSI support @ 0x8f77
CCu ETSI_169 @ 0x8f7d
.(fcn 0x8fca 0x8fe0 rom.adc_read_battery_voltage)
.(fcn 0x8fe0 0x8fe3 rom.spi_unknown_cmd)
.(fcn 0x8fe5 0x8feb rom.main_loop_raise_rx_event)
CCu raise rx/tx main loop event @ 0x8fe7
.(fcn 0x8feb 0x8fed rom.dmard_isr)
.(fcn 0x8fed 0x8ff3 rom.main_loop_raise_tx_event)
CCu raise rx/tx main loop event @ 0x8fef
.(fcn 0x8ff3 0x8ff8 rom.dmawr_isr)
.(fcn 0x8ff8 0x8ffe rom.rssi_crosses_below_thresh)

echo   ..0x9000

.(fcn 0x9001 0x9008 rom.set_pcon)
.(fcn 0x9008 0x948a rom.config_modem)
CCu MOD_SOURCE @ 0x900c
CCu DIRECT (gpio) @ 0x9014
CCu PSEUDO (random gen) @ 0x9017
CCu PACKET (packet handler) @ 0x901b
CCu Mod src is pkt handler @ 0x901d
CCu Mod src is gpio @ 0x9022
CCu TX_DIRECT_MODE_TYPE @ 0x9026
CCu 0=SYNC, 1=ASYNC @ 0x902b
CCu Mod src is gpio or ph @ 0x9035
CCu Mod src is random num gen @ 0x903d
CCu TX_DIRECT_MODE_GPIO @ 0x904f
CCu MODEM_DATA_RATE[23:16] @ 0x9061
axd 0x0645 @ 0x9061
CCu MODEM_DATA_RATE[15:8] @ 0x9065
CCu MODEM_DATA_RATE[7:0] @ 0x9069
CCu ENMANCH, ENINV_RXBIT, ENINV_TXBIT, ENINV_FD @ 0x9071
CCu TX_OSR[1:0], NCOMOD[25:24] @ 0x9078
CCu ZEROIF @ 0x9086
CCu bit 3 (undocumented) @ 0x908e
CCu ADC_GAIN_COR_EN @ 0x9097
CCu ZEROIF, FIXIF @ 0x90a2
CCu MODEM_IF_FREQ @ 0x90a6
CCu IF_FREQ[17:16] @ 0x90a8
axd 0x065d @ 0x90a6
CCu if ZEROIF @ 0x90b0
CCu MOD_TYPE @ 0x90b7
CCu if OOK @ 0x90ba
CCu MOD_TYPE @ 0x90c7
CCu FREQDEV[16] @ 0x90d2
CCu FREQDEV[15:8] @ 0x90d7
CCu FREQDEV[7:0] @ 0x90db
CCu FREQOFFSET[15:8] @ 0x90df
axd 0x064f @ 0x90df
CCu FREQOFFSET[7:0] @ 0x90e3
axd xreg_base+0x58 @ 0x90e7
axd 0x0651 @ 0x90e9
axd xreg_base+0x60 @ 0x90f0
CCu MODEM_TX_RAMP_DELAY @ 0x90f2
CCu RAMP_DLY @ 0x90f4
CCu RXGAINX2 @ 0x9104
CCu NDEC0, NDEC1, NDEC2 @ 0x910b
CCu MODEM_DECIMATION_CFG0 @ 0x9110
axd 0x0661 @ 0x9110
CCu DWN3BYP, DWN2BYP @ 0x9112
CCu CRFAST, CRSLOW @ 0x911d
CCu bit 0 undoc @ 0x912f
CCu DISTOGG, PH0SIZE @ 0x913c
CCu CHFLT_LOWP, DROOPFLTBYP @ 0x9143
CCu RXOSR[11:8] @ 0x914b
CCu RXOSR[7:0] @ 0x9158
axd 0x0666 @ 0x915e
CCu BCRFBBYP, SLICEFBBYP @ 0x9167
CCu NCOFF[15:8] @ 0x916c
CCu NCOFF[7:0] @ 0x9172
CCu RXCOMP_LAT @ 0x9179
CCu DIS_MIDPT, ESC_MIDPT @ 0x917d
CCu RXNCOCOMP @ 0x9185
CCu CRGAINX2 @ 0x918a
CCu CRGAIN[10:8] @ 0x9194
CCu CRGAIN[7:0] @ 0x9199
CCu ADCWATCH, ADCRST @ 0x91a1
CCu ANTDIV @ 0x91ab
CCu ENAFC @ 0x91b6
CCu AFCBD @ 0x91bd
CCu AFC_FAST, AFC_SLOW @ 0x91c7
CCu MODEM_AFC_WAIT @ 0x91cd
axd 0x66f @ 0x91cd
axd xreg_base+0x2f @ 0x91cf
CCu ENFBPLL @ 0x91d5
CCu GEAR_SW @ 0x91dd
CCu AFC_GAIN[12:8] @ 0x91de
axd xreg_base+0x30 @ 0x91e4
axd xreg_base+0x31 @ 0x91e4
CCu AFCLIM[14:8] @ 0x91e7
CCu ENAFCFRZ @ 0x91ee
axd xreg_base+0x32 @ 0x91f1
CCu AFCLIM[7:0] @ 0x91f3
axd xreg_base+0x33 @ 0x91f7
CCu bit 2 undocumented @ 0x9204
CCu HGAIN, EN_DRST, REALADC @ 0x9210
CCu AVERAGE @ 0x921f
CCu RSSI_DELAY, RSSI_DELAY_CNT @ 0x9230
CCu OOK_DISCHG_DIV @ 0x923d
CCu OOK_LIMIT_DISCHG @ 0x9250
CCu if always dischg (0) @ 0x9258
axd xreg_base+0x3b @ 0x926f
CCu if hysterisis larger than thres @ 0x9278
CCu then no hysterisis @ 0x927c
CCu calculate RSSI turn off thres @ 0x9288
CCu EN2TB_EST @ 0x9292
CCu PH_SRC_SEL @ 0x929b
CCu DETECTOR @ 0x92a7
CCu UNSTDPK in bit 0 @ 0x92ae
CCu PM_PATTERN @ 0x92b3
CCu AGC_SLOW @ 0x92c0
CCu MODEM_AGC_CONTROL @ 0x92c8
CCu AGCOVPKT, IFPDSLOW, RFPDSLOW, SGI_N, RST_PKDT_PERIOD @ 0x92c9
CCu ENRSSIJMP, JMPDLYLEN, ENJMPRX @ 0x92d0
axd xreg_base+0x4f @ 0x92d3
axd xreg_base+0x52 @ 0x92db
axd xreg_base+0x3c @ 0x92dd
CCu MODEM_FSK4_MAP @ 0x92e2
axd 0x8c7b @ 0x92e6
CCu lookup fsk4 map cfg @ 0x92ef
axd _idata+0x84 @ 0x92fa
CCu OOKFASTMA @ 0x92ff
CCu ATTACK, DECAY @ 0x9303
axd xreg_base+0x38 @ 0x9306
CCu if disabled use legacy @ 0x9312
CCu transform legacy settings to current format @ 0x931c
CCu RAWGAIN @ 0x9350
CCu CONSCHK_BYP @ 0x9355
axd 0x0688 @ 0x935d
CCu RAWEYE[10:8] @ 0x935f
CCu bit 2 (undocumented) @ 0x9368
CCu NON_FRZEN @ 0x936e
CCu MODEM_RAW_EYE lsb @ 0x9378
axd xreg_base+0x42 @ 0x937c
axd 0x068a @ 0x937e
axd 0x068b @ 0x9388
axd xreg_base+0x57 @ 0x938a
CCu ANT2PM_THD @ 0x938c
CCu RSSIJMP_UP @ 0x9393
CCu RSSIJMPTHD @ 0x9399
CCu RSSIJMP_DWN @ 0x93a3
CCu MODEM_RSSI_COMP @ 0x93aa
axd 0x0690 @ 0x93aa
CCu RSSI_COMP @ 0x93ac
axd xreg_base+0x55 @ 0x93af
CCu MATAP @ 0x93b4
CCu ENFZPMEND, ENAFC_CLKSW @ 0x93bc
CCu DC_CONTROL @ 0x93c2
CCu 4FSK? @ 0x93d2
CCu clr MOD_TYPE bit3, disable 4FSK? @ 0x93d5
CCu xreg.0x53[2:0]=2 @ 0x93e2
CCu clr OOK_SQUELCH_EN @ 0x93eb
CCu OOK_SQUELCH_EN @ 0x93f4
CCu DSA supported if clr @ 0x9405
axd 0x06a0 @ 0x9416
CCu LOW_DUTY @ 0x9423
axd 0x06a1 @ 0x943e
CCu CC_ASSESS_SEL @ 0x943f
axd 0x0697 @ 0x9454
CCu FIFO_SRC_SEL (doc Si4467) @ 0x945d
CCu FIFO contents are phase samples taken on the oversampled bit clock @ 0x9460
f rom.config_modem_ifpkd 1 @ 0x946b
CCu FIFO contents come from packet handler @ 0x946b
CCu RX_CLK_OR_TXBITCLK_IRPT_EN @ 0x9477
CCu set to default @ 0x9483
.(fcn 0x948a 0x94c9 rom.config_modem_chflt)
CCu count = 36 @ 0x948a
CCu dest xreg = 0x0a @ 0x948e
CCu 8th prop group entry (MODEM_CHFLT) @ 0x9494
CCu xmem loc of properties (0x61c) @ 0x94a1
.(fcn 0x94c9 0x94f5 rom.config_dsa_ctrl2)
CCu DSA_EN @ 0x94cc
CCu RX_PREAM_SRC @ 0x94d2
CCu if DSA_ONLY @ 0x94d7
CCu if STANDARD_PREAM @ 0x94db
CCu STANDARD_PREAM @ 0x94dc
CCu PRE_NS (non-std) @ 0x94e2
CCu DSA disabled @ 0x94e6
CCu BCR_GEAR_SHIFT, ARRIVAL_THD @ 0x94ec
.(fcn 0x94f5 0x9513 rom.modem_isr_packet_sent)
CCu usec delay expired @ 0x950b
.(fcn 0x9513 0x9556 rom.0x07_isr)
CCu not implemented @ 0x9542
CCu not implemented @ 0x9552
.(fcn 0x9556 0x95f6 rom.config_modem_clkgen_band)
CCu use override @ 0x955e
CCu BAND (FVCO divider) @ 0x9563
CCu SY_SEL (fixed prescaler 2 or 4) @ 0x956b
CCu SY_SEL (fixed prescaler 2 or 4) @ 0x957f
CCu BAND (FVCO divider) @ 0x9581
CCu temp range @ 0x9595
CCu low power, high temp @ 0x9598
CCu low power, low temp @ 0x959d
CCu high performance @ 0x95a8
CCu temp range @ 0x95bb
CCu high perf, high temp @ 0x95be
CCu high perf, low temp @ 0x95ca
CCu temp range @ 0x95de
CCu high temp @ 0x95e1
CCu low temp @ 0x95e6
.(fcn 0x95f6 0x9600 rom.rssi_config_irq_thresh_up)
CCu set xreg2 modem_rssi_ctrl bit 5 @ 0x95f9
CCu RSSI_THRESH int enable @ 0x95fc
.(fcn 0x9600 0x960a rom.rssi_config_irq_thresh_dwn)
CCu set xreg2 modem_rssi_ctrl bit 4 @ 0x9603
CCu RSSI_THRESH int enable @ 0x9606
.(fcn 0x960a 0x960f rom.rssi_crosses_above_thresh)
.(fcn 0x960f 0x961b rom.modem_isr_rssi_thresh)
CCu irq on thresh up or down? @ 0x9616
.(fcn 0x9620 0x9635 rom.timer_wait_until_done)
CCu wait until timer done @ 0x9622
.(fcn 0x9635 0x9647 rom.timer_wait_r6r7_minus_1_x_30)
CCu RSSI_THRESH int enable @ 0x9663
.(fcn 0x966c 0x96e9 rom.rx_start)
CCu clear ph irq flags @ 0x96c6
CCu RSSI_THRESH int enable @ 0x96d1
CCu if ph enabled @ 0x96d6
CCu start timer? @ 0x96d9
CCu FIFO_SRC_SEL @ 0x96e0
CCu src is packet handler @ 0x96e3
.(fcn 0x96e9 0x96f4 rom.dsp_set_reg_r7_from_cache)
.(fcn 0x96f4 0x9736 rom.rc32k_set_source)
CCu done if value didn't change @ 0x96f9
CCu CLK_32K_SEL = 1? @ 0x96fe
CCu CLK_32K_SEL = 2? @ 0x9701
CCu external clk source @ 0x9703
axd xreg_base+0xac @ 0x9709
CCu internal clk source @ 0x970e
axd xreg_base+0xac @ 0x9714
axd dsp_base+0x4f @ 0x9720
CCu disable clk 32k @ 0x9724
axd xreg_base+0xaa @ 0x972a
.(fcn 0x9736 0x97e1 rom.cmd_ircal)
CCu CMD_ERROR_BAD_COMMAND @ 0x973d
CCu RX_CHAIN_SETTING1 arg @ 0x9755
CCu PGA_GAIN @ 0x9758
CCu CLOSE_SHUNT_SWITCH @ 0x9765
CCu RX_CHAIN_SETTING2 arg @ 0x9773
CCu ADC_HIGH_GAIN @ 0x9776
CCu CHIP_READY @ 0x976e
CCu RX_CHAIN_SETTING1 arg @ 0x9780
CCu EN_HRMNIC_GEN, IRCLKDIV, RF_SOURCE_PWR @ 0x9783
CCu SEARCHING_RSSI_AVG @ 0x978f
CCu undoc bit, default 0 (1=skip ircal?) @ 0x9791
CCu error if stage not 0? @ 0x9799
CCu restore a few regs from cache @ 0x979b
CCu default PGA_GAIN of 12 dB? @ 0x97af
axd dsp_base+0x28 @ 0x97a6
.(fcn 0x97e1 0x97ef rom.bit_timer_oneshot_r7_x_30)
CCu CHIP_READY, indicate completion @ 0x97b8
CCu store cal for reference @ 0x97bd
CCu build reply stream (undocumented) @ 0x97cf
.(fcn 0x97ef 0x97f0 rom.modem_isr_rfpd)
.(fcn 0x97f0 0x97ff rom.modem_isr_preamble_timeout)
CCu if preamble detected, no timeout @ 0x97f0
.(fcn 0x97ff 0x9800 rom.modem_isr_arrivingdet)
.(fcn 0x9800 0x981f rom.ircal_bit_timer_oneshot)
CCu r7=delay lsb (bit clock) @ 0x9814
CCu r6=delay msb @ 0x9816
.(fcn 0x981f 0x9882 rom.ircal_measure_rssi)
CCu RX_CHAIN_SETTING2 arg @ 0x9822
CCu RSSI_READ_DELAY @ 0x9825
CCu loc3b: RSSI_READ_DELAY @ 0x9829
CCu coarse or fine stage? @ 0x982d
CCu SEARCHING_RSSI_AVG arg @ 0x982f
CCu RSSI_FINE_AVG @ 0x9833
CCu RSSI_COARSE_AVG @ 0x9837
CCu loc3a: RSSI_AVG @ 0x983a
CCu convert enum to measurement cnt @ 0x9845
CCu loc3a: rssi measurement cnt @ 0x9849
CCu loc3b: loop cnt @ 0x984c
CCu while timer running @ 0x9862
CCu rssi measurements done @ 0x9852
CCu RSSI_READ_DELAY @ 0x9856
CCu first measurement? @ 0x9867
CCu loc39=RSSI @ 0x986a
CCu calc avg RSSI @ 0x9873
CCu return avg RSSI in r7 @ 0x987f
.(fcn 0x9882 0x988d rom.modem_isr_sync_timout)
CCu clr preamble detected flag @ 0x9885
CCu SYNC_TIMEOUT int disable @ 0x9887
.(fcn 0x988d 0x9897 rom.latch_rssi)
CCu store LATCHED_RSSI for FRR access @ 0x988f
.(fcn 0x9897 0x98e9 rom.modem_set_frequency)
CCu VCO count RX adjust @ 0x9897
CCu SY_SEL @ 0x98a8
CCu high performance mode @ 0x98ab
CCu low-power mode @ 0x98b4
CCu W_SIZE * 2 @ 0x98b5
CCu start hw multiplier @ 0x98bd
CCu wait until hw mul done @ 0x98c0
axd xreg_base+0x94 @ 0x98e6
.(fcn 0x98e9 0x98fa rom.fifo_rx_write_phase_sample)
CCu sign extend bit 6 @ 0x98ec
.(fcn 0x98fa 0x990d rom.fifo_rx_update_pos)
CCu r7 = bytes added to fifo @ 0x98fc
CCu write pos = (write pos + bytes) mod size @ 0x9900
CCu PH filter match @ 0x9904
.(fcn 0x990d 0x99b8 rom.rx_process_byte)
CCu no rx byte available @ 0x9918
CCu no more rx bytes available @ 0x9922
CCu read byte received @ 0x9924
CCu SW_WHT_CTRL @ 0x992b
CCu address of byte whiten @ 0x992e
CCu POSTAMBLE_SIZE (8-32 bits) @ 0x995f
CCu shift in postamble byte @ 0x9944
CCu postamble_en @ 0x994a
CCu prop POSTAMBLE_PATTERN 1 @ 0x994d
axd 0x06c6 @ 0x994d
CCu postamble match? @ 0x9958
CCu expect_len_field @ 0x9975
CCu send packet byte @ 0x9a70
CCu last byte sent? @ 0x9a7f
CCu send postamble byte (01010101) @ 0x9a82
CCu don't write byte if bit set @ 0x9989
CCu r7 = bytes written to fifo @ 0x9991
CCu process next rx byte @ 0x99a9
.(fcn 0x99b8 0x99e3 rom.crc16_byte)
CCu r7 = new byte @ 0x99b8
CCu loop over 8 bits @ 0x99ba
CCu polynom = 0x8005 (CRC-16, Mod-bus, ANSI..) @ 0x99da
.(fcn 0x99e3 0x9a19 rom.whiten_byte)
CCu r7 = address of byte to process @ 0x99e3
.(fcn 0x9a19 0x9a89 rom.tx_ph_send_frame)
CCu decrement pktlen @ 0x9a44
CCu SW_WHT_CTRL @ 0x9a4a
CCu SW_CRC_CTRL @ 0x9a4d
CCu branch if pktlen not 1 @ 0x9a61
CCu branch if pktlen not 0 @ 0x9a61
CCu ptr to var.ph_tx_byte @ 0x9a6c
CCu number of bytes processed @ 0x9a79
.(fcn 0x9a89 0x9a95 rom.fifo_tx_update_pos)
CCu r7 = bytes removed from fifo @ 0x9a8c
CCu read pos = (read pos + bytes) mod size @ 0x9a90
.(fcn 0x9a95 0x9abc rom.fifo_tx_read_byte)
CCu r7 = TX byte to return @ 0x9a9c
CCu reached end of ring buffer? @ 0x9a9d
axd 0x0730 @ 0x9aac
CCu reset/warp tx read ptr @ 0x9aa7
CCu increment tx read ptr @ 0x9ab4
.(fcn 0x9abc 0x9acf rom.modem_isr_phase_sample)
.(fcn 0x9acf 0x9ae3 rom.ircal_set_cal_val_r7)
CCu amp or ph stage @ 0x9ad9
.(fcn 0x9ae3 0x9b9b rom.ircal_calibration_step)
CCu step size @ 0x9ae3
CCu amp or ph stage @ 0x9ae9
CCu correct for sign? @ 0x9af6
CCu loc37: current cal value @ 0x9af4
CCu step size @ 0x9b10
CCu add step size @ 0x9b7c
.(fcn 0x9b9b 0x9c01 rom.ircal_perform_calibration)
CCu SEARCHING_STEP_SIZE arg @ 0x9b9b
CCu FINE_STEP_SIZE @ 0x9b9f
CCu COARSE_STEP_SIZE @ 0x9ba4
CCu SEARCHING_RSSI_AVG arg @ 0x9ba8
CCu undoc bit @ 0x9baa
CCu SEARCHING_STEP_SIZE arg @ 0x9bad
CCu INITIAL_PH_AMP (1=use previous) @ 0x9baf
CCu COARSE_STEP_SIZE @ 0x9bb7
CCu start at stage 2 @ 0x9bb9
CCu if no coarse steps, only do fine stages @ 0x9bbb
CCu start at stage 8 @ 0x9bbd
CCu if stage=0 ircal complete @ 0x9bc6
CCu SEARCHING_RSSI_AVG arg @ 0x9bc8
CCu undoc bit @ 0x9bcb
CCu still in coarse stages? @ 0x9bd3
CCu if yes, go to coarse @ 0x9bd5
CCu FINE_STEP_SIZE @ 0x9bd7
CCu SEARCHING_RSSI_AVG arg @ 0x9bdb
CCu undoc bit @ 0x9bde
CCu FINE_STEP_SIZE @ 0x9be1
CCu coarse calibration @ 0x9bea
CCu if no fine step we're done @ 0x9bec
CCu SEARCHING_RSSI_AVG arg @ 0x9bee
CCu undoc bit @ 0x9bf1
CCu COARSE_STEP_SIZE @ 0x9bf4
.(fcn 0x9c01 0x9c32 rom.cmd_ircal_manual)
CCu IRCAL_AMP_SKIP @ 0x9c04
CCu apply amplitude cal value passed in cmd @ 0x9c07
CCu store for later reference @ 0x9c11
CCu IRCAL_PH_SKIP @ 0x9c15
CCu apply phase cal value passed in cmd @ 0x9c18
CCu store for later reference @ 0x9c22
CCu return calibration data @ 0x9c26
.(fcn 0x9c32 0x9c33 rom.mctlcmd_isr)
.(fcn 0x9c33 0x9c73 rom.dma_enable)
CCu 0x07 in C2A/A2A dumps @ 0x9c35
CCu 0x0b in C2A/A2A dumps @ 0x9c38
CCu set bits 0-1 @ 0x9c4b
CCu clr bits 2-3 @ 0x9c51
CCu dance to enable NVRAM @ 0x9c57
CCu end of NVRAM enable sequence @ 0x9c71
.(fcn 0x9c73 0x9c8f rom.dma_copy)
CCu cmd: COPY @ 0x9c75
axd 0x5103 @ 0x9c7e
CCu cmd: 1 @ 0x9c83
.(fcn 0x9c8f 0x9cb5 rom.dma_run_cmd_r7)
CCu wakeup CPU when DMA complete @ 0x9ca0
CCu put CPU into idle mode @ 0x9ca8
.(fcn 0x9cb5 0x9cd1 rom.dma_disable)
CCu disable NVRAM @ 0x9cbe
CCu clr bit 0 @ 0x9cc7
CCu clr bit 5 @ 0x9ccd
.(fcn 0x9cd1 0x9cfc rom.cmd_func_info)
.(fcn 0x9cfc 0x9d2a rom.cmd_part_info)
.(fcn 0x9d2a 0x9dfe rom.cmd_peek)
CCu peek enabled @ 0x9d2e
CCu CMD_ERROR_BAD_COMMAND @ 0x9d31
CCu arg in buf idx = 1 @ 0x9d35
CCu arg out buf idx = 0 @ 0x9d39
CCu read address from arg buffer @ 0x9d3d
CCu peek addr msb @ 0x9d41
CCu peek addr lsb @ 0x9d45
CCu arg in buf idx += 2 @ 0x9d47
CCu if addr == 0 @ 0x9d4f
CCu output 0 @ 0x9d51
CCu if addr 0x0001-x00ff @ 0x9d5f
CCu read sfr (repeats after 0x80) @ 0x9d61
CCu if addr 0x0100-0x51ff @ 0x9d6c
CCu read xmem @ 0x9d6e
CCu if addr 0x5200-0x54ff @ 0x9d7f
CCu read imem (ignores addr msb) @ 0x9d81
CCu if addr 0x5500-0x74ff @ 0x9d90
CCu read nvram @ 0x9d92
CCu if addr 0x7500-0xdfff @ 0x9da4
CCu read with DMA at addr+0x9500 @ 0x9da6
CCu translates to 0x0a00-0x74ff @ 0x9da9
CCu offset addr by 0x9500 @ 0x9daf
CCu if addr 0xe000-0xf0ff @ 0x9dc8
CCu read dsp reg cache (ignore addr msb) @ 0x9dca
CCu CMD_ERROR_BAD_ARG @ 0x9dda
CCu arg out buf idx += 1 @ 0x9ddf
CCu all 8 peeks done? @ 0x9de3
CCu nope, peek more @ 0x9de8
CCu fill rest of response with 0 @ 0x9dea
.(fcn 0x9dfe 0x9e09 rom.peek_sfr)
CCu indirect access of SFR @ 0x9dfe
.(fcn 0x9e09 0x9e69 rom.spi_parse_more_cmds)
CCu also called in func2 and func3 images (peek&poke!) @ 0x9e09
CCu GET_CHIP_STATUS @ 0x9e0c
CCu FIFO_INFO @ 0x9e12
CCu SET_PROPERTY @ 0x9e18
CCu GET_PROPERTY @ 0x9e1e
CCu REQUEST_DEVICE_STATE @ 0x9e24
CCu PART_INFO @ 0x9e2a
CCu FUNC_INFO @ 0x9e30
CCu AGC_OVERRIDE 0xd0 @ 0x9e36
CCu PEEK @ 0x9e3c
CCu POKE @ 0x9e41
CCu SRAND 0xf2 @ 0x9e46
CCu GPIO_PIN_CFG @ 0x9e4b
CCu START_MFSK 0x35 @ 0x9e51
CCu OFFLINE_RECAL @ 0x9e56
CCu IRCAL_MANUAL @ 0x9e5c
CCu NOP @ 0x9e62
CCu hand over cmd parsing to main loop @ 0x9e66
.(fcn 0x9e69 0x9e77 rom.cmd_srand)
.(fcn 0x9e77 0x9eaa rom.cmd_start_mfsk)
CCu ARG[1]=freq_offset_msb @ 0x9e77
CCu ARG[2]=freq_offset_lsb @ 0x9e7d
CCu ARG[0] bits 1,4-6 stored in xreg 0xf7 @ 0x9e81
CCu keep bits 7 and 3 @ 0x9e8a
CCu set bit 0 @ 0x9e8d
CCu clr bit 6 @ 0x9e93
CCu save old value of sfr.modem_misc3, restored in spi isr @ 0x9e8d @ 0x9e96
CCu MOD_TYPE=CW @ 0x9e9a
CCu TX @ 0x9e9d
.(fcn 0x9eaa 0x9f50 rom.cmd_poke)
CCu poke enabled? @ 0x9eae
CCu poke addr msb @ 0x9ec7
CCu poke addr lsb @ 0x9ecb
CCu poke value @ 0x9ed7
CCu if addr == 0, skip @ 0x9edf
CCu CMD_ERROR_BAD_COMMAND @ 0x9eb1
CCu arg in buf idx = 1 @ 0x9eb5
CCu end of arg in buf? @ 0x9ebd
CCu reached last argument @ 0x9ebf
CCu if addr 0x0001-0x07ff @ 0x9ef2
CCu prevent writing to 0x07f0-0x800 @ 0x9ef4
CCu if addr below 0x0800, skip @ 0x9f02
CCu if addr 0x0001-0x00ff @ 0x9f09
CCu write sfr @ 0x9f0b
CCu if addr 0x00ff-0x51ff @ 0x9f18
CCu write xmem @ 0x9f1a
CCu if addr 0x5100-0x54ff @ 0x9f2c
CCu write imem (ignores msb) @ 0x9f2e
CCu if addr 0x5500-0xf0ff @ 0x9f3f
CCu write dsp reg (ignores msb) @ 0x9f3f
CCu CMD_ERROR_BAD_ARG @ 0x9f48
.(fcn 0x9f50 0x9f5b rom.poke_sfr)
CCu indirect access to SFR @ 0x9f50
.(fcn 0x9f5b 0x9f8a rom.cmd_nop)
CCu echo input args @ 0x9f5b
.(fcn 0x9f8a 0x9fca rom.get_int_status_flags)
CCu current state @ 0x9ff1
CCu current channel @ 0x9ff7
.(fcn 0x9fca 0x9fea rom.get_ph_status_cmd_impl)
CCu clear pending as per PH_CLR_PEND @ 0x9fde
.(fcn 0x9fea 0x9ff9 rom.cmd_request_device_state)
.(fcn 0x9ff9 0x9ffc rom.fifo_rx_get_count_entry)
.(fcn 0x9ffc 0x9fff rom.ph_reset_entry)
.(fcn 0x9fff 0xa000 rom.nop_0x9fff)
echo   ..0xa000

.(fcn 0xa000 0xa020 rom.get_modem_status_flags)
CCu clear pending as per MODEM_CLR_PEND @ 0xa014
.(fcn 0xa020 0xa053 rom.cmd_get_chip_status)
CCu clear pending as per CHIP_CLR_PEND @ 0xa034
CCu INFO_FLAGS.CAL_TYPE @ 0xa046
.(fcn 0xa053 0xa08a rom.cmd_fifo_info)
CCu bit 0: TX reset @ 0xa056
CCu bit 1: RX reset @ 0xa067
CCu FIFO_UNDERFLOW_OVERFLOW_ERROR @ 0xa075
CCu RX fifo count @ 0xa082
CCu TX fifo space @ 0xa088
.(fcn 0xa08a 0xa0c7 rom.fifo_reset)
.(fcn 0xa0c7 0xa110 rom.cmd_get_adc_reading)
CCu ADC_EN @ 0xa0c9
CCu ADC_CFG @ 0xa0cc
CCu if ADC_CFG=0 @ 0xa0d2
CCu 305Hz, 3.2V range @ 0xa0d4
CCu ADC_EN @ 0xa0db
CCu TEMPERATURE_EN @ 0xa0dd
CCu ADC_EN @ 0xa0e3
CCu BATTERY_VOLTAGE_EN @ 0xa0e5
CCu ADC_EN @ 0xa0eb
CCu ADC_GPIO_EN @ 0xa0ed
CCu ADC_GPIO_PIN @ 0xa0f0
.(fcn 0xa110 0xa127 rom.clear_int_chip_update_frr)
f rom.update_frr_data_safe @ 0xa11d
.(fcn 0xa127 0xa1eb rom.wut_event_handler)
CCu 0x40=wait forever for pkt rx @ 0xa12e
CCu if LDC disabled @ 0xa139
CCu sync detected? @ 0xa13d
CCu preamble detected? @ 0xa13f
CCu jmp if no sync or preamble detected @ 0xa144
CCu var.wut_periods @ 0xa146
CCu WUT @ 0xa15d
CCu WUT @ 0xa161
CCu no 32k clk cal @ 0xa169
CCu decrement cal counter @ 0xa16b
CCu WUT_LBD_EN @ 0xa17d
CCu LOW_BATT @ 0xa184
CCu LOW_BATT @ 0xa18b
CCu LOW_BATT @ 0xa194
CCu WUT_LDC_EN @ 0xa1a6
CCu if RX_LDC @ 0xa1af
CCu LDC_MAX_PERIODS @ 0xa1b9
CCu if FOREVER @ 0xa1ba
CCu wait for 2/4/8 LDC periods @ 0xa1bc
CCu wait forever for pkt rx @ 0xa1cf
CCu LDC period mantissa @ 0xa1d8
CCu RX @ 0xa1df
CCu WUT_LDC_EN is not RX_LDC @ 0xa1e7
.(fcn 0xa1eb 0xa1f6 rom.raise_rc32k_cal)
CCu CAL @ 0xa1eb
CCu CAL @ 0xa1ef
.(fcn 0xa1f6 0xa236 rom.raise_int_chip_state_change)
f rom.raise_int_chip_state_change_r5 @ 0xa1f8
CCu store CURRENT_STATE for FRR access @ 0xa1f8
CCu STATE_CHANGE @ 0xa1fd
f rom.raise_int_chip @ 0xa1ff
.(fcn 0xa236 0xa2ae rom.main_loop_bit7_cmd1_2)
CCu CAL @ 0xa278
CCu CAL @ 0xa2a5
.(fcn 0xa2ae 0xa2c7 rom.pti_send_imem_0x8e)
.(fcn 0xa2c7 0xa2e0 rom.pti_send_imem_0x8d)
.(fcn 0xa2e0 0xa2f9 rom.pti_send_imem_0x90)
.(fcn 0xa2f9 0xa313 rom.exit_cmd_with_err)
CCu CMD @ 0xa2fe
CCu CMD_ERROR @ 0xa30b
CCu CMD_ERROR @ 0xa30f
.(fcn 0xa313 0xa331 rom.main_loop_wut_event)
CCu WUT @ 0xa313
CCu RC32K cal @ 0xa31a
CCu WUT expired @ 0xa321
CCu check WUT_SLEEP flag @ 0xa327
CCu SLEEP @ 0xa32b
.(fcn 0xa331 0xa38c rom.adc_read_gpio_r7)
axd xreg_base+0xa2 @ 0xa331
CCu gpio_cfg1 xreg for pin @ 0xa336
CCu prev cfg1 value @ 0xa33a
CCu prev gpio adc sel value @ 0xa33f
CCu create pin mask @ 0xa34b
CCu ADC_CFG @ 0xa357
CCu GPIO_ATT @ 0xa35b
CCu clr bit 2 @ 0xa36d
CCu restore gpio cfg1 @ 0xa37c
CCu set bit 2 @ 0xa37f
CCu restore gpoio adc sel @ 0xa382
.(fcn 0xa38c 0xa3a5 rom.main_loop_change_state)
CCu STATE_CHANGE @ 0xa38e
CCu check cmd busy flag @ 0xa392
CCu jmp if state is SLEEP or greater or equal 12 @ 0xa399
CCu switch(current_state) @ 0xa3a4
f rom.state_jmp_table 1 @ 0xa3a5
CCu SPI_ACTIVE @ 0xa3a5
CCu READY @ 0xa3a7
CCu READY2 @ 0xa3a9
CCu TX_TUNE @ 0xa3ab
CCu RX_TUNE @ 0xa3ad
CCu TX @ 0xa3af
CCu RX @ 0xa3b1
CCu RX_IDLE @ 0xa3b3
CCu EZCONFIG @ 0xa3b5
CCu state=11 @ 0xa3b7
CCu case SPI_ACTIVE: @ 0xa3b9
CCu case READY: @ 0xa3be
CCu case TX_TUNE: @ 0xa3c3
CCu case RX_TUNE: @ 0xa3c8
CCu case TX: @ 0xa3cd
CCu case RX_IDLE: @ 0xa3d2
CCu case RX: @ 0xa3d7
CCu case 11: @ 0xa3dc
CCu case EZCONFIG: @ 0xa3e1
CCu default: change from READY to SLEEP @ 0xa3e6
CCu SLEEP @ 0xa3e9
CCu after switch() @ 0xa3ec
CCu state change in progress? @ 0xa3f0
CCu done with state change processing @ 0xa3fe
CCu state hasn't changed yet, loop @ 0xa402
CCu clr state change in process flag @ 0xa409
.(fcn 0xa40c 0xa412 rom.fifo_tx_get_space)
CCu return tx fifo space @ 0xa40f
.(fcn 0xa412 0xa41b rom.clear_int_ph_safe)
.(fcn 0xa41b 0xa424 rom.raise_cal)
CCu CAL @ 0xa41b
CCu undocumented @ 0xa41f
.(fcn 0xa424 0xa42e rom.spi_err_isr)
CCu FIFO_UNDERFLOW_OVERFLOW_ERROR @ 0xa42a
.(fcn 0xa42e 0xa43d rom.clear_int_modem)
.(fcn 0xa43d 0xa44e rom.exit_cmd_check_busy)
CCu CMD_ERROR_COMMAND_BUSY @ 0xa443
CCu CHIP_READY @ 0xa454
.(fcn 0xa45d 0xa48a rom.main_loop_parse_cmds)
CCu GET_ADC_READING @ 0xa462
CCu IRCAL @ 0xa469
CCu PROTOCOL_CFG @ 0xa471
CCu WAIT_PROPERTY_PROCESSED 0x1b @ 0xa479
.(fcn 0xa48a 0xa4d8 rom.enter_sleep_state)
CCu WUT event raised? @ 0xa48a
axd xreg_base+0xaa @ 0xa49b
CCu SLEEP @ 0xa4a6
CCu exit if next state not SLEEP @ 0xa4b2
CCu same as during boot.failed @ 0xa4c6
CCu set bit2 @ 0xa4c9
CCu wait for bit2 clr @ 0xa4cf
CCu SLEEP @ 0xa48f
.(fcn 0xa4d8 0xa4e5 rom.or_imem919293_into_r7)
.(fcn 0xa4e5 0xa4f7 rom.set_frr_var_r7_to_r5)
.(fcn 0xa4f7 0xa510 rom.rx_ph_clr_and_latch_ints)
CCu var.INT_MODEM_STATUS @ 0xa500
CCu var.INT_CHIP_STATUS @ 0xa508
.(fcn 0xa510 0xa530 rom.adc_enable)
CCu set bit 1 @ 0xa513
CCu set bit 7 @ 0xa519
.(fcn 0xa530 0xa550 rom.ph_reset)
CCu RSSI_THRESH int enable, others disabled @ 0xa545
.(fcn 0xa550 0xa57a rom.config_radio_after_reset)
CCu SPI_ACTIVE @ 0xa550
CCu SLEEP @ 0xa554
CCu SPI_ACTIVE @ 0xa576
.(fcn 0xa57a 0xa58d rom.config_usec_timer_reset)
axd xreg_base+0xee @ 0xa581
.(fcn 0xa58d 0xa5ad rom.config_frr_ctl)
.(fcn 0xa5ad 0xa5ee rom.config_radio_after_power_up)
CCu SPI_ACTIVE @ 0xa5ad
CCu POWER_UP @ 0xa5b1
CCu SPI_ACTIVE @ 0xa5e0
CCu EZConfig supported? @ 0xa5e3
CCu EZCONFIG @ 0xa5ea
.(fcn 0xa5ee 0xa657 rom.config_int)
f rom.config_int_ctl 1 @ 0xa621
CCu PH_INT_STATUS_EN @ 0xa626
axd 0x060e @ 0xa629
CCu MODEM_INT_STATUS_EN @ 0xa635
CCu CHIP_INT_STATUS_EN @ 0xa646
.(fcn 0xa657 0xa6ba rom.cmd_offline_recal)
CCu undoc arg @ 0xa657
CCu undoc arg @ 0xa65b
CCu CAL_CTRL @ 0xa65e
CCu TEMP @ 0xa661
CCu LOW_TEMP @ 0xa664
CCu HIGH_TEMP @ 0xa668
CCu OFFLINE_CAL type @ 0xa66d
CCu cal type OFFLINE2_CAL @ 0xa670
CCu cal type OFFLINE_CAL @ 0xa694
.(fcn 0xa6bd 0xa6c2 rom.config_int_ctl_entry)
.(fcn 0xa6c2 0xa6cd rom.clr_timer_callbacks)
.(fcn 0xa6cd 0xa6de rom.set_const_xo_div_250000)
CCu 0x03d090 = 250000 decimal @ 0xa6cd
.(fcn 0xa6de 0xa6f5 rom.update_state_change_flag)
CCu if r7 is different from next state, return @ 0xa6e0
CCu if r7 is RX or TX @ 0xa6e3
CCu check if curr channel equal to 0x62 @ 0xa6ee
CCu clr change state flag @ 0xa6f2
.(fcn 0xa6f5 0xa6f8 rom.change_from_tx_tune_to_tx)
.(fcn 0xa6f8 0xa6fe rom.change_from_ready_to_tx)
.(fcn 0xa6fe 0xa705 rom.change_from_rx_tune_to_rx)
CCu RX @ 0xa6fe
.(fcn 0xa705 0xa713 rom.change_from_ready_to_other)
CCu state SPI_ACTIVE @ 0xa705
CCu state SPI_ACTIVE @ 0xa70f
.(fcn 0xa713 0xa73b rom.change_state_from_ready)
CCu next state is TX_TUNE @ 0xa717
CCu next state is RX_TUNE @ 0xa71a
CCu next state is TX @ 0xa71d
CCu next state is RX @ 0xa720
CCu next state is 11 @ 0xa724
CCu next state is not READY @ 0xa728
CCu READY @ 0xa72a
.(fcn 0xa73b 0xa748 rom.change_from_ready_to_rx_tune)
CCu RX_TUNE @ 0xa73b
CCu RX_TUNE @ 0xa744
.(fcn 0xa748 0xa755 rom.change_from_ready_to_tx_tune)
CCu TX_TUNE @ 0xa748
CCu TX_TUNE @ 0xa751
.(fcn 0xa755 0xa764 rom.change_from_ready_to_rx)
CCu RX @ 0xa758
CCu RX @ 0xa75c
.(fcn 0xa764 0xa774 rom.change_from_rx_to_rx_tune)
CCu RX_TUNE @ 0xa764
CCu RX,CCA_LATCH @ 0xa76b
.(fcn 0xa774 0xa786 rom.change_state_from_tx_to_rx)
CCu RX_TUNE @ 0xa770
CCu RX @ 0xa776
CCu RX @ 0xa77c
CCu TX @ 0xa77e
.(fcn 0xa7b5 0xa7d2 rom.config_pti_baud)
CCu r4r5r6r7 = baudrate / 100 @ 0xa7be
CCu 100 dec @ 0xa7c0
CCu some math together with 0x071b @ 0xa7c5
.(fcn 0xa7d2 0xa7d7 rom.main_loop_unknown_cmd)
CCu CMD_ERROR_BAD_COMMAND @ 0xa7d2
.(fcn 0xa7d7 0xa7f3 rom.change_state_from_rx_idle)
CCu is next state RX_IDLE_TIMEOUT (0x0e) @ 0xa7dd
CCu RX @ 0xa7e4
.(fcn 0xa7f3 0xa7f7 rom.change_state_from_11)
.(fcn 0xa7f7 0xa7fa rom.set_flags_25_6)
.(fcn 0xa800 0xa84c rom.config_pti)
CCu PTI_EN @ 0xa807
CCu if PTI disabled, ignore PTI_LOG_EN @ 0xa811
CCu combine PTI_EN and PTI_LOG_EN rx/tx @ 0xa81f
CCu PTI_EN @ 0xa827
CCu undocumented property @ 0xa830
CCu zero if PTI disabled @ 0xa836
.(fcn 0xa84c 0xa858 rom.change_from_rx_tune_to_ready)
CCu READY @ 0xa84c
CCu READY @ 0xa854
.(fcn 0xa858 0xa881 rom.gpio_reset_cfg)
axd xreg_base+0x99 @ 0xa861
CCu copy gpio_xx_cfg2 into xreg @ 0xa865
axd xreg_base+0xa2 @ 0xa86e
CCu copy gpio_xx_cfg1 into xreg @ 0xa872
CCu reset pin state if mode not NIRQ or PKT_TRACE?? @ 0xa873
.(fcn 0xa881 0xa88c rom.change_from_rx_tune)
CCu is next state RX? @ 0xa883
.(fcn 0xa88c 0xa8cd rom.change_from_rx)
CCu mask PROTOCOL @ 0xa896
CCu 1 = IEEE 802.15.4.g compliant @ 0xa89b
CCu CRC_INVERT @ 0xa8a5
CCu is next state RX_TUNE? @ 0xa8af
CCu is next state RX? @ 0xa8b3
CCu is next state not TX? @ 0xa8b6
.(fcn 0xa8cd 0xa8ec rom.change_from_rx_to_tx)
CCu TX @ 0xa8cd
CCu TX @ 0xa8d7
CCu RX,CCA_LATCH @ 0xa8d9
.(fcn 0xa8ec 0xa8fc rom.change_from_rx_to_rx)
CCu RX @ 0xa8ec
.(fcn 0xa8fc 0xa925 rom.cmd_power_up)
CCu complete power up cmd @ 0xa8fc
CCu bytes in spi buffer @ 0xa8ff
CCu spi buffer empty? @ 0xa903
CCu is XO freq provided? @ 0xa905
axd 0x0719 @ 0xa90d
CCu r2r3 = 0x8000 (=32K) @ 0xa916
axd 0x0742 @ 0xa921
.(fcn 0xa925 0xa949 rom.movx_spibuf_to_r6r7_lenr5)
CCu dest: r6r7 @ 0xa925
CCu src: SPI buffer @ 0xa929
CCu max len? @ 0xa92b
CCu count: r5 @ 0xa92f
CCu done when r7==0 @ 0xa940
.(fcn 0xa949 0xa974 rom.power_up_entry)
CCu signal state change @ 0xa94d
CCu READY @ 0xa968
.(fcn 0xa974 0xa97b rom.init_sfr0x93_sfr0x86)
.(fcn 0xa97b 0xa9a8 rom.reset_entry)
f rom.reset_entry_patched 1 @ 0xa97d
CCu signal state change @ 0xa97d
CCu SPI_ACTIVE @ 0xa99f
.(fcn 0xa9a8 0xa9c4 rom.config_low_power_flag)
CCu bit 0: 1=low power, 0=high perf @ 0xa9b2
CCu set low power flag @ 0xa9bd
CCu clear low power flag @ 0xa9c0
.(fcn 0xa9c4 0xaa1f rom.dsp_config_reg_0x06)
CCu temp range @ 0xa9c7
CCu temp range @ 0xa9e0
CCu ETSI @ 0xa9f5
CCu ETSI_868 @ 0xa9ff
CCu ETSI_169 @ 0xaa04
.(fcn 0xaa1f 0xaa32 rom.reset_finish)
.(fcn 0xaa32 0xaa3b rom.save_flags_26)
.(fcn 0xaa3b 0xaa63 rom.timer0_config_callback2)
CCu set timer0 irq callback @ 0xaa48
CCu if callback is not 0 @ 0xaa4d
.(fcn 0xaa63 0xaa7d rom.timer0_config_callback)
CCu set timer irq callback @ 0xaa66
axd _idata+0x89 @ 0xaa66
CCu if callback is not 0 @ 0xaa6b
.(fcn 0xaa7d 0xaaa3 rom.timer1_config_callback2)
CCu r6=delay msb? @ 0xaa7d
CCu r7=delay in Ts (oversampling clk periods) @ 0xaa7f
CCu if callback is 0 @ 0xaa8d
.(fcn 0xaaa3 0xaabe rom.timer1_config_callback)
CCu r7=delay lsb @ 0xaaab
CCu r6=delay msb @ 0xaab6
.(fcn 0xaabe 0xaad3 rom.timer0_isr)
axd _idata+0x8b @ 0xaad8
CCu if callback is not 0 @ 0xaac5
CCu push them on stack as return addr @ 0xaac7
.(fcn 0xaad3 0xaae8 rom.timer1_isr)
CCu if callback is not 0 @ 0xaada
CCu push it on stack as return addr @ 0xaadc
.(fcn 0xaae8 0xaaf5 rom.timer1_clr_callback)
CCu stop timer @ 0xaaee
CCu disable timer interrupt @ 0xaaf1
.(fcn 0xaaf5 0xaafe rom.timer1_pause)
.(fcn 0xaafe 0xab23 rom.timer1_disable)
CCu stop ph hw @0xab0f
axd xreg_base+0x02 @ 0xab1b
CCu clear ph irq flags @ 0xab1f
.(fcn 0xab23 0xab43 rom.copy_xreg0x4a_to_0x737)
CCu copy xreg.0x4a-0x4d to 0x0737-0x073a @ 0xab2b
axd xreg_base+0x4b @ 0xab32
axd 0x0738 @ 0xab34
axd xreg_base+0x4c @ 0xab36
axd 0x0739 @ 0xab38
axd xreg_base+0x4d @ 0xab3a
axd 0x073a @ 0xab3c
.(fcn 0xab43 0xab77 rom.ph_info_isr_sync_detected)
CCu sync detected @ 0xab43
CCu SYNC_TIMEOUT int disable @ 0xab45
CCu latch on sync @ 0xab4e
CCu CCA_LATCH @ 0xab56
axd 0x0736 @ 0xab63
axd _idata+0x87 @ 0xab74
.(fcn 0xab77 0xaba1 rom.config_preamble_timeout)
CCu RX_PREAMBLE_TIMEOUT @ 0xab7c
CCu RX_PREAMBLE_TIMEOUT_EXTEND @ 0xab80
CCu PREAMBLE_TIMEOUT int disable @ 0xab87
axd xreg_base+0x57 @ 0xab98
CCu PREAMBLE_TIMEOUT int enable @ 0xab9d
.(fcn 0xaba1 0xac64 rom.config_preamble)
axd xreg_base+0xd2 @ 0xaba4
axd 0x06be @ 0xabb0
CCu STANDARD_PREAM @ 0xabc5
CCu branch if 0101 @ 0xabc9
CCu branch if non-std @ 0xabcc
CCu preamble is 1010 @ 0xabce
CCu preamble is 0101 @ 0xabd3
CCu preamble is non-std @ 0xabd8
CCu PREAMBLE_CONFIG @ 0xabde
CCu MAN_ENABLE @ 0xabdf
CCu preamble is manchester encoded @ 0xabe2
CCu MAN_CONST @ 0xabe9
CCu PREAM_FIRST_1_OR_0 @ 0xabf4
CCu enable preambles @ 0xabfa
CCu RX_THRESH @ 0xac01
CCu branch if no preamble check @ 0xac03
CCu no rx preamble @ 0xac05
CCu branch if tx preamble @ 0xac0d
CCu no tx preamble @ 0xac0f
CCu PREAMBLE_CONFIG @ 0xac18
CCu LENGTH_CONFIG @ 0xac19
CCu branch if length in bytes @ 0xac1f
CCu store length in nibbles @ 0xac21
CCu nibbles = bytes * 2 @ 0xac27
CCu len in nibbles msb @ 0xac2d
CCu lsb @0xac32
CCu dec tx preamble len by 1 @ 0xac34
CCu EN_3_OF_6 encoding @ 0xac40
CCu PREAMBLE_TX_LENGTH in nibbles bit 8 @ 0xac46
axd xreg_base+0xcc @ 0xac4e
CCu PREAMBLE_TX_LENGTH bits 7-0 @ 0xac4f
CCu POSTAMBLE_EN @ 0xac56
CCu DSA @ 0xac5d
.(fcn 0xac64 0xac70 rom.config_run_r7)
f rom.config_cmd_table 1 @ 0xac70
.(fcn 0xaccc 0xad37 rom.config_pkt_crc)
CCu ALT_CRC_POLYNOMIAL @ 0xacd1
CCu 0x8cc5=rom.crc_poly_table+2 @ 0xacdb
axd 0x8cc5 @ 0xacdb
axd xreg_base+0xb5 @ 0xacea
CCu CRC_POLYNOMIAL @ 0xaced
CCu 0x8cc3=rom.crc_poly_table @ 0xacf3
axd 0x8cc3 @ 0xacf3
axd xreg_base+0xbe @ 0xacfe
CCu CRC_SEED @ 0xad07
CCu set CRC value to all 1 @ 0xad0a
axd xreg_base+0xc1 @ 0xad0f
axd xreg_base+0xc0 @ 0xad11
axd xreg_base+0xbf @ 0xad13
CCu set CRC value to seed (default 0) @ 0xad1a
axd xreg_base+0xc2 @ 0xad1a
CCu ALT_CRC_SEED @ 0xad25
axd xreg_base+0xb7 @ 0xad2e
.(fcn 0xad37 0xad67 rom.config_pkt_whitening)
CCu write poly to xreg @ 0xad3a
axd xreg_base+0xc8 @ 0xad3a
CCu write PHT_WHT_SEED to xreg @ 0xad3f
axd xreg_base+0xca @ 0xad3f
CCu SW_CRC_CTRL (enable sw crc) @ 0xad5f
CCu PKT_WHT_BIT_NUM @ 0xad44
CCu WHT_BIT_NUM @ 0xad45
CCu PN_DIRECTION @ 0xad50
CCu SW_WHT_CTRL (enable sw whitening) @ 0xad64
.(fcn 0xad67 0xade2 rom.config_sync)
axd xreg_base+0xd7 @ 0xad6b
CCu SKIP_TX @ 0xad95
CCu no tx sync word @ 0xad98
CCu send sync word on tx @ 0xad9d
CCu SYNC_ERROR_ONLY_BEGIN @ 0xada5
CCu RX_ERRORS, 4FSK, MANCH @ 0xada9
CCu DUAL_SYNC_EN @ 0xadb0
CCu dual sync word supported? @ 0xadb7
CCu 2-bit sync length resolution supported? @ 0xadc5
CCu LENGTH * 4 @ 0xadc8
CCu LENGTH_SUB @ 0xadd0
CCu LENGTH * 4 @ 0xadd8
.(fcn 0xade2 0xaeba rom.config_pa)
CCu PA_SEL @ 0xadea
CCu if PA_SEL=HP_COARSE @ 0xadf3
CCu if PA_SEL=HP_FINE @ 0xae03
CCu if PA_SEL=LP @ 0xae13
CCu if PA_SEL=MP @ 0xae23
CCu undocumented @ 0xae3e
CCu TX @ 0xae5d
axd dsp_base+0x46 @ 0xae75
CCu TC @ 0xae77
CCu OB @ 0xae7d
CCu CLK_DUTY @ 0xae8b
f rom.config_pa_ramp_down_delay @ 0xae99
CCu SW_WHT_CTRL @ 0xaec2
CCu W_CRC_CTRL @ 0xaec7
.(fcn 0xaeba 0xaed3 rom.tx_ph_start)
.(fcn 0xaed3 0xaf17 rom.rx_ph_start)
CCu clr LATCHED_RSSI for FRR access @ 0xaf01
CCu SW_WHT_CTRL @ 0xaf06
CCu SW_CRC_CTRL @ 0xaf0b
.(fcn 0xaf17 0xaf23 rom.read_wht_seed_from_xreg)
CCu set flag 24.6 to xreg.wht_seed_msb bit0 @ 0xaf17
.(fcn 0xaf23 0xaf32 rom.read_crc16_from_xreg)
.(fcn 0xaf32 0xaf44 rom.config_pa_mode)
CCu PA_MODE @ 0xaf35
CCu mode SWC (switched current) @ 0xaf39
CCu mode CLE (class e) @ 0xaf3d
.(fcn 0xaf44 0xafcb rom.config_pkt_config)
CCu clr BIT_ORDER, MANCH_POL @ 0xaf47
CCu clr CRC_PADDING @ 0xaf4a
CCu 4FSK_EN @ 0xaf52
CCu undocumented @ 0xaf59
CCu MANCH_POL @ 0xaf60
CCu CRC_INVERT @ 0xaf67
CCu CRC_ENDIAN @ 0xaf6e
CCu BIT_ORDER @ 0xaf75
CCu CRC_BIT_ENDIAN @ 0xaf88
CCu CRC_PADDING @ 0xaf8f
CCu EN_3_OF_6 @ 0xaf9f
CCu PH_FIELD_SPLIT @ 0xafb9
CCu rx and tx split pkt field cfg @ 0xafbc
axd 0x06f1 @ 0xafbc
CCu rx and tx share pkt field cfg @ 0xafc2
axd 0x06dd @ 0xafc2
.(fcn 0xafcb 0xafde rom.ph_disable)
CCu disable packet handler @ 0xafcf
CCu reset ph irq flags @ 0xafd5
CCu reset ph status flags @ 0xafd8
.(fcn 0xafde 0xafed rom.tx_ph_ae_isr)
CCu # of bytes below 8 to send to DSP at a time (set to 2) @ 0xafe1
CCu tx in chunks, based on DSP buffer size? @ 0xafe2
.(fcn 0xafed 0xaff0 rom.rx_ph_af_isr)
.(fcn 0xaff0 0xaffd rom.ph_halt_isr)
CCu usec delay expired @ 0xaff0

echo   ..0xb000

.(fcn 0xb000 0xb027 rom.ph_info_isr)
CCu not implemented @ 0xb01b
.(fcn 0xb027 0xb03e rom.ph_err_isr)
CCu clr crc errors @ 0xb02a
.(fcn 0xb03e 0xb070 rom.tx_raw_send_frame)
CCu TX 0x0e byte frames from buffer r6r7 @ 0xb03e
CCu buffer length [0x0a:0x0b] less then frame size [0x0e]? @ 0xb045
CCu if so, TX [0x0b] bytes @ 0xb047
CCu clr bit 0 (TX) @ 0xb04e
CCu decrement buffer length @ 0xb056
CCu decrement frame count @ 0xb05d
CCu set bit 0 (TX) @ 0xb060
CCu send postamble byte? (01010101) @ 0xb068
CCu return current buffer position @ 0xb06b
CCu report PH filter match @ 0xb079
.(fcn 0xb07e 0xb09b rom.ph_info_isr_preamble_detected)
CCu preamble detected @ 0xb07e
CCu PREAMBLE_TIMEOUT int disable @ 0xb083
CCu RSSI_JUMP int enable @ 0xb086
CCu latch RSSI on preamble detect @ 0xb08f
CCu SYNC_TIMEOUT int enable @ 0xb097
.(fcn 0xb09b 0xb0a5 rom.xreg0x02_bit0_set_and_clr)
.(fcn 0xb0a5 0xb0be rom.movx_0x0737_to_xreg0x46)
CCu copy 0x0737-0x073a to xreg.0x46-0x49 @ 0xb0ac
axd xreg_base+0x46 @ 0xb0b0
axd xreg_base+0x49 @ 0xb0b5
.(fcn 0xb0be 0xb0f9 rom.ph_info_isr_pkt_end)
CCu SW_CRC_CTRL @ 0xb0c4
CCu raise PH CRC error @ 0xb0d3
CCu raise PH ALT CRC error @ 0xb0e2
CCu raise PH CRC error @ 0xb0eb
.(fcn 0xb0f9 0xb100 rom.rx_ph_pkt_complete)
.(fcn 0xb100 0xb10a rom.ph_info_isr_error)
.(fcn 0xb10a 0xb134 rom.cmd_protocol_cfg)
CCu packet format generic @ 0xb10d
CCu packet format IEEE802.15.4g compliance @ 0xb110
CCu CMD_ERROR_BAD_ARG @ 0xb11b
.(fcn 0xb134 0xb13e rom.determine_sync_trigger)
.(fcn 0xb13e 0xb146 rom.rc32k_xreg0xe5_write_r7_xreg0xe6_write_0)
axd xreg_base+0xe6 @ 0xb143
.(fcn 0xb146 0xb14b rom.rc32k_xreg0x08_write_r7)
.(fcn 0xb14b 0xb16e rom.rc32k_calibrate)
CCu skip if no cal requested @ 0xb14e
CCu use internal clk @ 0xb151
.(fcn 0xb16e 0xb1cd rom.rc32k_cal_unk0xb16e)
.(fcn 0xb1cd 0xb1e2 rom.rc32k_read_xreg_0xe7_0xe8)
axd xreg_base+0xe7 @ 0xb1dc
.(fcn 0xb1e2 0xb230 rom.rc32k_do_cal)
CCu max positive trim value? @ 0xb1ed
CCu max negative trim value? @ 0xb1f3
CCu reset RC trimming @ 0xb1f7
CCu compare to rc32k_xtal_divider @ 0xb216
axd dsp_base+0x4f @ 0xb22b
.(fcn 0xb230 0xb2b2 rom.rc32k_cal_unk0xb230)
axd 0x076d @ 0xb25e
.(fcn 0xb2b2 0xb2bf rom.rc32k_cal_unk0xb2b2)
.(fcn 0xb2bf 0xb2d2 rom.rc32k_cal_unk0xb2bf)
.(fcn 0xb2d2 0xb35c rom.rc32k_cal_unk0xb2d2)
CCu rc32k_xtal_divider_msb @ 0xb2d2
CCu rc32k_xtal_divider_lsb @ 0xb2d4
CCu select lo (0) or hi (1) nibble of cal_data_0x0e @ 0xb2d6
CCu r5 is 0x4e or 0x4f @ 0xb2e7
CCu compare to rc32k_xtal_divider @ 0xb303
CCu compare to rc32k_xtal_divider+1 @ 0xb311
.(fcn 0xb35c 0xb371 rom.xreg0xdf_wiggle_bit1_ret_bit3)
CCu 0xb364 busy wait 10 loops @ 0xb362
.(fcn 0xb371 0xb3de rom.dsp_reg_r7_unk0xb371)
CCu r7 = dsp reg addr @ 0xb371
CCu r5 = value written to dsp reg 0x47 @ 0xb373
CCu exit if r5 is 0x7f @ 0xb376
CCu enable ADC @ 0xb37b
axd xreg_base+0xdf @ 0xb37f
CCu 0x0798: dsp_reg_cache @ 0xb38c
axd 0x0798 @ 0xb38c
CCu 0x0798: dsp_reg_cache @ 0xb3c8
axd 0x0798 @ 0xb3c8
CCu set bit 1 @ 0xb3d2
axd xreg_base+0xdf @ 0xb3d5
CCu disable ADC @ 0xb3da
axd xreg_base+0xe0 @ 0xb3dc
.(fcn 0xb3de 0xb3f2 rom.flag0x28_4_handler)
.(fcn 0xb3f2 0xb426 rom.flag0x28_processing)
.(fcn 0xb426 0xb434 rom.flag0x28_5_handler)
axd dsp_base+0x17 @ 0xb42f
.(fcn 0xb434 0xb44f rom.flag0x28_6_handler)
.(fcn 0xb44f 0xb50b rom.main_loop_bit7_cmd3_to_9)
CCu state RX @ 0xb466
CCu state TX @ 0xb472
CCu state SPI_ACTIVE @ 0xb47b
.(fcn 0xb50b 0xb519 rom.flag0x28_7_handler)
axd dsp_base+0x14 @ 0xb514
.(fcn 0xb519 0xb52d rom.flag0x28_2_handler)
.(fcn 0xb52d 0xb541 rom.flag0x28_1_handler)
.(fcn 0xb541 0xb560 rom.flag0x28_3_handler)
.(fcn 0xb560 0xb56b rom.modem_start_unk0xb560)
.(fcn 0xb57f 0xb58c rom.main_loop_bit7_event)
CCu related to IR calibration? @ 0xb560
CCu if next bit7 cmd not 2 @ 0xb5df
CCu if next bit7 cmd not 0 @ 0xb5e3
CCu raise another bit7 event @ 0xb5e5
CCu next bit7 cmd @ 0xb5ea
.(fcn 0xb5f1 0xb5f9 rom.main_loop_bit7_cmd10)
.(fcn 0xb5f9 0xb617 rom.main_loop_bit7_cmd0)
.(fcn 0xb617 0xb6ad rom.radio_spi_active_to_ready)
axd dsp_base+0x00 @ 0xb635
axd xreg_base+0xda @ 0xb64b
axd xreg_base+0xdb @ 0xb64f
axd xreg_base+0xdc @ 0xb653
axd xreg_base+0xdc @ 0xb65f
axd xreg_base+0xda @ 0xb686
axd 0x0740 @ 0xb69f
.(fcn 0xb6ad 0xb6c5 rom.wut_check_low_batt)
CCu en ADC, BATT @ 0xb6b0
CCu low batt bit @ 0xb6bd
CCu disable ADC, BATT @ 0xb6c1
.(fcn 0xb6c5 0xb6dc rom.dsp_set_0x03_0x57_from_cache_set_0x87_to_0x02)
.(fcn 0xb6dc 0xb713 rom.raise_int_ph)
.(fcn 0xb713 0xb74a rom.raise_int_modem)
.(fcn 0xb74a 0xb7b8 rom.latch_and_process_int_pending)
CCu mask interrupts @ 0xb74a
CCu latch pending interrupts @ 0xb75a
CCu process pending interrupts @ 0xb76e
f rom.process_int_pending @ 0xb76e
afu 0xb7c5 @ 0xb7b8
axd xreg_base+0x0ab @ 0xb7c1
.(fcn 0xb7c5 0xb7db rom.config_clk)
axd xreg_base+0x0ab @ 0xb7d1
afu 0xb7e5 @ 0xb7db
CCu starts modem, sets dsp addr 0x53 @ 0xb7db
.(fcn 0xb7e5 0xb7f2 rom.change_from_spi_active_to_13)
CCu READY @ 0xb7ee
afu 0xb7fc @ 0xb7f2
.(fcn 0xb800 0xb84a rom.modem_start_tx)
CCu indicate we're in TX @ 0xb800
CCu var.modem_fsk4_map_val1 @ 0xb81d
f rom.modem_start 1 @ 0xb823
CCu TX (set) or RX (clr)? @ 0xb823
.(fcn 0xb853 0xb872 rom.modem_start_rx)
CCu indicate we're in RX @ 0xb853
CCu var.modem_fsk4_map_val2 @ 0xb86a
.(fcn 0xb872 0xb8c7 rom.psm_enable)
CCu IDLE_TIME msb @ 0xb875
axd 0x069c @ 0xb879
CCu IDLE_TIME lsb @ 0xb87a
CCu skip if PSM idle time is longer than ?? @ 0xb887
CCu is state RX? @ 0xb893
CCu state change in progress? @ 0xb897
CCu state change in progress? @ 0xb89a
CCu timer1 will call 0x0075 @ 0xb8b7
axc 0x0075 @ 0xb8b7
CCu RX_IDLE @ 0xb8be
.(fcn 0xb8c7 0xb8e8 rom.psm_timer1_callback)
CCu RX_IDLE @ 0xb8c9
CCu state change in progress @ 0xb8cd
CCu state change in progress @ 0xb8d0
CCu synth recal @ 0xb8d3
CCu RX_IDLE_TIMEOUT @ 0xb8e0
.(fcn 0xb8e8 0xb92e rom.tx_start)
axd xreg_base+0x01 @ 0xb904
CCu EXT_PA_RAMP @ 0xb918
CCu PKT_SENT int enable @ 0xb928
CCu PKT_SENT int disable @ 0xb952
CCu if TCXO jmp @ 0xb964
CCu if XO not ready jmp @ 0xb96a
.(fcn 0xb971 0xb97f rom.clk_wait_for_xo_ready)
CCu if TCXO jmp @ 0xb975
.(fcn 0xb97f 0xb9c5 rom.clk_unk0xb97f)
CCu wait until XO ready @ 0xb97b
.(fcn 0xb9c5 0xb9d8 rom.clk_bufclk_enable)
CCu DIVIDED_BUFCLK_MODE @ 0xb9c9
CCu disabled? @ 0xb9cb
.(fcn 0xb9d8 0xba0d rom.clk_config_div_clk_output)
CCu mask DIVIDED_CLK_SEL @ 0xb9dd
CCu DIVIDED_CLK_EN @ 0xb9e7
CCu skip if no change @ 0xb9f5
CCu first clear enable bit @ 0xba01
CCu update div clk output setting @ 0xba04
CCu set enable bit as configured @ 0xba07
.(fcn 0xba0d 0xba27 rom.clk_bufclk_unk0xba0d)
CCu BUFCLK @ 0xba18
.(fcn 0xba27 0xba40 rom.modem_start_unk0xba27)
.(fcn 0xba40 0xba63 rom.vco_calibration)
axd xreg_base+0x96 @ 0xba4f
axd xreg_base+0x95 @ 0xba57
axd xreg_base+0xd9 @ 0xba68
.(fcn 0xba78 0xbb11 rom.cmd_gpio_pin_config)
CCu GPIO0 (pin 9) @ 0xba78
CCu GPIO1 (pin 10) @ 0xba81
CCu GPIO2 (pin 19) @ 0xba8a
CCu GPIO3 (pin 20) @ 0xba93
CCu SDO (pin 13) @ 0xba9c
CCu NIRQ (pin 11) @ 0xbaa5
CCu GEN_CONFIG @ 0xbab5
CCu DRV_STRENGTH @ 0xbab8
CCu built response @ 0xbac3
CCu GEN_CONFIG @ 0xbac7
CCu SDO @ 0xbad3
CCu GPIO3 @ 0xbadd
CCu GPIO2 @ 0xbae9
CCu GPIO1 @ 0xbaec
CCu GPIO0 @ 0xbaf9
CCu if pin mode 32 (undocumented) @ 0xbb02
CCu pin mode NIRQ @ 0xbb05
CCu NIRQ @ 0xbb0d
.(fcn 0xbb11 0xbb55 rom.gpio_config_pins)
.(fcn 0xbb55 0xbba1 rom.gpio_read_pin_states_into_cfg1)
axd xreg_base+0xa2 @ 0xbb59
CCu cfg.gpio_gpio0_cfg1 @ 0xbb5b
axd 0x0727 @ 0xbb5b
CCu counter of pins @ 0xbb61
CCu extra shr if r5 is 1 or 2 @ 0xbb6b
CCu read cfg.gpio_xx_cfg1 @ 0xbb75
CCu check pin state @ 0xbb7c
CCu update xreg.gpio_xx_cfg1 @ 0xbb7f
CCu update xreg.gpio_xx_cfg1 @ 0xbb87
CCu inc ptr to cfg.gpio_xx_cfg1 @ 0xbb8b
CCu inc ptr to xreg.gpio_xx_cfg1 @ 0xbb93
CCu shr gpio pin state2 @ 0xbb94
.(fcn 0xbba1 0xbba5 rom.gpio_state_set_r7)
CCu set gpio output for modes 32-39 @ 0xbba1
.(fcn 0xbba5 0xbbaa rom.gpio_state_clr_r7)
CCu clear gpio output for modes 32-39 @ 0xbba5
.(fcn 0xbbaa 0xbbae rom.gpio_state_toggle_r7)
CCu toggle gpio output for modes 32-39 @ 0xbbaa
.(fcn 0xbbae 0xbbbf rom.gpio_state_clr_r7_set_r5_toggle_r3)
CCu update gpio output for modes 32-39 @ 0xbbae
.(fcn 0xbbbf 0xbc2b rom.gpio_read_pin_cfg)
CCu pin @ 0xbbbf
CCu cfg @ 0xbbc1
CCu 0 = do nothing @ 0xbbc5
CCu GPIO_MODE @ 0xbbc9
CCu clr cfg bit 7 @ 0xbbcb
CCu GPIO0 @ 0xbbd0
CCu GPIO1 @ 0xbbd4
CCU GPIO2 @ 0xbbda
CCu not GPIO3 @ 0xbbe0
CCu config GPIO @ 0xbbe2
CCu err if mode above 39 @ 0xbbe9
CCu mode PKT_TRACE @ 0xbbef
CCu skip if mode below 33 @ 0xbbf6
CCu set cfg bit 7 @ 0xbbf8
CCu pin SDO @ 0xbbff
CCu err if mode above 27 @ 0xbc04
CCu CMD_ERROR_BAD_ARGUMENT @ 0xbc09
CCu pin NIRQ @ 0xbc12
CCu mode NIRQ (27) @ 0xbc17
CCu set cfg bit 7 @ 0xbc1a
CCu override pin config @ 0xbc20
CCu store pin config @ 0xbc29
.(fcn 0xbc2b 0xbc7b rom.gpio_config_pin)
CCu r5=mode r7=pin @ 0xbc2b
axd 0x8c2b @ 0xbc32
CCu r6=val1 from lookup table @ 0xbc3c
CCu r5=val2 from lookup table @ 0xbc3f
CCu pull-up resistor @ 0xbc41
CCu set val1.7 @ 0xbc44
CCu copy val2.5-6 from xreg gpio0_cfg2 @ 0xbc4a
CCu 0x071f=cfg.gpio_xx_cfg2 @ 0xbc4e
axd 0x071f @ 0xbc4e
CCu store val2 into cfg.gpio_xx_cfg2 @ 0xbc59
CCu if val1 and 0x0f equal 4? @ 0xbc5e
axd xreg_base+0x99 @ 0xbc61
CCu store val2 in xreg.gpio_xx_cfg2 @ 0xbc66
axd xreg_base+0xa2 @ 0xbc67
CCu store val1 in xreg.gpio_xx_cfg1 @ 0xbc6c
axd xreg_base+0xa2 @ 0xbc6e
CCu store val1 in xreg.gpio_xx_cfg1 @ 0xbc73
axd xreg_base+0x99 @ 0xbc74
CCu store val2 in xreg.gpio_xx_cfg2 @ 0xbc79
.(fcn 0xbc7b 0xbcb1 rom.change_device_state)
CCu r7 = target state @ 0xbc7f
CCu 0 = do not change state @ 0xbc83
CCu change state pending? @ 0xbc85
CCu override flag?? @ 0xbc89
CCu is requested state READY2 @ 0xbc8e
CCu set next state READY @ 0xbc91
CCu is next state TX @ 0xbc98
CCu is current state TX @ 0xbca3
CCu raise change state event @ 0xbca9
.(fcn 0xbcb1 0xbd04 rom.change_state_from_spi_active)
CCu next state is SLEEP @ 0xbcb4
CCu next state is EZCONFIG @ 0xbcb8
CCu next state is 13 @ 0xbcbc
CCu next state is not SPI_ACTIVE @ 0xbcc0
CCu SPI_ACTIVE @ 0xbcc2
CCu rc32k cal requested? @ 0xbccd
f rom.change_from_spi_active_to_ready @ 0xbcd8
CCu READY @ 0xbcd8
CCu READY @ 0xbce0
f rom.change_from_spi_active_to_sleep @ 0xbce4
CCu SLEEP @ 0xbce4
CCu SPI_ACTIVE @ 0xbcf2
CCu SLEEP @ 0xbcfb
CCu SPI_ACTIVE @ 0xbcfe
.(fcn 0xbd04 0xbd19 rom.change_from_tx_tune)
CCu is next state TX? @ 0xbd06
CCu READY @ 0xbd0d
CCu READY @ 0xbd15
.(fcn 0xbd19 0xbd4a rom.change_from_tx)
CCu is next state TX? @ 0xbd1e
CCu is next state RX? @ 0xbd25
CCu TX_TUNE @ 0xbd2b
CCu TX @ 0xbd33
CCu TX_TUNE @ 0xbd38
f rom.change_state_from_tx_to_tx @ 0xbd3c
.(fcn 0xbd4a 0xbd6c rom.synth_recal_check)
CCu TX @ 0xbd3c
CCu if no state change in progress @ 0xbd4e
CCu if not ZEROIF @ 0xbd50
CCu if no channel change in progress @ 0xbd5a
CCu if ZEROIF @ 0xbd5f
CCu FORCE_SY_RECAL (1=no) @ 0xbd66
.(fcn 0xbd6c 0xbd6f rom.change_state_from_ezconfig)
CCu RX @ 0xbd72
.(fcn 0xbd76 0xbd85 rom.change_from_ready_to_11)
CCu unknown state 11 @ 0xbd79
.(fcn 0xbd85 0xbda1 rom.usec_timer_unk_0xbd85)
CCu if usec timer disabled @ 0xbd94
.(fcn 0xbda1 0xbdc8 rom.usec_delay_unk_0xbda1)
CCu if usec delay expired return @ 0xbda1
CCu wait while usec timer stopped @ 0xbda4
axd xreg_base+0xee @ 0xbdae
.(fcn 0xbdc8 0xbddf rom.usec_delay_stop)
.(fcn 0xbddf 0xbe26 rom.usec_delay_handler)
CCu read usec timer msb @ 0xbde3
CCu read usec timer lsb @ 0xbdea
CCu check if timer stopped? @ 0xbdee
CCu FSK_MOD_DLY @ 0xbdf8
CCu correct for processing time @ 0xbdfd
CCu set remaining delay @ 0xbe04
CCu delay timeout reached @ 0xbe1a
.(fcn 0xbe26 0xbe42 rom.tx_pwr_seq_start)
CCu DIG_PWR_SEQ @ 0xbe30
CCu PWR SEQ @ 0xbe37
.(fcn 0xbe42 0xbe95 rom.tx_sequencer_mode_delay)
CCu SEQUENCER_MODE GUARANTEED(0) or FAST(1) @ 0xbe45
CCu READY @ 0xbe51
CCu TX_TUNE @ 0xbe55
CCu RX_TUNE @ 0xbe59
CCu RX @ 0xbe5c
CCu unknown state 11 @ 0xbe60
CCu TX @ 0xbe64
CCu state is TX @ 0xbe68
CCu state is TX_TUNE @ 0xbe73
CCu state is READY @ 0xbe78
CCu state is RX_TUNE, RX or 11 @ 0xbe82
CCu other states @ 0xbe87
CCu usec delay expired @ 0xbe99
CCu DIG_PWR_SEQ @ 0xbebe
CCu PWR SEQ supported @ 0xbec5
CCu usec timer expired? @ 0xbeea
CCu timer stopped? @ 0xbef0
.(fcn 0xbeff 0xbf15 rom.pa_ramp_isr)
CCu DIG_PWR_SEQ @ 0xbf03
CCu pwr seq supported? @ 0xbf0a
.(fcn 0xbf15 0xbf78 rom.cmd_get_property)
CCu validate field count @ 0xbf1f
CCu CMD_ERROR_BAD_ARG @ 0xbf37
.(fcn 0xbf78 0xbfe2 rom.cmd_set_property)
CCu group size @ 0xbf4b
CCu jmp if too many bytes in cmd @ 0xbf87
CCu shift left group idx+1 times @ 0xbf93
CCu check protected groups? @ 0xbf95
CCu CMD_ERROR_BAD_ARG @ 0xbf9a
CCu group index @ 0xbf9f
CCu start field @ 0xbfa5
CCu field count @ 0xbfaa
CCu group size @ 0xbfb1
CCu validate field count against size @ 0xbfb2
CCu ??? @ 0xbfb5
CCu get prop group addr @ 0xbfbc
CCu copy bytes from arg to property @ 0xbfcb
.(fcn 0xbff3 0xbff8 rom.invalid_prop_group_set)
CCu CMD_ERROR_BAD_PROPERTY @ 0xbff3

echo   ..0xc000

.(fcn 0xc000 0xc022 rom.group_id_to_index)
.(fcn 0xc022 0xc07b rom.main_loop_parse_cfg)
axd _idata+0x91 @ 0xc02b
axd _idata+0x91 @ 0xc043
.(fcn 0xc07b 0xc080 rom.invalid_prop_group_get)
.(fcn 0xc080 0xc0b5 rom.override_pa_sel)
CCu CMD_ERROR_BAD_PROPERTY @ 0xc07b
.(fcn 0xc0b5 0xc0f5 rom.pa_dig_pwr_sequencing)
CCu read current power level @ 0xc0ba
CCu STEP_SIZE @ 0xc0c7
CCu DIG_PWR_SEQ_DELAY @ 0xc0ca
CCu wait for SEQ_DELAY .1us @ 0xc0e6
.(fcn 0xc0f5 0xc182 rom.rx_start_dsp_reg_r7_unk_0xc0f5)
axd 0x0798 @ 0xc0f7
CCu 0x0798 = dsp cache @ 0xc0f7
.(fcn 0xc182 0xc1db rom.rx_start_dsp_unk_0xc182)
CCu r7 is 0 or 1 @ 0xc182
CCu close LNA shunt @ 0xc18d
CCu restore LNA shunt state @ 0xc1c0
.(fcn 0xc1db 0xc23a rom.rx_start_dsp_unk_0xc1db)
.(fcn 0xc23a 0xc271 rom.rx_start_dsp_unk_0xc23a)
.(fcn 0xc271 0xc2b6 rom.cmd_agc_override)
.(fcn 0xc2b6 0xc2d2 rom.adc_acquisition)
CCu ADC_CFG @ 0xc2b6 
CCu UDTIME @ 0xc2b9
CCu wait while adc busy @ 0xc2c0
CCu start acquisiton? @ 0xc2c6
CCu wait while adc busy @ 0xc2cb
.(fcn 0xc2d2 0xc2f6 rom.adc_read_temperature)
CCu TEMP_SLOPE @ 0xc2ed
CCu TEMP_INTERCEPT @ 0xc2f2
.(fcn 0xc2f6 0xc349 rom.adc_calculate_result)
CCu r7: 0=GPIO, 2=battery, 4=temperature @ 0xc2f6
CCu read adc result @ 0xc307
CCu if reading temperature @ 0xc32d
CCu store result in response buffer @ 0xc33e
.(fcn 0xc349 0xc361 rom.restore_from_cmd_start_mfsk)
CCu restore sfr.modem_misc3 @ 0xc34e
CCu READY @ 0xc359
.(fcn 0xc361 0xc3f3 rom.config_from_nvram)
CCu later compared to 3rd byte read from NVRAM @ 0xc361
CCu multiply r7 by 3 @ 0xc364
CCu add src base addr (0x74b1) @ 0xc368
CCu set dst addr to imem 0x33 @ 0xc370
CCu 3rd byte read from NVRAM @ 0xc37a
CCu set dst addr to imem 0x38 @ 0xc384
CCu read param r5 @ 0xc391
CCu substract 1 @ 0xc393
CCu multiply by 2 @ 0xc39a
CCu 2nd byte read from NVRAM @ 0xc3a1
CCu add to param r5 for next src addr @ 0xc3a3
CCu 3rd byte read from NVRAM @ 0xc3a5
CCu add to param r5 for next src addr @ 0xc3a7
CCu if read bytes are 0 @ 0xc3b8
CCu read 5 bytes from ptr of prev NVRAM read @ 0xc3bd
CCu add 5 to src addr for next loop @ 0xc3c8
CCu stop when 1st byte read from NVRAM is 0 (count) @ 0xc3d5
CCu copy count bytes from src to dst @ 0xc3da
CCu next block @ 0xc3e8
.(fcn 0xc3f3 0xc426 rom.wut_isr)
CCu RC32K cal event @ 0xc3fd
CCu WUT event @ 0xc401
CCu clear interrupt flags @ 0xc403
CCu raise WUT event @ 0xc421
.(fcn 0xc426 0xc464 rom.wut_config)
CCu bug? CAL_EN and WUT_EN swapped? @ 0xc426
CCu WUT_EN @ 0xc42e
CCu WUT_R @ 0xc446
CCu CAL_EN @ 0xc44c
CCu WUT_CAL_PERIOD @ 0xc453
axd xreg_base+0xf2 @ 0xc460
.(fcn 0xc464 0xc48a rom.wut_expired)
axd 0x616 @ 0xc469
CCu WUT_SLEEP @ 0xc47d
CCu SLEEP @ 0xc480
CCu READY @ 0xc484
.(fcn 0xc48a 0xc4a9 rom.wut_set_mantissa_r5r7)
axd xreg_base+0xf2 @ 0xc48a
axd xreg_base+0xf4 @ 0xc496
axd xreg_base+0xf4 @ 0xc49e
axd xreg_base+0xf2 @ 0xc4a2
CCu wait for first timeout? @ 0xc499
.(fcn 0xc4a9 0xc4aa rom.reset_callback)
.(fcn 0xc4aa 0xc4b8 rom.fifo_tx_set_addr_r6r7_len_r5)
axd 0x0730 @ 0xc4af
.(fcn 0xc4b8 0xc4c6 rom.fifo_rx_set_addr_r6r7_len_r5)
axd 0x072e @ 0xc4bd
.(fcn 0xc4c6 0xc4cc rom.fifo_set_rx_out_pos_from_xreg)
.(fcn 0xc4cc 0xc4d2 rom.fifo_reset_hw)
.(fcn 0xc4d2 0xc50d rom.fifo_tx_reset_hw)
axd xreg_base+0x8c @ 0xc4ec
axd xreg_base+0x89 @ 0xc4f5
CCu clr bits 4-6 @ 0xc4f7
.(fcn 0xc50d 0xc54b rom.fifo_rx_reset_hw)
axd xreg_base+0x8e @ 0xc511
CCu clr bits 0-2 @ 0xc52a
axd xreg_base+0x88 @ 0xc531
axd xreg_base+0x8c @ 0xc53a
axd xreg_base+0x8b @ 0xc53f
.(fcn 0xc54b 0xc584 rom.fifo_rx_update)
CCu r7 = rx fifo read pos @ 0xc552
CCu r6 = rx fifo write pos @ 0xc556
CCu branch if write pos < read pos @ 0xc559
CCu fifo count = write - read pos @ 0xc55b
CCu fifo count = size - read + write pos @ 0xc561
CCu todo: clarify 0x4b,0x4c,0x44 @ 0xc56c
.(fcn 0xc584 0xc59a rom.fifo_rx_read_at_pos_plus_r7)
.(fcn 0xc5a1 0xc5d9 rom.fifo_rx_write_byte)
CCu if rx fifo full @ 0xc5a3
CCu r7 = byte @ 0xc5ad
CCu store byte in fifo @ 0xc5ae
CCu check if ring buffer warps @ 0xc5af
CCu reset/warp ring buffer @ 0xc5b9
axd 0x072e @ 0xc5be
CCu increment write ptr @ 0xc5c6
CCu 1 byte stored @ 0xc5cd
CCu 0 bytes stored @ 0xc5d6
.(fcn 0xc5d9 0xc603 rom.fifo_tx_update)
CCu r7 = write pos @ 0xc5e0
CCu branch if read pos < write pos @ 0xc5e6
CCu fifo space = read - write pos @ 0xc5e8
CCu fifo space = size - write + read pos @ 0xc5ee
CCu todo: clarify 0x4a,0x4d @ 0xc5f9
.(fcn 0xc603 0xc621 rom.fifo_tx_read_at_pos_plus_r7)
.(fcn 0xc621 0xc627 rom.pti_wait_status_bit7_clr)
.(fcn 0xc627 0xc650 rom.pti_send_tx_info)
CCu PTI_EN @ 0xc62b
CCu disable PTI for tx @ 0xc62e
CCu wait for space in PTI output buffer @ 0xc636
CCu enable PTI for tx @ 0xc64c
.(fcn 0xc650 0xc683 rom.pti_send_rx_info)
CCu sync detected? clr bit @ 0xc650
CCu PTI_EN @ 0xc658
CCu disable PTI for rx @ 0xc65b
CCu wait for space in PTI output buffer? @ 0xc663
CCu enable PTI for rx @ 0xc67f
.(fcn 0xc683 0xc69a rom.pti_send_curr_state)
.(fcn 0xc69a 0xc6b3 rom.pti_send_spi_cmd)
CCu PTI output of SPI cmd enabled? @ 0xc69a
CCu CMD @ 0xc6a8
.(fcn 0xc6b3 0xc6cd rom.pti_send_r7)
.(fcn 0xc6cd 0xc704 rom.pti_dump_imem_and_xmem)
CCu iterate over imem @ 0xc6d9
CCu iterate over xmem 0-0x0800 (mirrored at 0x4000) @ 0xc6e9
CCu start hw multiplier @ 0xc73a
CCu wait until hw mul done @ 0xc73d
.(fcn 0xc75a 0xc7c3 rom.adc_unk0xc75a)
CCu ADC enable @ 0xc762
axd xreg_base+0xdf @ 0xc765
CCu set bit 1 @ 0xc7b2
.(fcn 0xc7c3 0xc7ef rom.adc_unk0xc7c3)
CCu save xreg 0x00 @ 0xc7c6
CCu save xreg 0x01 @ 0xc7cf
CCu restore xreg 0x00 @ 0xc7e4
CCu restore xreg 0x01 @ 0xc7e9
.(fcn 0xc825 0xc837 rom.inc_dptr_movx_dptr_to_r0_x3_dptr_to_a)
f rom.movx_a_to_r0_inc_dptr_dptr_to_r0_x3_dptr_to_a 1 @ 0xc827
f rom.movx_dptr_to_r0_x3_dptr_to_a 1 @ 0xc82a
f rom.movx_a_to_r0_inc_dptr_dptr_to_r0_x2_dptr_to_a 1 @ 0xc82b
f rom.inc_r0_movx_dptr_to_r0_x2_dptr_to_a 1 @ 0xc82d
f rom.inc_r0_movx_a_to_r0_dptr_to_r0_dptr_to_a 1 @ 0xc82e
f rom.movx_a_to_r0_dptr_to_r0_dptr_to_a 1 @ 0xc82f
.(fcn 0xc837 0xc846 rom.movx_dptr_to_r0_dec_r0_inc_dptr_x4)
f rom.movx_a_to_r0_inc_dptr_movx_dptr_to_r0_dec_r0_inc_dptr_x3 1 @ 0xc838
f rom.movx_dptr_to_r0_dec_r0_inc_dptr_x2 1 @ 0xc83f
f rom.movx_a_to_r0_inc_dptr_dec_r0_movx_dptr_to_r0 1 @ 0xc840
.(fcn 0xc846 0xc851 rom.spi_cmd_done_ex)
f rom.spi_cmd_done 1 @ 0xc84a
.(fcn 0xc851 0xc87d rom.read_group_info)
CCu group index @ 0xc851
CCu group info addr lo @ 0xc860
CCu group info addr hi @ 0xc867
CCu field count (spi cmd) @ 0xc86c
CCu start field (spi cmd) @ 0xc870
f rom.read_dptr_to_r4_r6 1 @ 0xc875
axd 0x07f7 @ 0xc877
.(fcn 0xc87d 0xc887 rom.pti_check_fifo_space_clr_ie)
f rom.compare_pti_check_fifo_space 1 @ 0xc87f
.(fcn 0xc887 0xc893 rom.wut_get_ldc_en)
f rom.get_dptr_bits_76_to_acc 1 @ 0xc88a
.(fcn 0xc893 0xc89e rom.get_dptr_to_dsp_cache_at_r7)
f rom.get_dptr_0x0700_plus_a 1 @ 0xc896
.(fcn 0xc89e 0xc8bc rom.config_afc_gain_div_freq_err)
.(fcn 0xc8bc 0xc8c9 rom.acc_shl2_in_r7_bit7_orl_mode_in_acc)
CCu AFC_GAIN_DIV @ 0xc8a4
CCu LARGE_FREQ_ERR @ 0xc8ad
.(fcn 0xc8d7 0xc8de rom.acc_plus_1_in_r0_0x01_in_acc)
.(fcn 0xc8de 0xc8ef rom.clear_int_ph)
f rom.latch_int_ph_status_pend 1 @ 0xc8e4
CCu var.INT_PH_PEND @ 0xc8ea
.(fcn 0xc8ef 0xc8fa rom.clk_get_xo_divider_for_r2r3)
f rom.xo_get_divider_for_r0r1r2r3 1 @ 0xc8f1
.(fcn 0xc8fa 0xc909 rom.dsp_set_reg_get_dptr_to_val_cache)
f rom.get_dptr_to_dsp_cache_at_r7_2 1 @ 0xc8fe
CCu 0x0798 holds copy of data written to dsp registers @ 0xc8fe
axd 0x0798 @ 0xc8fe
.(fcn 0xc909 0xc91e rom.xreg_init_0x01_thru_0x04)
axd xreg_base+0x04 @ 0xc914
axd xreg_base+0x03 @ 0xc918
axd xreg_base+0x02 @ 0xc91b
.(fcn 0xc91e 0xc92f rom.change_from_ready_or_tune_to_tx)
CCu TX @ 0xc91e
CCu TX @ 0xc923
CCu TX @ 0xc928
CCu TX @ 0xc92b
.(fcn 0xc92f 0xc93d rom.rc32k_enable)
axd xreg_base+0xab @ 0xc935
f xreg_r0_and_0xfe_inc_r0_mov_xreg_r0_to_acc 1 @0xc936
axd xreg_base+0xac @ 0xc93a
.(fcn 0xc950 0xc95a rom.set_timer1_callback_r4r5)
axd _idata+0x8b @ 0xc950
f rom.store_r4r5_at_scratch_r0_ret_r4_or_r5 1 @ 0xc952
.(fcn 0xc95a 0xc969 rom.bufclk_enable_hw)
CCu BUFCLK_EN @ 0xc95d
CCu BUFCLK_EN @ 0xc960
axd dsp_base+0x00 @ 0xc965
.(fcn 0xc969 0xc979 rom.modem_dsa_misc_eyexest_to_xreg_r0)
CCu EYEXEST_EN, EYEXEST_FAST @ 0xc970
.(fcn 0xc979 0xc988 rom.mul_aaar3_r4r5r6r7_result_r0r1r2r3)
.(fcn 0xc988 0xc997 rom.bufclk_disable_hw)
.(fcn 0xc997 0xc9a2 rom.latch_int_chip_status_pend)
f rom.copy_int_chip_status_pend_to_dptr 1 @ 0xc99a
CCu var.INT_CHIP_PEND @ 0xc99d
.(fcn 0xc9a2 0xc9ad rom.latch_int_modem_status_pend)
f rom.latch_int_modem_status_to_dptr 1 @ 0xc9a5
axd 0x0753 @ 0xc9a8
.(fcn 0xc9b9 0xc9c2 rom.movx_dptr_to_r0_inc_dptr_dec_r0_x2)
.(fcn 0xc9d0 0xc9d9 rom.wut_set_cal_counter)
.(fcn 0xc9d9 0xc9e7 rom.acc_bit7_orl_mode_in_r0_dec_r0_r7_shl1_in_acc)
.(fcn 0xc9e7 0xc9f1 rom.toggle_xreg0x02_bit_2)
f rom.toggle_xreg_r0_bit_2 1 @ 0xc9e9
.(fcn 0xc9f1 0xc9fc rom.inc_r0_copy_dptr_to_r0_x2)
f rom.r7_to_r0_inc_r0_dptr_to_r0 1 @ 0xc9f5
.(fcn 0xca16 0xca22 rom.set_r6r7_to_0x5433)
.(fcn 0xca22 0xca2e rom.get_prop_group_size)
CCu group info addr @ 0xca24
.(fcn 0xca35 0xca41 rom.gpio_get_pin_var)
CCu addr=0x727+pin @ 0xca35
axd 0x0727 @ 0xca35
.(fcn 0xca41 0xca4a rom.dptr_to_r6_dptr_ror7_and1_to_acc)
f rom.rotate_acc_right_7_and_1 @ 0xca43
.(fcn 0xca56 0xca62 rom.rssi_thresh_int_disable)
CCu RSSI_THRES int disable @ 0xca56
CCu clr up/down mode @ 0xca5d
.(fcn 0xca6d 0xca78 rom.set_imem919293_to_ff)
.(fcn 0xca78 0xca82 rom.rc32k_config)
CCu CLK_32K_SEL 0=disabled, 1=internal 2=external @ 0xca7c
.(fcn 0xca82 0xca8d rom.rc32k_get_xtal_divider_in_r2r3)
axd 0x0742 @ 0xca87
.(fcn 0xcab5 0xcabf rom.xreg_r0_or_1_sfr0x96_and_fd_ret_r7_0a)
CCu clr bit 1 @ 0xcab9
CCu return min wait cycles @ 0xcabc
.(fcn 0xcabf 0xcac9 rom.fifo_rx_get_count)
CCu return bytes stored in rx fifo @ 0xcac7
.(fcn 0xcac9 0xcad3 rom.fifo_rx_pos_plus_r7)
.(fcn 0xcad3 0xcada rom.rx_state_entry)
CCu RX @ 0xcad6
.(fcn 0xcada 0xcae4 rom.rx_start_ph)
CCu disable ph @ 0xcada
CCu bit 0 is set if PH is enabled @ 0xcadd
.(fcn 0xcae4 0xcaee rom.compare_imem_0x0e_to_imem_0x0a_0x0b)
.(fcn 0xcaee 0xcaf5 rom.return_r6_lonib_in_acc_hinib)
.(fcn 0xcaf5 0xcafc rom.get_ETSI_mode)
.(fcn 0xcafc 0xcb06 rom.set_r6r7_to_0x5440)
.(fcn 0xcb06 0xcb10 rom.read_dsp_cache_0x01_and_0xfe)
.(fcn 0xcb10 0xcb1a rom.read_dsp_cache_0x28_and_0xfe)
.(fcn 0xcb1a 0xcb21 rom.invert_sign_0x35)
.(fcn 0xcb21 0xcb2a rom.set_xreg_r0_lonib_acc)
.(fcn 0xcb2a 0xcb33 rom.set_xreg_r0_hinib_acc)
.(fcn 0xcb33 0xcb3c rom.chip_has_pa)
.(fcn 0xcb44 0xcb4d rom.xreg_set_0xdc_to_0xbe_clr_0xdb)
axd xreg_base+0xdb @ 0xcb4a
.(fcn 0xcb55 0xcb5e rom.rx_byte_ready)
CCu returns 0 if rx byte is available for processing @ 0xcb55
.(fcn 0xcb5e 0xcb67 rom.a_andc0_orr7_to_r7_dptr_and1f_orr7_to_a)
.(fcn 0xcb67 0xcb70 rom.read_dptr_shl2_and20_to_r7)
.(fcn 0xcb70 0xcb78 rom.pti_get_fifo_len_clr_ie)
.(fcn 0xcb78 0xcb80 rom.adc_disable)
CCu disable ADC peripheral @ 0xcb7c
.(fcn 0xcb80 0xcb88 rom.sub_r7_r5_and_strange_math)
.(fcn 0xcb88 0xcb8f rom.dsp_set_reg_r7_val_dptr_and_1f)
.(fcn 0xcb8f 0xcb97 rom.and_r4r6_and_ar5_or)
.(fcn 0xcb97 0xcb9f rom.set_acc_1_r6_0_r0_idx_plus_1)
.(fcn 0xcb9f 0xcba7 rom.set_xreg_usec_timer_to_0xffff)
axd xreg_base+0xf0 @ 0xcba4
.(fcn 0xcba7 0xcbae rom.dsp_reg0x01_set_lonib_to_r3)
.(fcn 0xcbae 0xcbb6 rom.inc_at_dptr_wiggle_xreg0xdf_bit1_ret_bit3)
.(fcn 0xcbb6 0xcbbe rom.get_modem_rssi_ctl_latch)
CCu LATCH @ 0xcbba
.(fcn 0xcbbe 0xcbc6 rom.dptr_and_3_shl_2)
.(fcn 0xcbc6 0xcbcd rom.dsp_set_reg_0x1f_val_dptr)
.(fcn 0xcbcd 0xcbd4 rom.dsp_set_reg_0x1e_val_dptr)
.(fcn 0xcbd4 0xcbdc rom.main_loop_raise_parse_cmd)
CCu bit 0: parse commands @ 0xcbd4
.(fcn 0xcbdc 0xcbe4 rom.set_loc36_0x10_scr88_0x10)
.(fcn 0xcbe4 0xcbec rom.acc_and80_dptr_or7f_or)
.(fcn 0xcbec 0xcc17 rom.isr_entry)
.(fcn 0xcc17 0xcc36 rom.isr_exit)
.(fcn 0xcc36 0xcc43 rom.pa_ramp_irq_handler)
.(fcn 0xcc43 0xcc4c rom.reset_handler)
.(fcn 0xcc4c 0xcc55 rom.power_up_handler)
.(fcn 0xcc55 0xcc5e rom.modem_irq_handler)
.(fcn 0xcc5e 0xcc67 rom.timer0_irq_handler)
.(fcn 0xcc67 0xcc70 rom.timer1_irq_handler)
.(fcn 0xcc70 0xcc79 rom.spi_cmd_irq_handler)
.(fcn 0xcc79 0xcc82 rom.dmawr_irq_handler)
.(fcn 0xcc82 0xcc8b rom.dmard_irq_handler)
.(fcn 0xcc8b 0xcc94 rom.mctlcmd_irq_handler)
.(fcn 0xcc94 0xcc9d rom.tx_ph_ae_irq_handler)
.(fcn 0xcc9d 0xcca6 rom.rx_ph_af_irq_handler)
.(fcn 0xcca6 0xccaf rom.ph_halt_irq_handler)
.(fcn 0xccaf 0xccb8 rom.wut_irq_handler)
.(fcn 0xccb8 0xccc1 rom.spi_err_irq_handler)
.(fcn 0xccc1 0xccca rom.ph_info_irq_handler)
.(fcn 0xccca 0xccd3 rom.ph_err_irq_handler)

# property group table

f rom.prop_group_table 0x40 @ 0xccd4
Cd 1 0x40 @ 0xccd4
CCu 16x group, size, xdata addr @ 0xccd4
Cd 1 4 @ 0xcd14
.(fcn 0xcd1b 0xcd3c rom.raise_preamble_timeout)
CCu hop on invalid preamble @ 0xcd21
CCu next state is RX_IDLE @ 0xcd27
CCu RSSI_THRES int enable @ 0xcd38
.(fcn 0xcd3c 0xcd41 rom.rx_preamble_detected)
CCu PREAMBLE_DETECT @ 0xcd3c
.(fcn 0xcd41 0xcd58 rom.rx_sync_timeout)
CCu INVALID_SYNC @ 0xcd41
CCu INVALID_SYNC @ 0xcd46
CCu hop on invalid sync? @ 0xcd4b
CCu RSSI_THRES int enable @ 0xcd54
.(fcn 0xcd58 0xcd62 rom.raise_sync_detect)
CCu PREAMBLE_DETECT @ 0xcd58
CCu SYNC_DETECT @ 0xcd5d
.(fcn 0xcd62 0xcd86 rom.rx_packet_received)
CCu PH filter match? @ 0xcd62
CCu SYNC_DETECT @ 0xcd65
CCu PACKET_RX @ 0xcd6a
CCu 0=no state change, no rearm @ 0xcd77
CCu 0=no state change, no rearm @ 0xcda0
CCu FILTER_MISS @ 0xcd81
.(fcn 0xcd86 0xcda6 rom.rx_packet_invalid)
CCu SYNC_DETECT @ 0xcd8e
.(fcn 0xcda6 0xcdb0 rom.modem_isr_rssi_jump)
CCu RSSI_JUMP @ 0xcda6
CCu RSSI_JUMP @ 0xcdab
.(fcn 0xcdb0 0xcdb3 rom.rx_process_byte_b)
.(fcn 0xcdb3 0xcdc6 rom.rssi_above_thresh)
CCu hop on RSSI timeout @ 0xcdb3
CCu reset RSSI hop timer @ 0xcdb6
CCu RSSI @ 0xcdbc
CCu CCA_LATCH @ 0xcdc1
.(fcn 0xcdc6 0xcdcb rom.clear_int_modem_rssi)
CCu RSSI @ 0xcdc6
.(fcn 0xcdcb 0xcdcc rom.ph_info_isr_bit5)
.(fcn 0xcdcc 0xcdde rom.packet_sent)
CCu PACKET_SENT @ 0xcdcc
CCu put radio into configured state @ 0xcdd4
CCu TX @ 0xcde0
CCu do nothing if state TX @ 0xcde2
CCu return 0x80 @ 0xcde4
CCu return 0x80 @ 0xcdea
.(fcn 0xcdef 0xce12 rom.fifo_tx_check_almost_empty)
CCu EZConfig state? @ 0xcdef
CCu tx fifo contains EZConfig array @ 0xcdf2
CCu TX_FIFO_EMPTY @ 0xce05
CCu TX_FIFO_EMPTY @ 0xce0d
CCu TX_FIFO_ALMOST_EMPTY @ 0xcdfe
.(fcn 0xce12 0xce17 rom.tx_send_frame_size_r7)
CCu r7: max bytes to send to DSP @ 0xce12
.(fcn 0xce17 0xce1c rom.fifo_raise_underflow_overflow_err)
CCu FIFO_UNDERFLOW_OVERFLOW_ERROR @ 0xce17
.(fcn 0xce1c 0xce26 rom.fifo_rx_raise_almost_full)
CCu RX_FIFO_ALMOST_FULL @ 0xce1c
CCu RX_FIFO_FULL @ 0xce21
.(fcn 0xce26 0xce30 rom.fifo_rx_clear_almost_full)
CCu RX_FIFO_ALMOST_FULL @ 0xce26
CCu RX_FIFO_FULL @ 0xce2b
.(fcn 0xce30 0xce52 rom.check_thresh_at_latch)
CCu CHECK_THRESH_AT_LATCH @ 0xce40
CCu RSSI_LATCH @ 0xce4c
.(fcn 0xce52 0xce65 rom.raise_postamble_detect)
CCu POSTAMBLE_DETECT @ 0xce52
CCu PKT_VALID_ON_POSTAMBLE @ 0xce5b
CCu packet reception will stop @ 0xce5e
.(fcn 0xce65 0xcea2 rom.timer1_cb_rssi_latch)
CCu LATCH @ 0xce7c
.(fcn 0xcea2 0xcf5b rom.rssi_timer1_config)
CCu hop on rssi timeout enabled @ 0xcea5
CCu RSSI_TIMEOUT * 4 - 3 @ 0xceac
CCu timeout in Ts @ 0xceb4
CCu 0xd65a=rom.timer1_cb_rssi_timeout_hop @ 0xceba
axc 0xd65a @ 0xceba
CCu no hopping? @ 0xcec7
CCu AVERAGE @ 0xcece
CCu if AVERAGE=SAMPLE1 (fast RSSI latching) @ 0xced2
CCu fast RSSI latching supported? @ 0xceda
CCu LATCH @ 0xcefe
CCu if latch on RX_STATE @ 0xcf04
CCu AVERAGE @ 0xcf11
CCu AVERAGE2 @ 0xcf15
CCu BIT1 @ 0xcf18
CCu AVERAGE4 @ 0xcf1b
CCu average 4 @ 0xcf1f
CCu average 2 @ 0xcf24
CCu BIT1 @ 0xcf29
CCu PH_RX_DISABLE @ 0xcf51
CCu if packet handler disabled @ 0xcf52
CCu bit0:ph enabled @ 0xcf55
CCu bit0:ph enabled @ 0xcf58
.(fcn 0xcf5b 0xcf7b rom.wut_start_rx_tx)
CCu start on WUT? @ 0xcf5f
CCu clr start condition @ 0xcf62
CCu RX @ 0xcf65
CCu start on WUT? @ 0xcf6d
CCu clr start condition @ 0xcf70
CCu TX @ 0xcf73
CCu WUT expired @ 0xcf78
.(fcn 0xcf7b 0xcf7c rom.main_loop_bit6_event)
.(fcn 0xcf7c 0xcf89 rom.set_config_steps_0xf850)
axd _idata+0x92 @ 0xcf80
axd _idata+0x93 @ 0xcf84
.(fcn 0xcf89 0xcf8c rom.config_modem_entry)
.(fcn 0xcf8c 0xcf8d rom.config_cmd_unk0x0c)
.(fcn 0xcf8d 0xcfae rom.spi_cmd_isr)
CCu WUT expired (??) @ 0xcf90
CCu was previous cmd START_MFSK? @ 0xcf95
CCu bytes in spi buffer @ 0xcf9e
CCu set if cmd parsing handed to main loop @ 0xcfa7
.(fcn 0xcfae 0xcff0 rom.spi_parse_cmds)
CCu RX_HOP @ 0xcfb1
CCu TX_HOP @ 0xcfb7
CCu CHANGE_STATE @ 0xcfbd
CCu START_RX @ 0xcfc3
CCu START_TX @ 0xcfc9
CCu GET_INT_STATUS @ 0xcfcf
CCu GET_PH_STATUS @ 0xcfd5
CCu GET_MODEM_STATUS @ 0xcfdb
CCu PACKET_INFO @ 0xcfe1
CCu EZCONFIG_CHECK @ 0xcfe7
.(fcn 0xcff0 0xd000 rom.cmd_get_int_status)
CCu read cal type @ 0xcff6
CCu returns as INFO_FLAGS @ 0xcffc

echo   ..0xd000

.(fcn 0xd001 0xd004 rom.cmd_get_ph_status)
.(fcn 0xd004 0xd031 rom.cmd_get_modem_status)
axd 0x0736 @ 0xd018
CCu return ant1/2 RSSI @ 0xd016
axd _idata+0x87 @ 0xd020
CCu return afc_freq_offset_lsb/msb @ 0xd022
.(fcn 0xd031 0xd05e rom.cmd_change_state)
CCu branch if new state greater than 8 @ 0xd039
.(fcn 0xd05e 0xd0de rom.cmd_start_tx)
CCu CONDITION @ 0xd05e
CCu TXCOMPLETE_STATE @ 0xd061
CCu check if state is valid @ 0xd068
CCu CMD_ERROR_BAD_ARG @ 0xd06d
CCu if state is NOCHANGE @ 0xd072
CCu retain previous setting @ 0xd07e
CCu copy tx_start parameters @ 0xd084
axd 0x05fe @ 0xd084
CCu set curr channel to tx channel @ 0xd08d
CCu if tx_delay @ 0xd09a
CCu if update tx params w/o tx @ 0xd0a7
CCu clr update bit and exit @ 0xd0ad
CCu done @ 0xd0b1
CCu if start immediatly @ 0xd0ba
CCu if start on WUT exp @ 0xd0c5
CCu enter SLEEP or READY as per WUT cfg @ 0xd0cb
CCu TX @ 0xd0bc
CCu SLEEP @ 0xd0cf
CCu READY @ 0xd0d3
.(fcn 0xd0de 0xd14d rom.cmd_start_rx)
CCu RXINVALID_STATE @ 0xd0de
CCu state 0-8? @ 0xd0e4
CCu RXVALID_STATE @ 0xd0e8
CCu state 0-8? @ 0xd0ea
CCu RXTIMEOUT_STATE @ 0xd0f0
CCu state 0-9? @ 0xd0f4
CCu CMD_ERROR_BAD_ARG @ 0xd0f8
CCu copy rx params to vars @ 0xd0fd
axd 0x05f7 @ 0xd0fd
CCu CONDITION @ 0xd113
CCu UPDATE @ 0xd116
CCu update rx parameters but do not enter rx mode @ 0xd119
CCu CONDITION @ 0xd122
CCu START @ 0xd125
CCu 0 = start now @ 0xd129
CCu RX @ 0xd12b
CCu 1 = start when WUT expires @ 0xd134
CCu WUT_SLEEP @ 0xd13b
CCu SLEEP @ 0xd13e
CCu READY @ 0xd142
.(fcn 0xd14d 0xd17a rom.cmd_packet_info)
CCu Diff from doc, LEN not optional, LEN_DIFF missing @ 0xd14d
CCu FIELD_NUM @ 0xd14f
CCu LEN[15:8] @ 0xd154
CCu LEN[0:7] @ 0xd157
CCu LEN * 8 = bits @ 0xd159
axd 0x0605 @ 0xd170
.(fcn 0xd17a 0xd1a4 rom.hop_set_frequency)
CCu FRAC[19:16] @ 0xd17d
CCu FRAC[15:8] @ 0xd184
CCu FRAC[7:0] @ 0xd188
CCu VCO_CNT[15:8] @ 0xd18c
CCu VCO_CNT[15:8] extra read bug @ 0xd191
CCu VCO_CNT[7:0] @ 0xd194
CCu INTE @ 0xd199
.(fcn 0xd1a4 0xd1ba rom.cmd_rx_hop)
CCu exit if not in RX state @ 0xd1a6
CCu indicate manual RX hop @ 0xd1b0
CCu indicate RX/TX event @ 0xd1b4
.(fcn 0xd1ba 0xd1ee rom.cmd_tx_hop)
CCu TX @ 0xd1bc
CCu exit with error if not in TX state @ 0xd1be
CCu TX hopping supported? @ 0xd1c4
axd xreg_base+0x78 @ 0xd1d7
CCu CMD_ERROR_BAD_COMMAND @ 0xd1e9
.(fcn 0xd1ee 0xd21c rom.cmd_ezconfig_check)
CCu in EZConfig state? @ 0xd1ee
CCu compare args with CRC @ 0xd1f1
CCu CRC ok, exit EZConfig state @ 0xd1fc
CCu response: VALID @ 0xd1ff
CCu READY @ 0xd201
CCu response: BAD_CHECKSUM @ 0xd20c
CCu response: INVALID_STATE @ 0xd211
CCu repsonse buffer @ 0xd216
.(fcn 0xd21c 0xd22a rom.ezconfig_reset)
.(fcn 0xd22a 0xd249 rom.ezconfig_start)
axd 0x06bc @ 0xd22c
CCu enter EZConfig state @ 0xd22a
CCu set FIFO_MODE half duplex @ 0xd23a
.(fcn 0xd249 0xd251 rom.change_from_spi_active_to_ezconfig)
CCu EZCONFIG @ 0xd24b
.(fcn 0xd251 0xd252 rom.nop_0xd251)
.(fcn 0xd252 0xd253 rom.config_cmd_unk0x10)
.(fcn 0xd253 0xd254 rom.config_cmd_unk0x11)
.(fcn 0xd254 0xd255 rom.config_cmd_unk0x12)
.(fcn 0xd255 0xd270 rom.rx_ph_filter)
CCu 1=match, 0=miss @ 0xd25a
CCu FILTER_MATCH @ 0xd25d
CCu disable packet filter @ 0xd262
CCu FILTER_MISS @ 0xd26a
.(fcn 0xd270 0xd329 rom.rx_ph_filter_matching)
CCu MATCH_CTRL_x @ 0xd274
CCu POLARITY @ 0xd276
CCu loc22.1 = polarity @ 0xd27a
CCu MATCH_MASK_x @ 0xd284
CCu MATCH_VALUE_x @ 0xd28a
CCu found match @ 0xd28d
CCu found miss @ 0xd291
CCu MATCH_EN @ 0xd2e8
CCu MATCH_EN @ 0xd2fd
CCu MATCH_EN @ 0xd312
CCu filter match/miss found @ 0xd323
CCu continue @ 0xd326
.(fcn 0xd329 0xd34b rom.rx_ph_filter_init)
CCu MATCH_EN @ 0xd32e
axd 0x0527 @ 0xd33a
.(fcn 0xd34b 0xd396 rom.rx_ph_init)
axd 0x05fa @ 0xd355
CCu pkt len not specified with START_RX @ 0xd359
CCu config rx field 1 @ 0xd35b
CCu pkt len * 8 = bits @ 0xd35f
CCu mark as last field @ 0xd36d
CCu TX @ 0xd381
CCu var.rx_nextstate_valid @ 0xd385
CCu TX @ 0xd387
CCu var.rx_nextstate_error @ 0xd38b
CCu TX @ 0xd38d
CCu next state is TX @ 0xd390
.(fcn 0xd396 0xd3a0 rom.rx_ph_reset_pktlen)
axd 0x0605 @ 0xd39d
.(fcn 0xd3a0 0xd3af rom.main_loop_rxtx_event_part2)
CCu manual RX hop @ 0xd3a0
.(fcn 0xd3af 0xd3ba rom.main_loop_rx_hop_manual)
.(fcn 0xd3ba 0xd414 rom.main_loop_rx_hop_initiate)
CCu check if state in progress @ 0xd3ba
CCu check if in RX state @ 0xd3bf
CCu HOPPED @ 0xd3c6
CCu increment table pos @ 0xd3dc
CCu check if end of table reached @ 0xd3df
CCu reset table pos to 0 @ 0xd3e4
CCu HOP_TABLE_WRAP @ 0xd3e6
CCu get ptr into hop table (0x0535) @ 0xd3ef
axd 0x0535 @ 0xd3ef
CCu read hop table entry @ 0xd3f8
CCu check if entry is 0xff (skip entry) @ 0xd3fa
CCu rx hop @ 0xd3fd
CCu update current channel @ 0xd401
CCu RX @ 0xd402
CCu skip entry @ 0xd409
CCu SYNC_TIMEOUT int disable @ 0xd40d
.(fcn 0xd414 0xd45a rom.ph_process_len_field)
CCu protocol IEEE802.15.4g @ 0xd417
CCu branch and clr if 2nd byte of len field @ 0xd41f
CCu first byte of len field @ 0xd422
CCu set bit if we expect 2nd len byte @ 0xd42e
CCu SIZE @ 0xd42c
CCu len field was 2 bytes @ 0xd434
CCu ENDIAN @ 0xd438
CCu branch if len field not complete @ 0xd446
CCu clr expect_len_field @ 0xd449
CCu write 0 bytes to rx fifo @ 0xd452
CCu IN_FIFO (store/remove len field) @ 0xd454
CCu write 1 byte to rx fifo @ 0xd457
.(fcn 0xd45a 0xd512 rom.ph_pkt_len_adjust)
CCu protocol IEEE802.15.4g? @ 0xd461
CCu branch if not @ 0xd463
axd 0x0605 @ 0xd4a2
CCu PKT_LEN_ADJUST @ 0xd4a6
CCu PKT_LEN_ADJUST @ 0xd4ab
CCu DST_FIELD @ 0xd4b9
.(fcn 0xd512 0xd5b1 rom.pkt_tx_unk_0xd512)
CCu PACKET_SENT @ 0xd512
CCu tx_len is zero @ 0xd525
CCu tx_len * 8 (=pkt bits) @ 0xd537
CCu tx_num_repeat is zero @ 0xd54f
CCu start hw multiplier @ 0xd565
CCu wait until hw mul done @ 0xd56a
CCu RETRANSMIT @ 0xd58e
.(fcn 0xd5b1 0xd5c5 rom.pkt_tx_unk_0xd5b1)
.(fcn 0xd5c5 0xd5dc rom.pkt_tx_unk_0xd5c5)
CCu FIFO_UNDERFLOW_OVERFLOW_ERROR @ 0xd5c9
.(fcn 0xd5dc 0xd5f4 rom.pkt_tx_halt)
.(fcn 0xd5f4 0xd5f5 rom.rx_nextstate_remain)
.(fcn 0xd5f5 0xd5ff rom.pa_ramp_isr_finish)
.(fcn 0xd5ff 0xd60f rom.rx_hop_trigger)
CCu PREAMBLE_TIMEOUT int disable @ 0xd5ff
CCu RX hop @ 0xd608
CCu indicate RX/TX event @ 0xd60a
.(fcn 0xd60f 0xd65a rom.rx_hop_config)
CCu mask HOP_EN @ 0xd61a
CCu 2: HOP_RSSI_PM_TO @ 0xd61f
CCu 3: HOP_PM_SYNC_TO @ 0xd623
CCu 4: HOP_RSSI_PM_SYNC_TO @ 0xd626
CCu 1: HOP_PM_TO @ 0xd629
CCu more than 1 entry? @ 0xd644
CCu disable hop condition @ 0xd648
CCu limit max size to 64 entries @ 0xd64e
.(fcn 0xd65a 0xd66b rom.timer1_cb_rssi_timeout_hop)
CCu MODEM_RSSI_THRESH @ 0xd65a
CCu RSSI_THRESH, PREAMBLE_TIMEOUT int disable @ 0xd664
.(fcn 0xd66b 0xd691 rom.fifo_config)
CCu check if full/half duplex mode @ 0xd66e
CCu config fifo for half duplex @ 0xd672
axd 0x0575 @ 0xd674
CCu config fifo for full duplex @ 0xd67f
axd 0x05b6 @ 0xd681
axd 0x0575 @ 0xd68a
.(fcn 0xd691 0xd6a9 rom.ezconfig_decrypt_byte)
CCu property val @ 0xd694
.(fcn 0xd6a9 0xd71b rom.ezconfig_set_property)
CCu translate array pos to property ptr @ 0xd6b3
CCu property val @ 0xd717
CCu in EZConfig state? @ 0xd73c
CCu EZCONFIG @ 0xd73f
CCu EZCONFIG @ 0xd742
CCu SPI_ACTIVE @ 0xd748
.(fcn 0xd74c 0xd78f rom.config_from_ezconfig)
CCu EZConfig supported? @ 0xd757
.(fcn 0xd78f 0xd7a9 rom.ezconfig_array_read)
.(fcn 0xd7a9 0xd7bf rom.fifo_tx_increment)
.(fcn 0xd7bf 0xd7c6 rom.set_spi_status_bit7)
.(fcn 0xd7c6 0xd7cd rom.get_current_match_filter)
.(fcn 0xd7cd 0xd7d6 rom.get_global_cfg_protocol)
CCu PROTOCOL @ 0xd7d1
.(fcn 0xd7d6 0xd7e2 rom.setup_timer1_cb_rssi_latch)
CCu r7=delay in Ts (oversampling clk periods) @ 0xd7d6
CCu 0xce65=rom.timer1_cb_rssi_latch @ 0xd7d9
axc 0xce65 @ 0xd7d9
.(fcn 0xd7e2 0xd7ea rom.get_rx_nextstate_timeout)
.(fcn 0xd7ea 0xd7f4 rom.raise_invalid_preamble)
CCu INVALID_PREAMBLE @ 0xd7ea
CCu INVALID_PREAMBLE @ 0xd7ef
.(fcn 0xd7f4 0xd7fb rom.clr_scratch_0x81_0x82)
.(fcn 0xd7fb 0xd803 rom.shift_right_3_and_3)
.(fcn 0xd803 0xd82e func2.isr_entry)
.(fcn 0xd82e 0xd84d func2.isr_exit)
.(fcn 0xd84d 0xd85a func2.pa_ramp_irq_handler)
.(fcn 0xd85a 0xd863 func2.reset_handler)
.(fcn 0xd863 0xd86c func2.power_up_handler)
.(fcn 0xd86c 0xd875 func2.modem_irq_handler)
.(fcn 0xd875 0xd87e func2.timer0_irq_handler)
.(fcn 0xd87e 0xd887 func2.timer1_irq_handler)
.(fcn 0xd887 0xd890 func2.spi_cmd_irq_handler)
.(fcn 0xd890 0xd899 func2.dmawr_irq_handler)
.(fcn 0xd899 0xd8a2 func2.dmard_irq_handler)
.(fcn 0xd8a2 0xd8ab func2.mctlcmd_irq_handler)
.(fcn 0xd8ab 0xd8b4 func2.tx_ph_ae_irq_handler)
.(fcn 0xd8b4 0xd8bd func2.rx_ph_af_irq_handler)
.(fcn 0xd8bd 0xd8c6 func2.ph_halt_irq_handler)
.(fcn 0xd8c6 0xd8cf func2.wut_irq_handler)
.(fcn 0xd8cf 0xd8d8 func2.spi_err_irq_handler)
.(fcn 0xd8d8 0xd8e1 func2.ph_info_irq_handler)
.(fcn 0xd8e1 0xd8ea func2.ph_err_irq_handler)
.(fcn 0xd932 0xd95b func2.bit6_change_state)
CCu bit7: force state change 6-0: target state @ 0xd932
CCu force new target state @ 0xd93d
CCu ignore if state change in progress @ 0xd948
CCu set new target state @ 0xd94f
CCu raise bit6 event @ 0xd950
.(fcn 0xd95b 0xd960 set_cmd8x_0x71_pti_send_curr_state)
CCu SLEEP @ 0xd960
axd 0x0607 @ 0xd967
axd 0x0607 @ 0xd999
CCu TX @ 0xd9b9
axd 0x0607 @ 0xd9c0
CCu READY @ 0xd9cc
axd 0x0607 @ 0xd9d3
.(fcn 0xd9d8 0xd9f9 func2.do_cmd_0x8c_0x8d)
.(fcn 0xda20 0xda64 func2.main_loop_bit6_event)
CCu if 2 @ 0xda26
CCu if 3 @ 0xda29
CCu if 4 @ 0xda2c
axd _idata+0x92 @ 0xdac0
axd _idata+0x93 @ 0xdac4
CCu if 5 @ 0xda2f
CCu if 0x40 @ 0xda33
CCu if 1 @ 0xda37
CCu state 1 @ 0xda39
CCu state 2 @ 0xda3d
CCu state 3 @ 0xda42
CCu state 4 @ 0xda47
CCu state 0x40 @ 0xda4c
CCu state 5 @ 0xda50
CCu compare current to target state @ 0xda52
axd 0x0607 @ 0xda57
CCu repeat event if not equal @ 0xda59
CCu raise bit6 event @ 0xda5c
.(fcn 0xdaaa 0xdacb func2.config_radio_extra_steps)
.(fcn 0xdacb 0xdad3 func2.config_modem)
.(fcn 0xdad3 0xdb15 func2.spi_parse_cmds)
.(fcn 0xdb15 0xdb1d func2.cmd_0x8c)
.(fcn 0xdb1d 0xdb22 func2.cmd_0x8d)
.(fcn 0xdb22 0xdb6b func2.cmd_0x85)
.(fcn 0xdb6b 0xdb8a func2.cmd_0x82)
.(fcn 0xdb8a 0xdb9c func2.cmd_0x83)
.(fcn 0xdb9c 0xdbae func2.cmd_0x84)
.(fcn 0xdbae 0xdbba func2.cmd_0x87)
.(fcn 0xdbba 0xdbcc func2.cmd_0x8a)
.(fcn 0xdbcc 0xdbed func2.spi_cmd_isr)
CCu WUT expired (???) @ 0xdbcf
.(fcn 0xdbf3 0xdbf4 func2.wut_start_rx_tx)
.(fcn 0xdbf5 0xdc4c func2.cmd_0x80)
CCu if curr state 4 or 0x40, error @ 0xdbfe
CCu CMD_ERR_BAD_COMMAND @ 0xdc08
axd 0x05fb @ 0xdc0d
CCu bit6 state 0x04 @ 0xdc22
CCu raise TX/RX event @ 0xdc36
CCu bit6 state 0x40 @ 0xdc40
.(fcn 0xdc4c 0xdc5b func2.config_cmd_unk0x0c)
axd 0x05ff @ 0xdc57
.(fcn 0xdd11 0xdd44 func2.pkt_tx_unk_0xdd11)
CCu TX_FIFO_ALMOST_EMPTY @ 0xdd44
axc 0x032a @ 0xdd5f
.(fcn 0xdd6f 0xdd82 func2.irq07_packet_sent)
CCu CRC_ERROR @ 0xddb2
CCu ALT_CRC_ERROR @ 0xddc3
.(fcn 0xddd5 0xddea func2.rx_packet_received)
.(fcn 0xddea 0xde05 func2.rx_append_packet_stats)
CCu loc6b = bytes added to fifo @ 0xddef
CCu INVALID_PREAMBLE @ 0xde0d
axd _idata+0x98 @ 0xde1b
CCu TX @ 0xde23
axd 0x05e9 @ 0xde2e
.(fcn 0xde49 0xde73 func2.rx_packet_invalid)
CCu FILTER_MATCH @ 0xde7d
.(fcn 0xdeef 0xdf10 func2.cmd_0x81)
CCu CMD_ERR_BAD_COMMAND @ 0xdef6
axd 0x05f6 @ 0xdefb
.(fcn 0xdf10 0xdf27 func2.config_cmd_unk0x0d)
axd 0x05e9 @ 0xdf23
axd 0x05de @ 0xdf7c
axd 0x05bf @ 0xdf85
.(fcn 0xdff0 0xdff3 func2.tx_preamble_timeout)
.(fcn 0xdff3 0xdff4 func2.raise_preamble_detect)
.(fcn 0xdff4 0xdffb func2.rx_sync_timeout)
CCu RSSI_THRESH int enable @ 0xdff7
.(fcn 0xdffb 0xdffc func2.modem_isr_rssi_jump)
.(fcn 0xdffd 0xdffe func2.raise_postamble_detect)

echo   ..0xe000

axd 0x05e2 @ 0xe0ae
axd 0x05e2 @ 0xe0bf
.(fcn 0xe139 0xe158 func2.rx_ph_filter)
CCu PREAMBLE_DETECT @ 0xe1a9
.(fcn 0xe1b1 0xe1eb func2.rx_ph_init)
CCu expect_len_field @ 0xe1c8
.(fcn 0xe1eb 0xe207 func2.raise_sync_detect)
CCu SYNC_DETECT @ 0xe201
.(fcn 0xe207 0xe20f func2.rssi_above_thresh)
.(fcn 0xe20f 0xe24f func2.rssi_timer_config)
CCu timer0 irq impl at 0xe443 @ 0xe27b
axc 0xe443 @ 0xe27b
CCu 0xe8ef=rom.timer1_cb_unk @ 0xe238
axc 0xe8ef @ 0xe238
CCu delay @ 0xe23d
.(fcn 0xe286 0xe289 func2.clear_in_modem_rssi)
CCu TX_FIFO_ALMOST_EMPTY @ 0xe290
.(fcn 0xe296 0xe297 func2.ph_info_isr_bit5)
.(fcn 0xe297 0xe2b4 func2.fifo_tx_check_almost_empty)
CCu FILTER_MISS @ 0xe2a0
CCu TX_FIFO_EMPTY @ 0xe2a7
CCu TX_FIFO_EMPTY @ 0xe2af
.(fcn 0xe2b4 0xe2c1 func2.tx_send_frame_size_r7)
.(fcn 0xe2c1 0xe2d8 func2.pkt_tx_unk_0xe2c1)
.(fcn 0xe2d8 0xe2f2 func2.fifo_raise_underflow_overflow_err)
CCu RSSI_LATCH @ 0xe2e2
.(fcn 0xe2f3 0xe2f4 func2.change_from_spi_active_to_ezconfig)
.(fcn 0xe2f4 0xe328 func2.pa_ramp_isr_finish)
CCu bit6 state is not 3 @ 0xe2fd
CCu buffer pos msb @ 0xe306
axd 0x05e0 @ 0xe307
CCu buffer pos lsb @ 0xe309
CCu curr buffer pos msb @ 0xe310
axd 0x05e0 @ 0xe312
CCu curr buffer pos lsb @ 0xe313
.(fcn 0xe328 0xe360 func2.mul_0x5c1_x_r6r7_x_r4r5)
CCu c=0 @ 0xe329
CCu b=[0x05c1] @ 0xe32d
axd 0x05c2 @ 0xe333
CCu a=r6r7 @ 0xe337
CCu start hw multiplier @ 0xe33b
CCu wait until hw mul done @ 0xe33e
CCu c=b @ 0xe343
CCu b=a @ 0xe349
CCu a=r4r5 @ 0xe34f
CCu start hw multiplier @ 0xe353
CCu wait until hw mul done @ 0xe356
CCu r6r7=b @ 0xe35b
.(fcn 0xe360 0xe37a func2.config_cmd_unk0x0e)
CCu MOD_TYPE @ 0xe364
CCu 4FSK @ 0xe367
CCu 4GFSK @ 0xe36b
.(fcn 0xe37a 0xe37b func2.config_cmd_unk0x10)
.(fcn 0xe37b 0xe37c func2.config_cmd_unk0x11)
.(fcn 0xe37c 0xe37d func2.config_cmd_unk0x12)
.(fcn 0xe37d 0xe384 func2.timer0_cb_unk0xe37d)
CCu indicate RX/TX event @ 0xe37f
CCu timer0 irq impl at 0xe37d @ 0xe3e5
axc 0xe37d @ 0xe3e5
.(fcn 0xe435 0xe443 func2.timer0_cb_unk0xe435)
CCu store current RSSI for FRR (11 is undoc) @ 0xe437
CCu indicate RX/TX event @ 0xe43e
.(fcn 0xe443 0xe498 func2.timer0_cb_unk0xe443)
CCu timer0 irq at 0xe435 @ 0xe4a4
.(fcn 0xe4d6 0xe512 func2.main_loop_rxtx_event_bit4)
.(fcn 0xe512 0xe542 func2.main_loop_rxtx_event_part2)
CCu cmd_0x80 @ 0xe512
CCu ? @ 0xe519
axd 0x0607 @ 0xe54c
.(fcn 0xe551 0xe554 func2.rx_process_byte_b)
.(fcn 0xe554 0xe5a8 func2.ph_process_len_field)
CCu clr expect_len_field @ 0xe5a3
CCu 4(G)FSK modulation? @ 0xe5ae
CCu 4(G)FSK modulation? @ 0xe5c8
axd 0x059d @ 0xe6c0
CCu RX @ 0xe7af
.(fcn 0xe7d9 0xe7e3 func2.fifo_rx_raise_almost_full)
CCu POSTAMBLE_DETECT? @ 0xe7d9
.(fcn 0xe7e3 0xe7ed func2.fifo_rx_clear_almost_full)
CCu POSTAMBLE_DETECT? @ 0xe7e3
.(fcn 0xe7f4 0xe7fb func2.is_bit6_state_3)
.(fcn 0xe8b1 0xe8db func2.fifo_config)
CCu fifo set to 0x4800-0x48fe ?!? @ 0xe8b8
axd 0x0607 @ 0xe8e9
.(fcn 0xe8ef 0xe90d func2.timer1_cb_unk0xe8ef)
CCu peak detect? @ 0xe8ef
CCu var.CURRENT_RSSI @ 0xe900
CCu update current rssi if higher than previous? @ 0xe904
.(fcn 0xe90d 0xe92d func2.pti_send_bit6_curr_state)
.(fcn 0xe92d 0xe94b func2.fifo_rx_write_r7_0x00_0x00)
f func2.fifo_rx_write_r7 @ 0xe942
.(fcn 0xe94b 0xe952 func2.frr_curr_rssi_to_0)
CCu set current RSSI to 0 for FRR (11 is undoc) @ 0xe94d
.(fcn 0xe95d 0xe965 func2.pti_get_fifo_len_clr_ie_2)
.(fcn 0xe986 0xe994 func2.set_channel_dptr_state_rx_ret_dptr_bit6_curr_state)
CCu RX @ 0xe98b
f func2.change_state_to_r7_ret_dptr_bit6_curr_state @ 0xe98d 
.(fcn 0xe994 0xe99f func2.clr_int_ph)
.(fcn 0xe99f 0xe9ad func2.raise_int_mode_clr_var_0x71_get_next_state)
f func2.clr_var_0x71_get_next_state @ 0xe9a2
f func2.get_cmd81_arg2_next_state @ 0xe9a5
.(fcn 0xe9ad 0xe9b6 func2.clr_timer0_callback)
.(fcn 0xe9b6 0xe9c1 func2.change_bit6_state_to_cmd80_arg3)
.(fcn 0xe9df 0xe9e9 func2.tx_0x2a_0x2a_0x2a)
CCu RX @ 0xea0d
.(fcn 0xea2f 0xea5a func3.isr_entry)
.(fcn 0xea5a 0xea79 func3.isr_exit)
.(fcn 0xea79 0xea86 func3.pa_ramp_irq_handler)
.(fcn 0xea86 0xea8f func3.reset_handler)
.(fcn 0xea8f 0xea98 func3.power_up_handler)
.(fcn 0xea98 0xeaa1 func3.modem_irq_handler)
.(fcn 0xeaa1 0xeaaa func3.timer0_irq_handler)
.(fcn 0xeaaa 0xeab3 func3.timer1_irq_handler)
.(fcn 0xeab3 0xeabc func3.spi_cmd_irq_handler)
.(fcn 0xeabc 0xeac5 func3.dmawr_irq_handler)
.(fcn 0xeac5 0xeace func3.dmard_irq_handler)
.(fcn 0xeace 0xead7 func3.mctlcmd_irq_handler)
.(fcn 0xead7 0xeae0 func3.tx_ph_ae_irq_handler)
.(fcn 0xeae0 0xeae9 func3.rx_ph_af_irq_handler)
.(fcn 0xeae9 0xeaf2 func3.ph_halt_irq_handler)
.(fcn 0xeaf2 0xeafb func3.wut_irq_handler)
.(fcn 0xeafb 0xeb04 func3.spi_err_irq_handler)
.(fcn 0xeb04 0xeb0d func3.ph_info_irq_handler)
.(fcn 0xeb0d 0xeb16 func3.ph_err_irq_handler)
.(fcn 0xeb4e 0xeb64 func3.spi_cmd_isr)
.(fcn 0xeb64 0xeb8e func3.spi_parse_cmds)
.(fcn 0xeb8e 0xeb91 func3.cmd_get_int_status)
.(fcn 0xeb91 0xeb94 func3.cmd_get_ph_status)
.(fcn 0xeb94 0xebba func3.cmd_get_modem_status)
axd 0x0736 @ 0xeba8
axd _idata+0x87 @ 0xebb0
.(fcn 0xebba 0xebe7 func3.cmd_change_state)
CCu NEW_STATE @ 0xebba
CCu if RX @ 0xebce
CCu if TX @ 0xebd4
CCu if SLEEP @ 0xebda
.(fcn 0xebe7 0xec4a func3.cmd_start_tx)
CCu CONDITION @ 0xebe7
CCu TXCOMPLETE_STATE @ 0xebea
CCu check if state is valid @ 0xebf1
CCu CMD_ERROR_BAD_ARG @ 0xebf6
CCu if state is NOCHANGE @ 0xebfd
CCu CONDITION @ 0xebff
CCu retain previous setting @ 0xec07
CCu copy tx start parameters @ 0xec0d
axd 0x05f6 @ 0xec0d
CCu set curr channel to tx channel @ 0xec16
CCu if start immediatly @ 0xec26
CCu TX @ 0xec28
CCu if start on WUT exp @ 0xec31
CCu enter SLEEP or READY as per WUT cfg @ 0xec37
CCu SLEEP @ 0xec3b
CCu READY @ 0xec3f
.(fcn 0xec4a 0xecb8 func3.cmd_start_rx)
CCu RXINVALID_STATE @ 0xec4a
CCu state 0-8? @ 0xec50
CCu RXVALID_STATE @ 0xec54
CCu state 0-8? @ 0xec58
CCu RXTIMEOUT_STATE @ 0xec5c
CCu state 0-9? @ 0xec60
CCu CMD_ERROR_BAD_ARG @ 0xec64
axd 0x05ef @ 0xec69
CCu copy rx params to vars @ 0xec69
CCu CONDITION @ 0xec7a
CCu UPDATE @ 0xec7d
CCu update rx params but do not enter rx mode @ 0xec80
CCu CONDITION @ 0xec89
CCu START @ 0xec8c
CCu 0 = start now @ 0xec90
CCu RX @ 0xec92
CCu 1 = start when WUT expires @ 0xec9b
CCu WUT_SLEEP @ 0xeca2
CCu SLEEP @ 0xeca5
CCu READY @ 0xeca9
.(fcn 0xecb8 0xecb9 func3.main_loop_rxtx_event_part2)
.(fcn 0xecb9 0xecba func3.main_loop_bit6_event)
.(fcn 0xecba 0xecf0 func3.config_radio_extra_steps)
.(fcn 0xecf0 0xecf3 func3.config_modem)
.(fcn 0xecf3 0xecf4 func3.config_cmd_unk0x0c)
.(fcn 0xecf4 0xecf5 func3.config_from_ezconfig)
.(fcn 0xecf5 0xecf6 func3.rx_hop_config)
.(fcn 0xecf6 0xecf7 func3.config_cmd_unk0x10)
.(fcn 0xecf7 0xecf8 func3.config_cmd_unk0x11)
.(fcn 0xecf8 0xecf9 func3.config_cmd_unk0x12)
.(fcn 0xecfa 0xed00 func3.ph_process_len_field)
.(fcn 0xed00 0xed0d func3.rx_ph_filter)
.(fcn 0xed0d 0xed10 func3.rx_preamble_timeout)
.(fcn 0xed10 0xed11 func3.raise_preamble_detect)
.(fcn 0xed11 0xed12 func3.rx_sync_timeout)
.(fcn 0xed12 0xed13 func3.raise_sync_detect)
.(fcn 0xed13 0xed22 func3.rx_packet_received)
CCu PACKET_RX @ 0xed13
.(fcn 0xed22 0xed2c func3.rx_packet_invalid)
.(fcn 0xed2c 0xed2d func3.modem_isr_rssi_jump)
.(fcn 0xed2d 0xed2e func3.rx_process_byte_b)
.(fcn 0xed2f 0xed30 func3.rssi_above_thresh)
.(fcn 0xed30 0xed31 func3.clear_int_modem_rssi)
.(fcn 0xed31 0xed32 func3.ph_info_isr_bit5)
.(fcn 0xed32 0xed44 func3.packet_sent)
CCu PACKET_SENT @ 0xed32
.(fcn 0xed46 0xed47 func3.fifo_tx_check_almost_empty)
.(fcn 0xed47 0xed4c func3.tx_send_frame_size_r7)
.(fcn 0xed4c 0xed59 func3.pkt_tx_unk_0xed4c)
CCu FIFO_UNDERFLOW_OVERFLOW_ERROR @ 0xed4c
.(fcn 0xed59 0xed5a func3.fifo_raise_underflow_overflow_err)
.(fcn 0xed5a 0xed5b func3.fifo_rx_raise_almost_full)
.(fcn 0xed5b 0xed5c func3.fifo_rx_clear_almost_full)
.(fcn 0xed5c 0xed5d func3.check_thresh_at_latch)
.(fcn 0xed5d 0xed5e func3.raise_postamble_detect)
.(fcn 0xed5e 0xed6a func3.ph_enabled_check)
CCu ph enabled @ 0xed62
CCu PH_RX_DISABLE @ 0xed64
CCu ph disabled @ 0xed67
.(fcn 0xed6a 0xed6b func3.wut_start_rx_tx)
.(fcn 0xed6c 0xed6d func3.change_from_spi_active_to_ezconfig)
.(fcn 0xed6d 0xed6e func3.pa_ramp_isr_finish)
.(fcn 0xede7 0xeed0 func3.rx_ph_init)
.(fcn 0xeed0 0xeef6 func3.fifo_config)
CCu shared FIFO: 0x04ef @ 0xeed9
CCu TX FIFO: 0x056f @ 0xeee6
CCu RX FIFO: 0x04ef @ 0xeeef
.(fcn 0xef06 0xef0d func3.spi_cmd_done)

echo   ..0xf000

.(fcn 0xf001 0xf114 func3.pkt_tx_unk0xf001)
f func1.vector_table 1 @ 0xf114
f func3.fragment 1 @ 0xf16d
f func2.vector_table 1 @ 0xf603
f func2.map_table 1 @ 0xf64a
CCu copied to 0x0057, 0xf5f3 offset compared to rom (func1) @ 0xf64a

Cd 1 0x6cd @ 0xf929
f rom.end_of_code @ 0xf929

Cd 1 10 @ 0xfff6
f rom.DIE_INFO 8 @ 0xfff6
f rom.DIE_INFO_ROM_ID 1 @ 0xfffe
f rom.DIE_INFO_CHIP_REV 1 @ 0xffff

