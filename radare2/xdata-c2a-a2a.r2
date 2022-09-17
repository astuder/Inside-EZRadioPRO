# Si4x6x rev C2A/A2A XDATA usage

# XDATA

echo annotating xdata
echo   ..0x0000 variables

f var.clk_32k_sel 1 @ 0x0022
Cd 1 1 @ 0x0022
CCu 0:disabled 1:internal 2:external @ 0x0022
f var.CMD_ERR_STATUS 1 @ 0x0026
Cd 1 1 @ 0x0026
f var.CURRENT_CHANNEL 1 @ 0x002a
Cd 1 1 @ 0x002a
f var.wut_periods 1 @ 0x004e
Cd 1 1 @ 0x004e
CCu #0x40:forever #0x6x:x LDC periods @ 0x004e

echo   ..0x051e property groups

Cd 1 0x2e2 @ 0x51e

f prop.grp_0x24_ezconfig 9 @ 0x051e
CCu see EZRadio Si4455 @ 0x051e
f prop.EZCONFIG_MODULATION 1 @ prop.grp_0x24_ezconfig+0x00
f prop.EZCONFIG_EZCONFIG_CONFIG_SELECT 1 @ prop.grp_0x24_ezconfig+0x01
f prop.EZCONFIG_EZCONFIG_PKT 1 @ prop.grp_0x24_ezconfig+0x02
f prop.EZCONFIG_XO_TUNE 1 @ prop.grp_0x24_ezconfig+0x03

f prop.grp_0x30_match 12 @ 0x0527
f prop.MATCH_VALUE_1 1	 @ prop.grp_0x30_match+0x00
f prop.MATCH_MASK_1 1	 @ prop.grp_0x30_match+0x01
f prop.MATCH_CTRL_1 1	 @ prop.grp_0x30_match+0x02
f prop.MATCH_VALUE_2 1	 @ prop.grp_0x30_match+0x03
f prop.MATCH_MASK_2 1	 @ prop.grp_0x30_match+0x04
f prop.MATCH_CTRL_2 1	 @ prop.grp_0x30_match+0x05
f prop.MATCH_VALUE_3 1	 @ prop.grp_0x30_match+0x06
f prop.MATCH_MASK_3 1	 @ prop.grp_0x30_match+0x07
f prop.MATCH_CTRL_3 1	 @ prop.grp_0x30_match+0x08
f prop.MATCH_VALUE_4 1	 @ prop.grp_0x30_match+0x09
f prop.MATCH_MASK_4 1	 @ prop.grp_0x30_match+0x0a
f prop.MATCH_CTRL_4 1	 @ prop.grp_0x30_match+0x0b

f prop.grp_0x50_rx_hop 66 @ 0x0533
f prop.RX_HOP_CONTROL 1			 @ prop.grp_0x50_rx_hop+0x00
f prop.RX_HOP_TABLE_SIZE 1		 @ prop.grp_0x50_rx_hop+0x01
f prop.RX_HOP_TABLE_ENTRY 64	 @ prop.grp_0x50_rx_hop+0x02

f prop.grp_0x02_frr_ctl 4 @ 0x0609
f prop.FRR_CTL_A_MODE 1	 @ prop.grp_0x02_frr_ctl+0x00
f prop.FRR_CTL_B_MODE 1	 @ prop.grp_0x02_frr_ctl+0x01
f prop.FRR_CTL_C_MODE 1	 @ prop.grp_0x02_frr_ctl+0x02
f prop.FRR_CTL_D_MODE 1	 @ prop.grp_0x02_frr_ctl+0x03

f prop.grp_0x01_int_ctl 4 @ 0x060d
f prop.INT_CTL_ENABLE 1			 @ prop.grp_0x01_int_ctl+0x00
f prop.INT_CTL_PH_ENABLE 1		 @ prop.grp_0x01_int_ctl+0x01
f prop.INT_CTL_MODEM_ENABLE 1	 @ prop.grp_0x01_int_ctl+0x02
f prop.INT_CTL_CHIP_ENABLE 1	 @ prop.grp_0x01_int_ctl+0x03

f prop.grp_0x00_global 11 @ 0x611
f prop.GLOBAL_XO_TUNE 1			 @ prop.grp_0x00_global+0x00
f prop.GLOBAL_CLK_CFG 1			 @ prop.grp_0x00_global+0x01
f prop.GLOBAL_LOW_BATT_THRESH 1	 @ prop.grp_0x00_global+0x02
f prop.GLOBAL_CONFIG 1			 @ prop.grp_0x00_global+0x03
f prop.GLOBAL_WUT_CONFIG 1		 @ prop.grp_0x00_global+0x04
f prop.GLOBAL_WUT_M 2			 @ prop.grp_0x00_global+0x05
f prop.GLOBAL_WUT_R 1			 @ prop.grp_0x00_global+0x07
f prop.GLOBAL_WUT_LDC 1			 @ prop.grp_0x00_global+0x08
f prop.GLOBAL_WUT_CAL 1			 @ prop.grp_0x00_global+0x09
f prop.GLOBAL_BUFCLK_CFG 1		 @ prop.grp_0x00_global+0x0a

