# EZRadioPRO rev C2A/A2A hardware registers

echo annotating registers

# SFR

echo ..sfr

CCu set to 0x50 in boot and reset @ _sfr+0x86

f sfr.bit_timer_ctl 1 @ _sfr+0x91
CCu 0:timer running 1:? 4-7:timer_cnt_msb @ _sfr+0x91
f sfr.bit_timer_cnt_lsb 1 @ _sfr+0x92
CCu related to RSSI_READ_DELAY, FAST_RSSI_DELAY and eint1 @ _sfr+0x92
CCu set to 0x43 end of boot, set to 0x40 on reset @ _sfr+0x93
f sfr.dsp_reg_addr 1 @ _sfr+0x94
f sfr.dsp_reg_value 1 @ _sfr+0x95
CCu 2:clr before GPIO adc read @ _sfr+0x96

f sfr.dsp_ram_rw 1 @ _sfr+0xa6
f sfr.rxtx_byte 1 @ _sfr+0xa7
CCu read in rx, written in tx @ _sfr+0xa7
f sfr.IE 1 @ _sfr+0xa8
CCu 4:eint1 (bit timer) @ _sfr+0xa8
CCu set to #0x01 end of tx, #0x10 end of rx packet @ _sfr+0xa9
f sfr.preamble_ctrl 1 @ _sfr+0xaa
CCu 0:? 3:no tx preamble 4:no rx preamble 5:BIT_ORDER 6:MANCH_POL @ _sfr+0xaa
f sfr.wht_ctrl 1 @ _sfr+0xab
CCu 3:PN_DIRECTION 7:CRC_PADDING @ _sfr+0xab
f sfr.crc_ctrl 1 @ _sfr+0xac
CCu 0:ALT_CRC_START 1:CRC_START 2:PN_START 3:PKT_CFG1.4 4:4FSK_EN 5:CRC_INVERT 6:CRC_ENDIAN 7:CRC_BIT_ENDIAN @ _sfr+0xac

f sfr.int_ph_status 1 @ _sfr+0xb1
f sfr.int_modem_status 1 @ _sfr+0xb2
f sfr.int_chip_status 1 @ _sfr+0xb3
f sfr.int_ph_mask 1 @ _sfr+0xb4
f sfr.int_modem_mask 1 @ _sfr+0xb5
f sfr.int_chip_mask 1 @ _sfr+0xb6
f sfr.timer1_irq_flag 1 @ _sfr+0xba
CCu 3-6: timer isr source @ _sfr+0xba
f sfr.sync_trigger 1 @ _sfr+0xbb
CCu 0:crc error 1:alt crc error 4: 5:clr=sync word 1 trigger, set=sync word 2 trigger @ _sfr+0xbb

f sfr.pti_ctl 1 @ _sfr+0xc0
CCu 7:pti_en 6:rx_en 5:tx_en 4:BIT_ORDER(inv) @ _sfr+0xc0
f sfr.pti_unk1 1 @ _sfr+0xc1
f sfr.pti_data 1 @ _sfr+0xc2
f sfr.pti_cmd 1 @ _sfr+0xc3
f sfr.pti_status 1 @ _sfr+0xc4
CCu 0-3: space in output buffer? @ _sfr+0xc4
f sfr.int_ph_pend 1 @ _sfr+0xc5
f sfr.int_modem_pend 1 @ _sfr+0xc6
f sfr.int_chip_pend 1 @ _sfr+0xc7
f sfr.rx_ph_ctrl 1 @ _sfr+0xc9
CCu 2:clr when rx hop triggers in eint1 4:clr after preamble detect, clr when rx hop triggers in eint1 5:set after preamble detect, clr after sync detect 6:set after preamble detect @ _sfr+0xc9
f sfr.irq_0x07_flags 1 @ _sfr+0xca

f sfr.tx_pkt_bits_lsb @ _sfr+0xd2
f sfr.tx_pkt_bits_msb @ _sfr+0xd3
f sfr.tx_ctl @ _sfr+0xd4
CCU 2:set after writing packet bits @ _sfr+0xd4
f sfr.ircal_amp 1 @ _sfr+0xd6
f sfr.ircal_ph 1 @ _sfr+0xd7
CCu set to 1 and 0 during boot @ _sfr+0xdc
CCu set to 2 at boot @ _sfr+0xdd
CCu set to 2 at boot @ _sfr+0xdf