f prop.grp_0x21_modem_chflt 36 @ 0x61c
f prop.MODEM_CHFLT_RX1_CHFLT_COE 18 @ prop.grp_0x21_modem_chflt+0x00
f prop.MODEM_CHFLT_RX2_CHFLT_COE 18 @ prop.grp_0x21_modem_chflt+0x12

f prop.group_table_ptr_msb 1 @ 0x0640
f prop.group_table_ptr_lsb 1 @ 0x0641
CCu ptr to prop group table in ROM @ 0x0640

f prop.grp_0x20_modem 96 @ 0x0642
f prop.MODEM_MOD_TYPE 1				 @ prop.grp_0x20_modem+0x00
f prop.MODEM_MAP_CONTROL 1			 @ prop.grp_0x20_modem+0x01
f prop.MODEM_DSM_CTRL 1				 @ prop.grp_0x20_modem+0x02
f prop.MODEM_DATA_RATE 3			 @ prop.grp_0x20_modem+0x03
f prop.MODEM_TX_NCO_MODE 4			 @ prop.grp_0x20_modem+0x06
f prop.MODEM_FREQ_DEV 3				 @ prop.grp_0x20_modem+0x0a
f prop.MODEM_FREQ_OFFSET 2			 @ prop.grp_0x20_modem+0x0d
f prop.MODEM_TX_FILTER_COEFF 9		 @ prop.grp_0x20_modem+0x0f
f prop.MODEM_TX_RAMP_DELAY 1		 @ prop.grp_0x20_modem+0x18
f prop.MODEM_MDM_CTRL 1				 @ prop.grp_0x20_modem+0x19
f prop.MODEM_IF_CONTROL 1			 @ prop.grp_0x20_modem+0x1a
f prop.MODEM_IF_FREQ 3				 @ prop.grp_0x20_modem+0x1b
f prop.MODEM_DECIMATION_CFG1 1		 @ prop.grp_0x20_modem+0x1e
f prop.MODEM_DECIMATION_CFG0 1		 @ prop.grp_0x20_modem+0x1f
f prop.MODEM_DECIMATION_CFG2 1		 @ prop.grp_0x20_modem+0x20
f prop.MODEM_IFPKD_THRESHOLDS 1		 @ prop.grp_0x20_modem+0x21
f prop.MODEM_BCR_OSR 2				 @ prop.grp_0x20_modem+0x22
f prop.MODEM_BCR_NCO_OFFSET 3		 @ prop.grp_0x20_modem+0x24
f prop.MODEM_BCR_GAIN 2				 @ prop.grp_0x20_modem+0x27
f prop.MODEM_BCR_GEAR 1				 @ prop.grp_0x20_modem+0x29
f prop.MODEM_BCR_MISC1 1			 @ prop.grp_0x20_modem+0x2a
f prop.MODEM_BCR_MISC0 1			 @ prop.grp_0x20_modem+0x2b
f prop.MODEM_AFC_GEAR 1				 @ prop.grp_0x20_modem+0x2c
f prop.MODEM_AFC_WAIT 1				 @ prop.grp_0x20_modem+0x2d
f prop.MODEM_AFC_GAIN 2				 @ prop.grp_0x20_modem+0x2e
f prop.MODEM_AFC_LIMITER 2			 @ prop.grp_0x20_modem+0x30
f prop.MODEM_AFC_MISC 1				 @ prop.grp_0x20_modem+0x32
f prop.MODEM_AFC_ZIFOFF 1			 @ prop.grp_0x20_modem+0x33
f prop.MODEM_ADC_CTRL 1				 @ prop.grp_0x20_modem+0x34
f prop.MODEM_AGC_CONTROL 1			 @ prop.grp_0x20_modem+0x35
f prop.MODEM_RESERVED_0x36 1	     @ prop.grp_0x20_modem+0x36
f prop.MODEM_RESERVED_0x37 1	     @ prop.grp_0x20_modem+0x37
f prop.MODEM_AGC_WINDOW_SIZE 1		 @ prop.grp_0x20_modem+0x38
f prop.MODEM_AGC_RFPD_DECAY 1		 @ prop.grp_0x20_modem+0x39
f prop.MODEM_AGC_IFPD_DECAY 1		 @ prop.grp_0x20_modem+0x3a
f prop.MODEM_FSK4_GAIN1 1			 @ prop.grp_0x20_modem+0x3b
f prop.MODEM_FSK4_GAIN0 1			 @ prop.grp_0x20_modem+0x3c
f prop.MODEM_FSK4_TH 2				 @ prop.grp_0x20_modem+0x3d
f prop.MODEM_FSK4_MAP 1				 @ prop.grp_0x20_modem+0x3f
f prop.MODEM_OOK_PDTC 1				 @ prop.grp_0x20_modem+0x40
f prop.MODEM_OOK_BLOPK 1			 @ prop.grp_0x20_modem+0x41
f prop.MODEM_OOK_CNT1 1				 @ prop.grp_0x20_modem+0x42
f prop.MODEM_OOK_MISC 1				 @ prop.grp_0x20_modem+0x43
f prop.MODEM_RAW_SEARCH_DEPRECATED 1 @ prop.grp_0x20_modem+0x44
f prop.MODEM_RAW_CONTROL 1			 @ prop.grp_0x20_modem+0x45
f prop.MODEM_RAW_EYE 2				 @ prop.grp_0x20_modem+0x46
f prop.MODEM_ANT_DIV_MODE 1			 @ prop.grp_0x20_modem+0x48
f prop.MODEM_ANT_DIV_CONTROL 1		 @ prop.grp_0x20_modem+0x49
f prop.MODEM_RSSI_THRESH 1			 @ prop.grp_0x20_modem+0x4a
f prop.MODEM_RSSI_JUMP_THRESH 1		 @ prop.grp_0x20_modem+0x4b
f prop.MODEM_RSSI_CONTROL 1			 @ prop.grp_0x20_modem+0x4c
f prop.MODEM_RSSI_CONTROL2 1		 @ prop.grp_0x20_modem+0x4d
f prop.MODEM_RSSI_COMP 1			 @ prop.grp_0x20_modem+0x4e
f prop.MODEM_DC_CONTROL 1       	 @ prop.grp_0x20_modem+0x4f
f prop.MODEM_RAW_SEARCH2 1			 @ prop.grp_0x20_modem+0x50
f prop.MODEM_CLKGEN_BAND 1			 @ prop.grp_0x20_modem+0x51
f prop.MODEM_RESERVED_0x52 1	     @ prop.grp_0x20_modem+0x52
f prop.MODEM_MODEM_PLL_SETTLE_TIME 1 @ prop.grp_0x20_modem+0x53
f prop.MODEM_SPIKE_DET 1			 @ prop.grp_0x20_modem+0x54
f prop.MODEM_ONE_SHOT_AFC 1			 @ prop.grp_0x20_modem+0x55
f prop.MODEM_RSSI_HYSTERESIS 1		 @ prop.grp_0x20_modem+0x56
f prop.MODEM_RSSI_MUTE 1			 @ prop.grp_0x20_modem+0x57
f prop.MODEM_FAST_RSSI_DELAY 1		 @ prop.grp_0x20_modem+0x58
f prop.MODEM_PSM 2					 @ prop.grp_0x20_modem+0x59
f prop.MODEM_DSA_CTRL1 1			 @ prop.grp_0x20_modem+0x5b
f prop.MODEM_DSA_CTRL2 1			 @ prop.grp_0x20_modem+0x5c
f prop.MODEM_DSA_QUAL 1				 @ prop.grp_0x20_modem+0x5d
f prop.MODEM_DSA_RSSI 1				 @ prop.grp_0x20_modem+0x5e
f prop.MODEM_DSA_MISC 1				 @ prop.grp_0x20_modem+0x5f

f prop.grp_0x23_synth 8 @ 0x06aa
f prop.SYNTH_PFDCP_CPFF 1	 @ prop.grp_0x23_synth+0x00
f prop.SYNTH_PFDCP_CPINT 1	 @ prop.grp_0x23_synth+0x01
f prop.SYNTH_VCO_KV 1		 @ prop.grp_0x23_synth+0x02
f prop.SYNTH_LPFILT 4		 @ prop.grp_0x23_synth+0x03
f prop.SYNTH_VCO_KVCAL 1	 @ prop.grp_0x23_synth+0x07

f prop.grp_0x40_freq_control 8 @ 0x06a2
f prop.FREQ_CONTROL_INTE 1				 @ prop.grp_0x40_freq_control+0x00
f prop.FREQ_CONTROL_FRAC 3				 @ prop.grp_0x40_freq_control+0x01
f prop.FREQ_CONTROL_CHANNEL_STEP_SIZE 2	 @ prop.grp_0x40_freq_control+0x04
f prop.FREQ_CONTROL_W_SIZE 1			 @ prop.grp_0x40_freq_control+0x06
f prop.FREQ_CONTROL_VCOCNT_RX_ADJ 1		 @ prop.grp_0x40_freq_control+0x07

f prop.grp_0x11_sync 10 @ 0x06b2
f prop.SYNC_CONFIG 1	 @ prop.grp_0x11_sync+0x00
f prop.SYNC_BITS 4		 @ prop.grp_0x11_sync+0x01
f prop.SYNC_CONFIG2 1	 @ prop.grp_0x11_sync+0x05
f prop.SYNC_BITS2 4		 @ prop.grp_0x11_sync+0x06