f sfr.modem_data_rate_mmsb 1 @ _sfr+0xe1
f sfr.modem_data_rate_msb 1 @ _sfr+0xe2
f sfr.modem_data_rate_lsb 1 @ _sfr+0xe3
f sfr.modem_misc3 1 @ _sfr+0xe4
CCu 0:FREQ_DEV[16] 1-3:MOD_TYPE, bit3 clr if chip_feature4.0 set 4-6:MOD_SOURCE @ _sfr+0xe4
f sfr.modem_freq_dev_msb 1 @ _sfr+0xe5
f sfr.modem_freq_dev_lsb 1 @ _sfr+0xe6
f sfr.modem_freq_offset_msb 1 @ _sfr+0xe7
f sfr.modem_freq_offset_lsb 1 @ _sfr+0xe8
f sfr_freq_pll_div_int 1 @ _sfr+0xe9
CCu 0-6:pll divider inte[6:0] @ _sfr+0xe9
f sfr.freq_pll_div_frac0 1 @ _sfr+0xea
CCu 0-2:pll divider frac[18:16] 3:1 5-7:RAMP_DLY @ _sfr+0xea
f sfr.freq_pll_div_frac1 1 @ _sfr+0xeb
CCu 0-7:pll divider frac[15:8] @ _sfr+0xeb
f sfr.freq_pll_div_frac2 1 @ _sfr+0xec
CCu 0-7:pll divider frac[7:0] @ _sfr+0xec
f sfr.gpio_unk 1 @ _sfr+0xee
CCu set on various ints 1:LOW_BATT 2:RX_FIFO_ALMOST_FULL 3:TX_FIFO_ALMOST_EMPTY 4: FILTER_MISS 5:RSSI 6:POSTAMBLE_DECT @ _sfr+0xee

f sfr.modem_decimation_cfg @ _sfr+0xf1
CCu 0:RXGAINX2 1-3:NDEC0 4-5:NDEC1 6-7:NDEC2 @ _sfr+0xf1
f sfr.modem_bcr_osr_msb @ _sfr+0xf2
CCu 0-3:RXOSR[11:8] 4:PH0SIZE 5:DISTOGG 6:DROOPFLTBYP 7:CHFLT_LOWP @ _sfr+0xf2
f sfr.modem_bcr_osr_lsb @ _sfr+0xf3
CCu RXOSR[7:0] @ _sfr+0xf3
f sfr.modem_bcr_nco_offset_mmsb @ _sfr+0xf4
CCu 0-5:NCOFF[21:16] 6:SLICEFBBYP 7:BCRFBBYP @ _sfr+0xf4
f sfr.modem_bcr_nco_offset_msb @ _sfr+0xf5
CCu NCOFF[15:8] @ _sfr+0xf5
f sfr.modem_bcr_nco_offset_lsb @ _sfr+0xf6
CCu NCOFF[7:0] @ _sfr+0xf6
f sfr.modem_bcr_gain @ _sfr+0xf7
CCu 0-2CRGAIN[10:8] 3:CRGAINX2 4:RXNCOCOMP 5:RXCOMP_LAT 6:ESC_MIDPT 7:DIS_MIDPT @ _sfr+0xf7
f sfr.modem_bcr_gain_lsb @ _sfr+0xf8
CCu CRGAIN[7:0] @ _sfr+0xf8
f sfr.modem_dec_bcr_cfg @ _sfr+0xf9
CCu 0-2:CRSLOW 3-5:CRFAST 6:DWN2BYP 7:DWN3BYP @ _sfr+0xf9
f sfr.curr_rssi 1 @ _sfr+0xfa
f sfr.ant2_rssi 1 @ _sfr+0xfc
f sfr.ant1_rssi 1 @ _sfr+0xfd
f sfr.antdiv_ctl 1 @ _sfr+0xfe
CCu 3:ADCWATCH 4:ADCRST 6-7:ANTDIV @ _sfr+0xfe

# XREG

echo ..xreg

f xreg_base 1 @ _pdata*256

f xreg.bufclk_ctrl 1 @ xreg_base+0x00
CCu 6:bufclk_en @ xreg_base+0x00
CCu 6:clr by cmd_undoc35 @ xreg_base+0x05
f xreg.div_clk_output_ctrl 1 @ xreg_base+0x09
CCu 0:enable 1-3:div clk sel 6-7:related to bit timer? @ xreg_base+0x09