f prop.grp_0x10_preamble 15 @ 0x06bc
f prop.PREAMBLE_TX_LENGTH 1			 @ prop.grp_0x10_preamble+0x00
f prop.PREAMBLE_CONFIG_STD_1 1		 @ prop.grp_0x10_preamble+0x01
f prop.PREAMBLE_CONFIG_NSTD 1		 @ prop.grp_0x10_preamble+0x02
f prop.PREAMBLE_CONFIG_STD_2 1		 @ prop.grp_0x10_preamble+0x03
f prop.PREAMBLE_CONFIG 1			 @ prop.grp_0x10_preamble+0x04
f prop.PREAMBLE_PATTERN 4			 @ prop.grp_0x10_preamble+0x05
f prop.PREAMBLE_POSTAMBLE_CONFIG 1	 @ prop.grp_0x10_preamble+0x09
f prop.PREAMBLE_POSTAMBLE_PATTERN 4	 @ prop.grp_0x10_preamble+0x0a
f prop.PREAMBLE_UNDOCUMENTED_0x0e 1	 @ prop.grp_0x10_preamble+0x0e

f prop.grp_0xf0_pti 5 @ 0x06cb
f prop.PTI_CTL 1	  @ prop.grp_0xf0_pti+0x00
f prop.PTI_BAUD 2	  @ prop.grp_0xf0_pti+0x01
f prop.PTI_LOG_EN 1	  @ prop.grp_0xf0_pti+0x03
f prop.PTI_LOG_EN_2 1 @ prop.grp_0xf0_pti+0x04

f prop.grp_0x12_pkt 58 @ 0x06d0
f prop.PKT_CRC_CONFIG 1				 @ prop.grp_0x12_pkt+0x00
f prop.PKT_WHT_POLY 2				 @ prop.grp_0x12_pkt+0x01
f prop.PKT_WHT_SEED 2				 @ prop.grp_0x12_pkt+0x03
f prop.PKT_WHT_BIT_NUM 1			 @ prop.grp_0x12_pkt+0x05
f prop.PKT_CONFIG1 1				 @ prop.grp_0x12_pkt+0x06
f prop.PKT_CONFIG2 1				 @ prop.grp_0x12_pkt+0x07
f prop.PKT_LEN 1					 @ prop.grp_0x12_pkt+0x08
f prop.PKT_LEN_FIELD_SOURCE 1		 @ prop.grp_0x12_pkt+0x09
f prop.PKT_LEN_ADJUST 1				 @ prop.grp_0x12_pkt+0x0a
f prop.PKT_TX_THRESHOLD 1			 @ prop.grp_0x12_pkt+0x0b
f prop.PKT_RX_THRESHOLD 1			 @ prop.grp_0x12_pkt+0x0c
f prop.PKT_FIELD_1_LENGTH 2			 @ prop.grp_0x12_pkt+0x0d
f prop.PKT_FIELD_1_CONFIG 1			 @ prop.grp_0x12_pkt+0x0f
f prop.PKT_FIELD_1_CRC_CONFIG 1		 @ prop.grp_0x12_pkt+0x10
f prop.PKT_FIELD_2_LENGTH 2			 @ prop.grp_0x12_pkt+0x11
f prop.PKT_FIELD_2_CONFIG 1			 @ prop.grp_0x12_pkt+0x13
f prop.PKT_FIELD_2_CRC_CONFIG 1		 @ prop.grp_0x12_pkt+0x14
f prop.PKT_FIELD_3_LENGTH 2			 @ prop.grp_0x12_pkt+0x15
f prop.PKT_FIELD_3_CONFIG 1			 @ prop.grp_0x12_pkt+0x17
f prop.PKT_FIELD_3_CRC_CONFIG 1		 @ prop.grp_0x12_pkt+0x18
f prop.PKT_FIELD_4_LENGTH 2			 @ prop.grp_0x12_pkt+0x19
f prop.PKT_FIELD_4_CONFIG 1			 @ prop.grp_0x12_pkt+0x1b
f prop.PKT_FIELD_4_CRC_CONFIG 1		 @ prop.grp_0x12_pkt+0x1c
f prop.PKT_FIELD_5_LENGTH 2			 @ prop.grp_0x12_pkt+0x1d
f prop.PKT_FIELD_5_CONFIG 1			 @ prop.grp_0x12_pkt+0x1f
f prop.PKT_FIELD_5_CRC_CONFIG 1		 @ prop.grp_0x12_pkt+0x20
f prop.PKT_RX_FIELD_1_LENGTH 2		 @ prop.grp_0x12_pkt+0x21
f prop.PKT_RX_FIELD_1_CONFIG 1		 @ prop.grp_0x12_pkt+0x23
f prop.PKT_RX_FIELD_1_CRC_CONFIG 1	 @ prop.grp_0x12_pkt+0x24
f prop.PKT_RX_FIELD_2_LENGTH 2		 @ prop.grp_0x12_pkt+0x25
f prop.PKT_RX_FIELD_2_CONFIG 1		 @ prop.grp_0x12_pkt+0x27
f prop.PKT_RX_FIELD_2_CRC_CONFIG 1	 @ prop.grp_0x12_pkt+0x28
f prop.PKT_RX_FIELD_3_LENGTH 2		 @ prop.grp_0x12_pkt+0x29
f prop.PKT_RX_FIELD_3_CONFIG 1		 @ prop.grp_0x12_pkt+0x2b
f prop.PKT_RX_FIELD_3_CRC_CONFIG 1	 @ prop.grp_0x12_pkt+0x2c
f prop.PKT_RX_FIELD_4_LENGTH 2		 @ prop.grp_0x12_pkt+0x2d
f prop.PKT_RX_FIELD_4_CONFIG 1		 @ prop.grp_0x12_pkt+0x2f
f prop.PKT_RX_FIELD_4_CRC_CONFIG 1	 @ prop.grp_0x12_pkt+0x30
f prop.PKT_RX_FIELD_5_LENGTH 2		 @ prop.grp_0x12_pkt+0x31
f prop.PKT_RX_FIELD_5_CONFIG 1		 @ prop.grp_0x12_pkt+0x33
f prop.PKT_RX_FIELD_5_CRC_CONFIG 1	 @ prop.grp_0x12_pkt+0x34
f prop.PKT_RESERVED_0x35 1		     @ prop.grp_0x12_pkt+0x35
f prop.PKT_CRC_SEED 4				 @ prop.grp_0x12_pkt+0x36

f prop.grp_0x22_pa 7 @ 0x070a
f prop.PA_MODE 1				 @ prop.grp_0x22_pa+0x00
f prop.PA_PWR_LVL 1				 @ prop.grp_0x22_pa+0x01
f prop.PA_BIAS_CLKDUTY 1		 @ prop.grp_0x22_pa+0x02
f prop.PA_TC 1					 @ prop.grp_0x22_pa+0x03
f prop.PA_RAMP_EX 1				 @ prop.grp_0x22_pa+0x04
f prop.PA_RAMP_DOWN_DELAY 1		 @ prop.grp_0x22_pa+0x05
f prop.PA_DIG_PWR_SEQ_CONFIG 1	 @ prop.grp_0x22_pa+0x06

echo   ..0x0711 constants and cal data

f const.FUNC_INFO_REVEXT 1 @ 0x0711
f const.FUNC_INFO_REVBRANCH 1 @ 0x0712
f const.FUNC_INFO_REVINT 1 @ 0x0713
f const.FUNC_INFO_UNK_0x06_to_0x0a 1 @ 0x0714
f const.FUNC_INFO_FUNC 1 @ 0x0719
CCu 0-5:FUNC 7:PATCH @ 0x0719
f cfg.XTAL_OPTIONS 1 @ 0x071a
CCu 0:TCXO @ 0x071a
f cfg.XO_FREQ 4 @ 0x071b

f cfg.gpio_gpio0_cfg2 1 @ 0x071f
f cfg.gpio_gpio1_cfg2 1 @ 0x0720
f cfg.gpio_gpio2_cfg2 1 @ 0x0721
f cfg.gpio_gpio3_cfg2 1 @ 0x0722
f cfg.gpio_sdo_cfg2 1 @ 0x0723
f cfg.gpio_nirq_cfg2 1 @ 0x0724
f cfg.gpio_0xee 1 @ 0x0725
CCu copied from sfr.0xee when entering sleep, back after reset @ 0x0725
f cfg.gpio_drv_strength 1 @ 0x0726
f cfg.gpio_gpio0_cfg1 1 @ 0x0727
CCu 7:set if mode PKT_TRACE 6:PULL_CTRL 5-0:GPIO_MODE @ 0x0727
f cfg.gpio_gpio1_cfg1 1 @ 0x0728
CCu 7:set if mode PKT_TRACE 6:PULL_CTRL 5-0:GPIO_MODE @ 0x0728
f cfg.gpio_gpio2_cfg1 1 @ 0x0729
CCu 7:set if mode PKT_TRACE 6:PULL_CTRL 5-0:GPIO_MODE @ 0x0729
f cfg.gpio_gpio3_cfg1 1 @ 0x072a
CCu 7:set if mode PKT_TRACE 6:PULL_CTRL 5-0:GPIO_MODE @ 0x072a
f cfg.gpio_sdo_cfg1 1 @ 0x072b
CCu 7:set if mode PKT_TRACE 6:PULL_CTRL 5-0:GPIO_MODE @ 0x072b
f cfg.gpio_nirq_cfg1 1 @ 0x072c
CCu 7:set if mode NIRQ 6:PULL_CTRL 5-0:GPIO_MODE @ 0x072c

f cfg.fifo_rx_start_msb 1 @ 0x072d
f cfg.fifo_rx_start_lsb 1 @ 0x072e
f cfg.fifo_tx_start_msb 1 @ 0x072f
f cfg.fifo_tx_start_lsb 1 @ 0x0730
f cfg.fifo_rx_length 1 @ 0x0731
f cfg.fifo_tx_length 1 @ 0x0732
f cfg.fifo_rx_start_pos 1 @ 0x0733
f cfg.fifo_tx_start_pos 1 @ 0x0734