f xreg.modem_dsa_eye 1 @ xreg_base+0x1b
CCu 6:EYEXEST_FAST 7:EYEXEST_EN @ xreg_base+0x1b

f xreg.modem_afc_ctl 1 @ xreg_base+0x2d
CCu 7:LARGE_FREQ_ERR 6:AFC_GAIN_DIV @ xreg_base+0x2d
f xreg.modem_afc_gear 1 @ xreg_base+0x2e
CCu 0-2:AFC_SLOW 3-5:AFC_FAST 6:ENAFC 7:AFCBD @ xreg_base+0x2e
f xreg.modem_afc_wait 1 @ xreg_base+0x2f

f xreg.modem_afc_gain_msb 1 @ xreg_base+0x30
CCu 0-4:AFCGAIN[12:8] 6-7:GEAR_SW @ xreg_base+0x30
f xreg.modem_afc_gain_lsb 1 @ xreg_base+0x31
CCu AFCGAIN[7:0] @ xreg_base+0x31
f xreg.modem_afc_limiter_msb 1 @ xreg_base+0x32
CCu 0-6:AFCLIM[14:8] 7:ENAFCFRZ @ xreg_base+0x32
f xreg.modem_afc_limiter_lsb 1 @ xreg_base+0x33
CCu 0-7:AFCLIM[7:0] 7: @ xreg_base+0x33
f xreg.modem_ook_cnt1 1 @ xreg_base+0x36
CCu 0-1:SQUELCH 2:SLICER_FAST 3:RAW_SYN 4:MA_FREQDWN 5:OOKFRZEN 6-7:S2P_MAP @ xreg_base+0x36
f xreg.modem_ook_pdtc 1 @ xreg_base+0x38
CCu 0-3:DECAY 4-6:ATTACK 7:OOKFASTMA @ xreg_base+0x38
f xreg.modem_blopk 1 @ xreg_base+0x39
f xreg.modem_afc_zifoff 1 @ xreg_base+0x3a
f xreg.modem_rssi_thresh 1 @ xreg_base+0x3b
f xreg.modem_fsk4_gain1 1 @ xreg_base+0x3c
f xreg.modem_fsk4_gain0 1 @ xreg_base+0x3d
f xreg.modem_fsk4_th 1 @ xreg_base+0x3e

f xreg.modem_fsk4_val 1 @ xreg_base+0x40
CCu set to var.modem_fsk4_map_val1 and val2 @ xreg_base+0x40
f xreg.modem_raw_eye_msb 1 @ xreg_base+0x41
CCu 0-2:RAWEYE[10:8] 3:CONSCHK_BYP 4:NON_FRZEN 5-6:RAWGAIN 7:AFC_MISC.2 (undoc) @ 0x935f
f xreg.modem_raw_eye_lsb 1 @ xreg_base+0x42
f xreg.modem_raw_search2 1 @ xreg_base+0x43
CCu 0-2:SCHPRD_LOW 3-5:SCHPRD_HI 6:RAWFLT_SEL 7:SCH_FRZEN @ xreg_base+0x43
f xreg.modem_ant_div_mode 1 @ xreg_base+0x44
CCu 0-3:ANWAIT 4:SKIP2PHTH 5:BYP1P5 6-7:SWANT_TIMER @ xreg_base+0x44
f xreg.modem_misc4 1 @ xreg_base+0x45
CCu 0-4:UNDOC_0x4f[4:0] 5:MATAP 6:ENAFC_CLKSW 7:ENFZPMEND @ xreg_base+0x45
f xreg.modem_misc1 1 @ xreg_base+0x4e
CCu 0:UNSTDPK 1:AGC_SLOW 2-3:DETECTOR 4-5:PM_PATTERN 6:EN2TB_EST 7:PH_SRC_SEL @ xreg_base+0x4e
f xreg.modem_misc2 1 @ xreg_base+0x4f
CCu 0:RST_PKDT_PERIOD 1:ENJMPRX 2:JMPDLYLEN 3:ENRSSIJMP 4:SGI_N 5:RFPDSLOW 6:IFPDSLOW 7:AGCOVPKT @ xreg_base+0x4f 