f var.ANT1_RSSI 1 @ 0x0735
f var.ANT2_RSSI 1 @ 0x0736

f var.xreg_4a_copy 1 @ 0x0737
f var.xreg_4b_copy 1 @ 0x0738
f var.xreg_4c_copy 1 @ 0x0739
f var.xreg_4d_copy 1 @ 0x073a

f var.cmd_0xf2_arg1 1 @ 0x073b
f var.cmd_0xf2_arg2 1 @ 0x073c
f var.cmd_0xf2_arg3 1 @ 0x073d
f var.cmd_0xf2_arg4 1 @ 0x073e

f var.IRCAL_AMP_VAL 1 @ 0x073f
f var.IRCAL_PH_VAL 1 @ 0x0740

f var.rc32k_xtal_divider_msb 1 @ 0x0741
f var.rc32k_xtal_divider_lsb 1 @ 0x0742

CCu tx delay in usec @ 0x0743
f var.tx_delay_msb 1 @ 0x0743
f var.tx_delay_lsb 1 @ 0x0744

f var.pti_speed_msb 1 @ 0x0745
f var.pti_speed_lsb 1 @ 0x0746

f var.CMD_ERR_CMD_ID 1 @ 0x0747
f var.flags_26_backup 1 @ 0x0748
f const.xo_div_250000 @ 0x0749

f const.unk_0x74b 1 @ 0x074b
f var.wut_cal_counter 1 @ 0x074c
CCu base address for data accessible by FRR @ 0x074d
f var.frr_base_address 1 @ 0x074d

f var.INT_STATUS 1 @ 0x074e
f var.INT_PEND 1 @ 0x074f
f var.INT_PH_STATUS 1 @ 0x0750
f var.INT_PH_PEND 1 @ 0x0751
f var.INT_MODEM_STATUS 1 @ 0x0752
f var.INT_MODEM_PEND 1 @ 0x0753
f var.INT_CHIP_STATUS 1 @ 0x0754
f var.INT_CHIP_PEND 1 @ 0x0755
f var.CURRENT_STATE 1 @ 0x0756
f var.LATCHED_RSSI 1 @ 0x0757
f var.CURRENT_RSSI 1 @ 0x0758

f const.FUNC_INFO_PATCH 2 @ 0x075f