f xreg.modem_agc_window_size 1 @ xreg_base+0x50
f xreg.modem_agc_rfpd_decay 1 @ xreg_base+0x51
f xreg.modem_agc_ifpd_decay 1 @ xreg_base+0x52
f xreg.modem_unk0x53 1 @ xreg_base+0x53
CCu 0-2:2 if chip_features3.5 set 3:set for IRCAL, clr after 7:CC_ASSESS_SEL @ xreg_base+0x53
f xreg.modem_rssi_jump_thresh 1 @ xreg_base+0x54
CCu 0-6:RSSIJMPTHD 7:RSSIJMP_UP @ xreg_base+0x54
f xreg.modem_rssi_comp 1 @ xreg_base+0x55
CCu 0-6:RSSI_COMP 7:RSSIJMP_DWN @ xreg_base+0x55
f xreg.preamble_config_std_1 1 @ xreg_base+0x56
f xreg.rx_preamble_timeout 1 @ xreg_base+0x57
CCu 0-3:RX_PREAMBLE_TIMEOUT 4-7:ANT2PM_THD @ xreg_base+0x57
f xreg.modem_tx_filter_coeff_8 1 @ xreg_base+0x58
f xreg.modem_tx_filter_coeff_7 @ xreg_base+0x59
f xreg.modem_tx_filter_coeff_6 @ xreg_base+0x5a
f xreg.modem_tx_filter_coeff_5 @ xreg_base+0x5b
f xreg.modem_tx_filter_coeff_4 @ xreg_base+0x5c
f xreg.modem_tx_filter_coeff_3 @ xreg_base+0x5d
f xreg.modem_tx_filter_coeff_2 @ xreg_base+0x5e
f xreg.modem_tx_filter_coeff_1 @ xreg_base+0x5f
f xreg.modem_tx_filter_coeff_0 @ xreg_base+0x60
f xreg.modem_map_ctrl_nco_mode 1 @ xreg_base+0x61
CCu 0-1: NCOMOD[25:24] 2-3: TXOSR 4-7: MAP_CTRL @ xreg_base+0x61
f xreg.modem_ncomod_mmsb @ xreg_base+0x62
f xreg.modem_ncomod_msb @ xreg_base+0x63
f xreg.modem_ncomod_lsb @ xreg_base+0x64
f xreg.modem_misc_ctrl @ xreg_base+0x65
CCu 0-1: IF_FREQ[17:16] 2: undoc 3: FIXIF 4:ZEROIF 5: AFC_GAIN_COR_EN @ xreg_base+0x65
f xref.modem_if_freq_msb @ xreg_base+0x66
f xref.modem_if_freq_lsb @ xreg_base+0x67
f xreg.modem_dsm_ctrl 1 @ xreg_base+0x68
f xreg.fifo_unk69 1 @ xreg_base+0x69
CCu value written, then busy wait until 0 @ xreg_base+0x69
f xreg.fifo_tx_in_pos 1 @ xreg_base+0x6a
f xreg.fifo_rx_in_pos 1 @ xreg_base+0x6b
f xreg.fifo_rx_count 1 @ xreg_base+0x6f
CCu this + imem 0x49 = rx fifo count @ xreg_base+0x6f

f xreg.spi_buffer 16 @ xreg_base+0x70

CCu Data written here is read with FRR_x_READ commands @ xreg_base+0x80
f xreg.frr_a 1 @ xreg_base+0x80
f xreg.frr_b 1 @ xreg_base+0x81
f xreg.frr_c 1 @ xreg_base+0x82
f xreg.frr_d 1 @ xreg_base+0x83
f xreg.spi_unk0x84 1 @ xreg_base+0x84
CCu set to 0xff on cmd exit w/o error @ xreg_base+0x84
f xreg.boot_unk0x85 1 @ xreg_base+0x85
CCu 0-1:set in timer2 isr 2:set before exiting bootloader 7:if set 0x07xx not init from NVRAM, clr before exiting bootloader @ xreg_base+0x85
f xreg.fifo_tx_length 1 @ xreg_base+0x87
f xreg.fifo_rx_length 1 @ xreg_base+0x88
f xreg.fifo_unk89 1 @ xreg_base+0x89
CCu 3:clr in rx fifo rst 7:clr in tx fifo rst @ xreg_base+0x89
f xreg.fifo_tx_ptr_lsb 1 @ xreg_base+0x8a
f xreg.fifo_rx_ptr_lsb 1 @ xreg_base+0x8b
f xreg.fifo_ptr_msb 1 @ xreg_base+0x8c
CCu 0-3:rx 4-7:tx @ xreg_base+0x8c
f xreg.fifo_tx_out_pos 1 @ xreg_base+0x8d
f xreg.fifo_rx_out_pos 1 @ xreg_base+0x8e
CCu set 0 in rx fifo rst @ xreg_base+0x8e
f xreg.fifo_rx_unk8f 1 @ xreg_base+0x8f
CCu set 0 in rx fifo rst @ xreg_base+0x8f

f xreg.spi_status 1 @ xreg_base+0x91
CCu 0-4:bytes in buf 5:cmd busy error if 1 7:Set when done processing cmd (cts?) @ xreg_base+0x91
f xreg.fifo_tx_unk2 1 @ xreg_base+0x92
CCu set 0 in tx fifo rst @ xreg_base+0x92
f xreg.freq_vco_cnt_msb 1 @ xreg_base+0x93
CCu set in RX/TX_HOP @ xreg_base+0x93
f xreg.freq_vco_cnt_lsb 1 @ xreg_base+0x94
f xreg.freq_w_size @ xreg_base+0x95
CCu set to #0x80 before writing w_size @ xreg_base+0x96
CCu set to #0x08 before writing w_size @ xreg_base+0x97
f xreg.gpio_gpio0_cfg2 1 @ xreg_base+0x99
f xreg.gpio_gpio1_cfg2 1 @ xreg_base+0x9a
f xreg.gpio_gpio2_cfg2 1 @ xreg_base+0x9b
f xreg.gpio_gpio3_cfg2 1 @ xreg_base+0x9c
f xreg.gpio_sdo_cfg2 1 @ xreg_base+0x9d
f xreg.gpio_nirq_cfg2 1 @ xreg_base+0x9e
f xreg.modem_unk9f 1 @ xreg_base+0x9f
CCu set to #0x74 during config_modem @ xreg_base+0x9f

f xreg.gpio_tx_direct 1 @ xreg_base+0xa0
CCu set to TX_DIRECT_MODE_GPIO + 6 @ xreg_base+0xa0
f xreg.gpio_adc_select 1 @ xreg_base+0xa1
f xreg.gpio_gpio0_cfg1 1 @ xreg_base+0xa2
CCu 4-5: read adc 7: pull-up enable 0:pin set/clr? @ xreg_base+0xa2
f xreg.gpio_gpio1_cfg1 1 @ xreg_base+0xa3
f xreg.gpio_gpio2_cfg1 1 @ xreg_base+0xa4
f xreg.gpio_gpio3_cfg1 1 @ xreg_base+0xa5
f xreg.gpio_sdo_cfg1 1 @ xreg_base+0xa6
f xreg.gpio_nirq_cfg1 1 @ xreg_base+0xa7
f xreg.gpio_pin_state 1 @ xreg_base+0xa8
CCu 3-0:GPIO3-0 5:SDO 7:NIRQ? 6,4:SCLK,SDI,nSEL,SDN? @ xreg_base+0xa8
f xreg.gpio_pin_state2 1 @ xreg_base+0xa9
CCu 3-0:GPIO3-0 5:SDO 7:NIRQ @ xreg_base+0xa9
f xreg.clk_ctl_1 1 @ xreg_base+0xaa
CCu 0:clr if clk_32k enabled @ xreg_base+0xaa
f xreg.clk_ctl_2 1 @ xreg_base+0xab
CCu 0:clr if clk_32k enabled @ xreg_base+0xab
f xreg.clk_ctl_3 1 @ xreg_base+0xac
CCu 5-7:clr clk32 off 6:int clk32 5,7:ext clk32 @ xreg_base+0xaa

f xreg.modem_fsk4_map_val0 @ xreg_base+0xb4
f xreg.alt_crc_polynomial_lsb @ xreg_base+0xb5
f xreg.alt_crc_polynomial_msb @ xreg_base+0xb6
f xreg.alt_crc_value_lsb @ xreg_base+0xb7
f xreg.alt_crc_value_msb @ xreg_base+0xb8
f xreg.crc_polynomial_0 @ xreg_base+0xbb
CCu only bytes 0-1 used for crc16 @ xreg_base+0xbb
f xreg.crc_polynomial_1 @ xreg_base+0xbc
f xreg.crc_polynomial_2 @ xreg_base+0xbd
f xreg.crc_polynomial_3 @ xreg_base+0xbe
f xreg.crc16_lsb 1 @ xreg_base+0xbf
CCu only bytes 0-1 used for crc16 @ xreg_base+0xbf