CCu 0x37 bytes calibration data copied from NVM, prop OTP_VARS @ 0x0761
f prop.grp_0xf2_otp_vars 0x37 @ 0x0761
f prop.OTP_VARS_SPI_ACTIVE_SEQ_DELAY 2 @ prop.grp_0xf2_otp_vars+0x00
f prop.OTP_VARS_TX_TUNE_SEQ_DELAY 1 @ prop.grp_0xf2_otp_vars+0x02
f prop.OTP_VARS_READY_SEQ_DELAY 1 @ prop.grp_0xf2_otp_vars+0x03
f prop.OTP_VARS_RX_SEQ_DELAY 2 @ prop.grp_0xf2_otp_vars+0x04
f prop.OTP_VARS_CAL_ENABLE_VTR 1 @ prop.grp_0xf2_otp_vars+0x06
f prop.OTP_VARS_CAL_ENABLE 1 @ prop.grp_0xf2_otp_vars+0x07
f prop.OTP_VARS_VTR_VCO_V3P3_TARGET_VOLTAGE 1 @ prop.grp_0xf2_otp_vars+0x08
f prop.OTP_VARS_VTR_VCO_V1P5_TARGET_VOLTAGE 1 @ prop.grp_0xf2_otp_vars+0x09
f prop.OTP_VARS_VTR_VCO_LADR_TARGET_VOLTAGE 1 @ prop.grp_0xf2_otp_vars+0x0a
f prop.OTP_VARS_RC_CAL_ADC_TARGET 2 @ prop.grp_0xf2_otp_vars+0x0b
CCu rc32k cal related @ prop.grp_0xf2_otp_vars+0x0b
f prop.grp_0xf2_otp_vars_0x0c 1 @ prop.grp_0xf2_otp_vars+0x0c
CCu rc32k cal related @ prop.grp_0xf2_otp_vars+0x0c
f prop.OTP_VARS_RC_CAL 1 @ prop.grp_0xf2_otp_vars+0x0d
CCu rc32k cal related @ prop.grp_0xf2_otp_vars+0x0d
f prop.OTP_VARS_RC_CAL1 1 @ prop.grp_0xf2_otp_vars+0x0e
CCu rc32k related, upper nibble written to xreg 0xe5 @ prop.grp_0xf2_otp_vars+0x0e
f prop.OTP_VARS_RC_CAL2 1 @ prop.grp_0xf2_otp_vars+0x0f
CCu rc32k related, 0-5:written to xreg 0xe5 6-7:written to dsp 0x50 @ prop.grp_0xf2_otp_vars+0x0f
f prop.OTP_VARS_BOOT_OSC_CAL 1 @ prop.grp_0xf2_otp_vars+0x10
f prop.OTP_VARS_BOOT_OSC_CAL1 1 @ prop.grp_0xf2_otp_vars+0x11
f prop.OTP_VARS_AUXADC_TEMP_SLOPE 1 @ prop.grp_0xf2_otp_vars+0x12
f prop.OTP_VARS_AUXADC_TEMP_INTERCEPT 1 @ prop.grp_0xf2_otp_vars+0x13
f prop.OTP_VARS_AUXADC_SY_GAIN_ERROR 1 @ prop.grp_0xf2_otp_vars+0x14
f prop.OTP_VARS_AUXADC_SY_OFFSET_ERROR 1 @ prop.grp_0xf2_otp_vars+0x15
f prop.OTP_VARS_ADC_VOLTAGE_TRIM 1 @ prop.grp_0xf2_otp_vars+0x16
f prop.OTP_VARS_VCO_LOAD5_XO 1 @ prop.grp_0xf2_otp_vars+0x17
f prop.OTP_VARS_REG_RXFE_LPF 1 @ prop.grp_0xf2_otp_vars+0x18
f prop.OTP_VARS_REG_ADC_LPF 1 @ prop.grp_0xf2_otp_vars+0x19
f prop.OTP_VARS_REG_CLKGEN_COM_LPF 1 @ prop.grp_0xf2_otp_vars+0x1a
f prop.OTP_VARS_REG_FBDIV_LPF 1 @ prop.grp_0xf2_otp_vars+0x1b
CCu 4-7:dsp0x06 @ prop.grp_0xf2_otp_vars+0x1b
f prop.OTP_VARS_REG_CLKGEN_TX_LPF 1 @ prop.grp_0xf2_otp_vars+0x1c
f prop.OTP_VARS_REG_CLKGEN_COM_LOW_BAND 1 @ prop.grp_0xf2_otp_vars+0x1d
f prop.OTP_VARS_REG_RXFE_HPF 1 @ prop.grp_0xf2_otp_vars+0x1e
f prop.OTP_VARS_REG_ADC_HPF 1 @ prop.grp_0xf2_otp_vars+0x1f
f prop.OTP_VARS_REG_CLKGEN_COM_HPF 1 @ prop.grp_0xf2_otp_vars+0x20
f prop.OTP_VARS_REG_FBDIV_HPF 1 @ prop.grp_0xf2_otp_vars+0x21
CCu 4-7:dsp0x06 @ prop.grp_0xf2_otp_vars+0x21
f prop.OTP_VARS_REG_CLKGEN_TX_HPF 1 @ prop.grp_0xf2_otp_vars+0x22
f prop.OTP_VARS_ETSI_CFG0 1 @ prop.grp_0xf2_otp_vars+0x23
f prop.OTP_VARS_ETSI_CFG1 1 @ prop.grp_0xf2_otp_vars+0x24
CCu 4-7:dsp0x06 @ prop.grp_0xf2_otp_vars+0x24
f prop.OTP_VARS_ETSI_CFG2 1 @ prop.grp_0xf2_otp_vars+0x25
f prop.OTP_VARS_PH_WATERMARK 1 @ prop.grp_0xf2_otp_vars+0x26
f prop.OTP_VARS_PROC_MON_RCAL 1 @ prop.grp_0xf2_otp_vars+0x27
f prop.OTP_VARS_REF_CAL_BANDGAP 1 @ prop.grp_0xf2_otp_vars+0x28
f prop.OTP_VARS_VCO_ADJ 1 @ prop.grp_0xf2_otp_vars+0x29
f prop.OTP_VARS_MISC_DELAY 1 @ prop.grp_0xf2_otp_vars+0x2a
f prop.OTP_VARS_CAL_MAN 1 @ prop.grp_0xf2_otp_vars+0x2b
f prop.OTP_VARS_REG_CLKGEN_COM_HPF_HOT 1 @ prop.grp_0xf2_otp_vars+0x2c
f prop.OTP_VARS_VTR_VCO_V1P5_TARGET_VOLTAGE_HOT 1 @ prop.grp_0xf2_otp_vars+0x2d
f prop.OTP_VARS_REG_FBDIV_COM_HOT 1 @ prop.grp_0xf2_otp_vars+0x2e
CCu 4-7:dsp0x06 @ prop.grp_0xf2_otp_vars+0x2e
f prop.OTP_VARS_REG_DIG_LOAD_ACFG_DIGREG_HOT 1 @ prop.grp_0xf2_otp_vars+0x2f
f prop.OTP_VARS_CAL_MAN_ONLINE_TEMP_DELTA 1 @ prop.grp_0xf2_otp_vars+0x30
f prop.OTP_VARS_CAL_MAN_OFFLINE_TEMP_DELTA 1 @ prop.grp_0xf2_otp_vars+0x31
f prop.OTP_VARS_CAL_MAN_LOWER_TEMP_TARGET 1 @ prop.grp_0xf2_otp_vars+0x32
f prop.OTP_VARS_CAL_MAN_HIGHER_TEMP_TARGET 1 @ prop.grp_0xf2_otp_vars+0x33
f prop.OTP_VARS_NVM_TIMING 1 @ prop.grp_0xf2_otp_vars+0x34
f prop.OTP_VARS_SPARE_35 1 @ prop.grp_0xf2_otp_vars+0x35
f prop.OTP_VARS_SPARE_36 1 @ prop.grp_0xf2_otp_vars+0x36