f xreg.crc16_msb 1 @ xreg_base+0xc0
f xreg.crc_value_2 1 @ xreg_base+0xc1
f xreg.crc_value_3 1 @ xreg_base+0xc2
f xreg.wht_poly_lsb @ xreg_base+0xc7
f xreg.wht_poly_msb @ xreg_base+0xc8
f xreg.wht_seed_lsb @ xreg_base+0xc9
f xreg.wht_seed_msb @ xreg_base+0xca
f xreg.wht_bit_num @ xreg_base+0xcb
CCu 0-3: wht_bit_num @ xreg_base+0xcb
f xreg.preamble_tx_len 1 @ xreg_base+0xcc
CCu length in nibbles 1 @ xreg_base+0xcc
f xreg.preamble_config_flags 1 @ xreg_base+0xcd
CCu 0:length msb 2:EN_3_OF_6 3:first_1 4:man_enable 5:1010 6:1010 7:man_const @ xreg_base+0xcd
f xreg.preamble_config_nstd 1 @ xreg_base+0xce
f xreg.preamble_pattern_7_0 1 @ xreg_base+0xcf

f xreg.preamble_pattern_15_8 1 @ xreg_base+0xd0
f xreg.preamble_pattern_23_16 1 @ xreg_base+0xd1
f xreg.preamble_pattern_24_31 1 @ xreg_base+0xd2
f xreg.tx_hop_related 1 @ xreg_base+0xd9
CCu set to #0x15 before writing freq_w_size @ xreg_base+0xda
f xreg.pa_ramp 1 @ xreg_base+0xdb
CCu set to #0x17 if EXT_PA_RAMP, 7 if not @ xreg_base+0xdb
CCu 4:set in adc enable @ xreg_base+0xdf

f xreg.periph_ctrl 1 @ xreg_base+0xe0
CCu 1:ADC @ xreg_base+0xe0
f xreg.periph_ctrl2 1 @ xreg_base+0xe1
CCu 1:NVRAM @ xreg_base+0xe1
f xreg.periph_ctrl3 1 @ xreg_base+0xe2
CCu modified in NVRAM enable and disable @ xreg_base+0xe2

f xreg.adc_ctl @ xreg_base+0xea
CCu 4-7: UDTIME 0-3: set to 9 before ADC read 3: clr when adc done @ xreg_base+0xea
f xreg.adc_result @ xreg_base+0xeb
f xreg.adc_status @ xreg_base+0xec
CCu 0:adc busy 5-7: adc result lsb @ xreg_base+0xec
f xreg.usec_timer_ctl 1 @ xreg_base+0xee
CCu 3:stop? @ xreg_base+0xee
f xreg.usec_timer_lsb 1 @ xreg_base+0xef

f xreg.usec_timer_msb 1 @ xreg_base+0xf0
CCu 0-3: timer msb 5-7: PA FSK_MOD_DLY usec @ xreg_base+0xf0
f xreg.wut_cal_period 1 @ xreg_base+0xf2
CCu 1: cleared before setting wut_m, set after @ xreg_base+0xf2
f xref.wut_cal_ctl 1 @ xreg_base+0xf3
f xreg.wut_m_lsb 1 @ xreg_base+0xf4
f xreg.wut_m_msb 1 @ xreg_base+0xf5
f xreg.wut_r 1 @ xreg_base+0xf6
f xreg.cmd_undoc_0x35 1 @ xreg_base+0xf7
CCu 0:set by cmd_undoc0x35 @ xreg_base+0xf7
f xreg.modem_dsa_ctrl1 @ xreg_base+0xf9
CCu 0-4:ADJ_SAMP_ERR_TOLERANCE 5:DSA_EN 6-7:QUAL_SOURCE @ xreg+base+0xf9
f xreg.modem_dsa_ctrl2 1 @ xreg_base+0xfa
CCu 0-3:ARRIVAL_THD 5:BCR_GEAR_SHIFT(DSA) 6-7:DSA preamble @ xreg_base+0xfa
f xreg.modem_dsa_qual 1 @ xreg_base+0xfc
CCu 0-6:ARRQUAL 7:EYE_QUAL_SEL @ xreg_base+0xfc
f xreg.int_ctl_ph_enable 1 @ xreg_base+0xfd
f xreg.int_ctl_modem_enable 1 @ xreg_base+0xfe
f xreg.int_ctl_chip_enable 1 @ xreg_base+0xff