CCu 0x58 bytes copied from NVRAM, related to 0x94/95 @ 0x0798
f var.dsp_reg_cache 0x58 @ 0x0798
f var.dsp_reg_cache_0x01 1 @var.dsp_reg_cache+0x01
f var.dsp_reg_cache_0x03 1 @var.dsp_reg_cache+0x03
f var.dsp_reg_cache_0x06 1 @var.dsp_reg_cache+0x06
f var.dsp_reg_cache_0x08 1 @var.dsp_reg_cache+0x08
f var.dsp_reg_cache_0x13 1 @var.dsp_reg_cache+0x13
f var.dsp_reg_cache_0x21 1 @var.dsp_reg_cache+0x21
f var.dsp_reg_cache_0x23 1 @var.dsp_reg_cache+0x23
f var.dsp_reg_cache_0x25 1 @var.dsp_reg_cache+0x25
f var.dsp_reg_cache_0x27 1 @var.dsp_reg_cache+0x27
f var.dsp_reg_cache_0x28 1 @var.dsp_reg_cache+0x28
f var.dsp_reg_cache_0x2b 1 @var.dsp_reg_cache+0x2b
f var.dsp_reg_cache_0x30 1 @var.dsp_reg_cache+0x30
f var.dsp_reg_cache_0x31 1 @var.dsp_reg_cache+0x31
f var.dsp_reg_cache_0x39 1 @var.dsp_reg_cache+0x39
f var.dsp_reg_cache_0x3b 1 @var.dsp_reg_cache+0x3b
f var.dsp_reg_cache_0x41 1 @var.dsp_reg_cache+0x41
f var.dsp_reg_cache_prot0_ctrl 1 @ var.dsp_reg_cache+0x48
CCu 7=run (NVRAM locked) @ var.dsp_reg_cache+0x48
f var.dsp_reg_cache_rctrim 1 @var.dsp_reg_cache+0x4f
f var.dsp_reg_cache_0x53 1 @var.dsp_reg_cache+0x53
f var.dsp_reg_cache_0x54 1 @var.dsp_reg_cache+0x54
f var.dsp_reg_cache_0x55 1 @var.dsp_reg_cache+0x55
f var.dsp_reg_cache_0x56 1 @var.dsp_reg_cache+0x56
f var.dsp_reg_cache_0x57 1 @var.dsp_reg_cache+0x57

CCu 0x10 bytes copied from NVRAM (chip data) @ 0x07f0
f const.PART_INFO_PART 2 @ 0x07f0
f const.PART_INFO_PBUILD 1 @ 0x07f2
f const.PART_INFO_ID 2 @ 0x07f3
f const.PART_INFO_CUSTOMER 1 @ 0x07f5
f const.group_info_mask 2 @ 0x07f6
f const.chip_features1 1 @ 0x07f9
CCu 0:PEEK 1:POKE 2:EZConfig? @ 0x07f9
f const.chip_features2 1 @ 0x07fa
CCu 0:HP PA 1:LP PA 2:MP PA 3:ETSI 4:PWR SEQ 5:TX HOP 6:BUFCLK @ 0x07fa
f const.chip_features3 1 @ 0x07fb
CCu 2:IRCAL 3:DSA 4:LOW PWR B 5:related to xreg0x53 6:LOW PWR A 7:Fast RSSI latching @ 0x07fb
f const.chip_features4 1 @ 0x07fc
CCu 0:4FSK? 1:ADV SYNC LEN 2:DUAL SYNC 5:PHASE SAMPLE 6:PKT FIELD REPEAT? 7:TX NUM REPEAT @ 0x07fc
f const.chip_fvco_div_override 1 @ 0x07fd
CCu if not 0, overrides MODEM_CLKGEN_BAND.BAND 1 @ 0x07fd
f const.PART_INFO_UNDOCUMENTED 1 @ 0x07fe
f const.PART_INFO_CHIPREV 1 @ 0x07ff

echo   ..0x4700 mirror of 0x0700

Cd 1 16 @ 0x47f0

# mirror of 0x07xx
f const.mFUNC_INFO_PATCH 2 @ 0x475f
f const.mPART_INFO_PART 2 @ 0x47f0
f const.mPART_INFO_PBUILD 1 @ 0x47f2
f const.mPART_INFO_ID 2 @ 0x47f3
f const.mPART_INFO_CUSTOMER 1 @ 0x47f5
f const.mPART_INFO_BOND 1 @ 0x47fe
f const.mPART_INFO_CHIPREV 1 @ 0x47ff