echo ..xreg2

Cd 1 0x10 @ 0x5100
f xreg2.dma_status 1 @ 0x5100
CCu bit 0 set when dma cmd in progress @ 0x5100
f xreg2.dma_cmd 1 @ 0x5101
CCu bit 0-6 cmd, bit 7 set CPU enters idle @ 0x5101
f xreg2.dma_src_lsb 1 @ 0x5102
f xreg2.dma_src_msb 1 @ 0x5103
f xreg2.dma_dest_lsb 1 @ 0x5104
f xreg2.dma_dest_msb 1 @ 0x5105
f xreg2.dma_len_lsb 1 @ 0x5108
f xreg2.dma.len_msb 1 @ 0x5109
f xreg2.unk_0x0a 1 @ 0x510a

f xreg2.modem_dsa_rssi @ 0x5112
CCu 0-6:DSA_RSSI_THRESHOLD 7:SQUELCH_EN @ 0x5112
f xreg2.modem_rssi_ctrl 1 @ 0x5113
CCu 0-2:RSSI_DELAY_CNT 3:RSSI_DELAY 4-5:? 6-7:AVERAGE @ 0x5113
f xreg2.modem_rssi_thres_hyst 1 @ 0x5114
CCu RSSI_THRES-RSSI_HYSTERISIS, 0=no hysterisis @ 0x5114
f xreg2.modem_bcr_misc 1 @ 0x5115
CCu 0:MODEM_BCR_MISC0.0 (undoc) 3:OOK_LIMIT_DISCHG(inv) @ 0x5115
f xreg2.unk_0x1a 1 @ 0x511a
f xreg2.modem_dsa_misc 1 @ 0x511d
CCu 0-2:LOW_DUTY 3-5:? 6-7:? @ 0x511d
f xreg2.modem_decimation_cfg2 1 @ 0x511e
f xreg2.modem_ook_misc 1 @ 0x511f
CCu 0-1:OOK_DISCHG_DIV 2:OOK_SQUELCH_EN @ 0x511f
f xreg2.unk_0x20 1 @ 0x5120
f xreg2.unk_0x21 1 @ 0x5121

echo ..dsp

# virtual, dsp registers are not mapped to xmem

f dsp_base 1 @ 0x7000
CCu 0:clr after IRCAL @ dsp_base+0x01
f dsp.clk_ctrl 1 @ dsp_base+0x1a
CCu 0-2:BAND 3:SY_SEL 4-5:PA_CLKDUTY @ dsp_base+0x1a

CCu set to 0x0f at start of IRCAL @ dsp_base+0x20
f dsp.lna_shunt 1 @ dsp_base+0x21
CCU set to 0x17 when CLOSE_SHUNT_SW true @ dsp_base+0x21
f dsp.rx_chain_settings @ dsp_base+0x22
CCu 7:EN_HRMNIC_GEN 6:IRCLKDIV 5-4:RF_SOURCE_PWR 2:? @ dsp_base+0x22
f dsp.pga_gain 1 @ dsp_base+0x25
CCu 0-3:PGA_GAIN 7:set with PGA_GAIN @ dsp_base+0x25
CCu 4:ADC_HIGH_GAIN 0:? @ dsp_base+0x28

f dsp.pa_ramp_ex 1 @ dsp_base+0x33
CCu 0-3:TC timing for ext PA signal @ dsp_base+0x33
f dsp.pa_pwr_lvl 1 @ dsp_base+0x39
CCu 0-6:DDAC PA power level @ dsp_base+0x39

f dsp.pa_ob 1 @ dsp_base+0x40
CCu 0-5:OB bias current per PA finger @ dsp_base+0x40
f dsp.pa_tc 1 @ dsp_base+0x46
CCu 0-4:TC timing of PA ramp up and down @ dsp_base+0x46

f dsp.prot0_ctrl @ dsp_base+0x48
CCu 0-2: NVM_BLOWN (1 factory, 3 user, 7 run) @ dsp_base+0x48
