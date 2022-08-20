# Si446x rev A2A runtime firmware
# Note: rev C2A has differences in map/patch code

echo .
echo EZRadioPRO Si446x-A2A in transceiver/receiver mode
echo .

# includes for analysis shared by boot and all func images

. radare2/common.r2
. radare2/registers-c2a-a2a.r2
. radare2/registers-c2a-a2a-xrefs.r2
. radare2/xdata-c2a-a2a.r2
. radare2/rom-c2a-a2a.r2

# specific to FUNC1 rev A2A

# IMEM

echo annotating imem

f var.ph_lenfield_pos @ _idata+0x09
f var.ph_pktlen_msb @ _idata+0x0a
f var.ph_pktlen_lsb @ _idata+0x0b
f var.ph_dsp_frame_size @ _idata+0x0e
f var.ph_tx_byte @ _idata+0x10
f var.ph_peramble_timeout 1 @ _idata+0x11
f var.ph_tx_bytes_sent @ _iadata+0x12
f var.ph_postamble_cnt 1 @ _idata+0x13
CCu values 0-3 for 1-4 bytes @ _idata+0x13
f var.loc14 1 @ _idata+0x14
f var.loc15 1 @ _idata+0x15
f var.loc_ph_pktlen_msb @ _idata+0x16
f var.loc_ph_pktlen_lsb @ _idata+0x17
f var.rx_fields_cnt @ _idata+0x18
f var.tx_fields_cnf @ _idata+0x19
f var.rx_pkt_field_cfg_msb 1 @ _idata+0x1a
f var.rx_pkt_field_cfg_lsb 1 @ _idata+0x1b
f var.rx_byte_in 1 @ _idata+0x1c
f var.device_curr_state 1 @ _idata+0x1d
f var.device_next_state 1 @ _idata+0x1e
f var.pcon_next 1 @ _idata+0x1f

f var.loc21 1 @ _idata+0x21
f var.ph_flags0 1 @ _idata+0x22
CCu 3:PKT_LEN.SIZE 4:? @ _idata+0x22
f var.rx_hop_ctl 1 @ _idata+0x23
CCu 0:rssi 1:preamble 2:sync 3:hop pending @ _idata+0x23
f var.flags_24 1 @ _idata+0x24
CCu 0:? 1:? 2:txrx started? 4:rx hop? 5:rc32k cal due 6:wht bit8 7:state change in progress? @ _idata+0x24
f var.flags_25 1 @ _idata+0x25
CCu 0:wut expired 1:low power 3:EZConfig? 4:zeroif 5:synth recal 7:OOK @ _idata+0x25
f var.flags_26 1 @ _idata+0x26
CCu 0:usec delay expired 1:tx hop? 3:RX(0)/TX(1) 4:Cal LOW/HIGH_TEMP 5:? @ _idata+0x26
f var.flags_27 1 @ _idata+0x27
CCu 0:rc32k? 1:rc32k cal requested 2:? 3:cal due? @ _idata+0x27
f var.flags_28 1 @ _idata+0x28
CCu related to main loop bit7 @ _idata+0x28
f var.ph_flags1 1 @ _idata+0x29
CCu 4:set on PH filter match @ _idata+0x29
f var.ph_field_flags 1 @ _idata+0x2a
CCu 0:SW_WHT_CTRL 1:SW_CRC_CTRL 2:variable pktlen 3:expect_len_field 4:postamble_en 5:filter_en @ _idata+0x2a
f var.ph_flags3 1 @ _idata+0x2b
CCu 2:don't write byte into fifo if set 4:sync detected 5:preamble detected @ _idata+0x2b
f var.main_loop_ctl 1 @ _idata+0x2c
CCu 0:parse cmds 1:cfg event? 2:change state in progress 3:rxtx_event 5:wut 6:? 7:? @ _idata+0x2c
f var.main_loop_event_ex 1 @ _idata+0x2d
CCu 0:rx 1:wut 2:rc32k cal 3:tx 4:manual rx hop 5:rx hop @ _idata+0x2d
f var.pti_flags 1 @ _idata+0x2e
CCu 3:? (idata 0x8d,8e,90) 4:spi_en (undoc) 5:tx_en 6:rx_en @ _idata+0x2e
f var.modem_irq_flags 1 @ _idata+0x2f
CCu 0:phase sample 1:packet sent 4:preamble timeout 5:sync timout 6:RSSI jump @ _idata+0x2f

f var.loc30 1 @ _idata+0x30
f var.loc31 1 @ _idata+0x31
f var.loc32 1 @ _idata+0x32
f var.loc33 1 @ _idata+0x33
f var.loc34 1 @ _idata+0x34
f var.loc35 1 @ _idata+0x35
f var.loc36 1 @ _idata+0x36
f var.loc37 1 @ _idata+0x37
f var.loc38 1 @ _idata+0x38
f var.loc39 1 @ _idata+0x39
f var.loc3a 1 @ _idata+0x3a
f var.loc3b 1 @ _idata+0x3b
f var.loc3c 1 @ _idata+0x3c
f var.loc3d 1 @ _idata+0x3d
f var.loc3e 1 @ _idata+0x3e
f var.loc3f 1 @ _idata+0x3f

f var.fifo_rx_bytes_added @ _idata+0x42
f var.fifo_tx_space 1 @ _idata+0x43
f var.fifo_rx_space 1 @ _idata+0x44
f var.fifo_rx_end_msb 1 @ _idata+0x45
f var.fifo_rx_end_lsb 1 @ _idata+0x46
f var.fifo_tx_end_msb 1 @ _idata+0x47
f var.fifo_tx_end_lsb 1 @ _idata+0x48
f var.fifo_rx_count 1 @ _idata+0x49
CCu set to xreg0x8e - xreg0x6b, this+xreg6f=rx fifo count @ _idata+0x49
f var.fifo_tx_count 1 @ _idata+0x4a
f var.fifo_rx_pos_wr 1 @ _idata+0x4b
f var.fifo_rx_count2 1 @ _idata+0x4c
f var.fifo_tx_count2 1 @ _idata+0x4d
f var.fifo_rx_size 1 @ _idata+0x4e
f var.fifo_tx_size 1 @ _idata+0x4f

f var.fifo_rx_wr_ptr_msb 1 @ _idata+0x50
f var.fifo_rx_wr_ptr_lsb 1 @ _idata+0x51
f var.fifo_tx_rd_ptr_msb 1 @ _idata+0x52
f var.fifo_tx_rd_ptr_lsb 1 @ _idata+0x53
f var.ircal_stage 1 @ _idata+0x54
CCu starts at 8, rrc to 0 @ _idata+0x54
f var.ircal_max_rssi 1 @ _idata+0x55
f var.ircal_curr_rssi 1 @ _idata+0x56
f var.ircal_step 1 @ _idata+0x57
f var.frr_a_ptr_lsb 1 @ _idata+0x58
f var.frr_b_ptr_lsb 1 @ _idata+0x59
f var.frr_c_ptr_lsb 1 @ _idata+0x5a
f var.frr_d_ptr_lsb 1 @ _idata+0x5b
f var.rxtx_delay_cnt_msb 1 @ _idata+0x5c
f var.rxtx_delay_cnt_lsb 1 @ _idata+0x5d
f var.crc16_msb 1 @ _idata+0x5e
f var.crc16_lsb 1 @ _idata+0x5f

f var.ph_status 1 @ _idata+0x61
CCu 0:clr end of ph isr 1:rx fifo overflow 2:ph isr error @ _idata+0x61
f var.target_channel @ _idata+0x62
f var.spi_len_in @ _idata+0x63
CCu incoming bytes in SPI buffer @ _idata+0x63
f var.whit_seed @ _idata+0x65
f var.main_loop_bit7_cmd @ _idata+0x66
f var.loc67 1 @ _idata+0x67
f var.loc68 1 @ _idata+0x68
f var.loc69 1 @ _idata+0x69
f var.loc6a 1 @ _idata+0x6a
f var.loc6b 1 @ _idata+0x6b
f var.loc6c 1 @ _idata+0x6c

f var.ph_field_len_msb 1 @ _idata+0x71
f var.ph_field_len_lsb 1 @ _idata+0x72
f var.ezconfig_ptr_msb 1 @ _idata+0x73
f var.ezconfig_ptr_lsb 1 @ _idata+0x74
f var.tx_num_repeat_cnt 1 @ _idata+0x75

f var.modem_fsk4_map_val2 1 @ _idata+0x84
f var.modem_fsk4_map_val1 1 @ _idata+0x85
f var.afc_freq_offset_msb 1 @ _idata+0x86
f var.afc_freq_offset_lsb 1 @ _idata+0x87
f var.int0x0f_callback_msb 1 @ _idata+0x89
f var.int0x0f_callback_lsb 1 @ _idata+0x8a
f var.eint1_callback_msb 1 @ _idata+0x8b
f var.eint1_callback_lsb 1 @ _idata+0x8c
f var.scratch_unk0x8e 1 @ _idata+0x8e
f var.info_flags_cal_type 1 @ _idata+0x8f

f var.cfg_steps 3 @ _idata+0x91
f var.adc_cfg 1 @ _idata+0x94
f var.ezconfig_pos @ _idata+0x97

# CODE

echo annotating code

f patch.rx_preamble_timeout 1 @ 0x0046
CCu state change in progress? @ 0x0046
f patch.rx_packet_received 1 @ 0x004f

echo ..jump map

f map.packet_sent 1 @ 0x0057
f map.invalid_prop_group_get 1 @ 0x005a
f map.adc_unk0xc75a 1 @ 0x005d
f map.fifo_config 1 @ 0x0060
f map.xreg0xdf_wiggle_bit1_ret_bit3 1 @ 0x0063
f map.config_cmd_unk0x10 1 @ 0x0066
f map.clk_unk0xb97f 1 @ 0x0069
f map.pti_send_tx_info 1 @ 0x006c
f map.cmd_undoc_0xd0 1 @ 0x006f
f map.psm_eint1_callback 1 @ 0x0075
f map.rx_preamble_timeout 1 @ 0x0078
f map.config_bufclk 1 @ 0x007b
f map.rc32k_cal_unk0xb2bf @ 0x007e
f map.main_loop_rxtx_event_part2 1 @ 0x0081
f map.eint1_disable 1 @ 0x0084
f map.main_loop_bit6_event 1 @ 0x0087
f map.fifo_tx_check_almost_empty 1 @ 0x008a
f map.modem_isr_rssi_thresh 1 @ 0x008d
f map.psm_enable 1 @ 0x0090
f map.cmd_protocol_cfg 1 @ 0x0093
f map.rx_process_byte 1 @ 0x0096
f map.rx_ph_isr_bit5 1 @ 0x0099
f map.clk_config_div_clk_output 1 @ 0x009c
f map.ircal_measure_rssi 1 @ 0x009f
f map.change_state_from_11 1 @ 0x00a5
f map.check_thresh_at_latch 1 @ 0x00a8
f map.tx_start 1 @ 0x00ab
f map.fifo_rx_raise_almost_full 1 @ 0x00ae
f map.synth_recal_check 1 @ 0x00b1
f map.rx_start_dsp_unk_0xc1db 1 @ 0x00b4
f map.dma_copy 1 @ 0x00b7
f map.rx_hop_config 1 @ 0x00ba
f map.config_cmd_unk0x0c 1 @ 0x00bd
f map.config_cmd_unk0x01 1 @ 0x00c0
f map.modem_isr_phase_sample 1 @ 0x00c6
f map.usec_delay_unk_0xbda1 1 @ 0x00c9
f map.change_from_ready_to_11 1 @ 0x00cc
f map.wut_expired 1 @ 0x00cf
f map.gpio_read_pin_cfg 1 @ 0x00d2
f map.tx_pwr_seq_start 1 @ 0x00d5
f map.dma_disable 1 @ 0x00d8
f map.pkt_end_unk_0xafcb 1 @ 0x00db
f map.enter_sleep_state 1 @ 0x00de
f map.change_from_tx 1 @ 0x00e1
f map.latch_rssi 1 @ 0x00e7
f map.gpio_config_pin 1 @ 0x00ea
f map.exit_cmd_with_err 1 @ 0x00ed
f map.main_loop_parse_cmds 1 @ 0x00f6
f map.adc_calculate_result 1 @ 0x00f0
f map.config_modem 1 @ 0x00f3
f map.rc32k_read_xreg_0xe7_0xe8 @ 0x00f9
f map.config_cmd_unk0x12 1 @ 0x00fc
f map.modem_isr_rssi_jump 1 @ 0x00ff

f map.gpio_state_clr_r7 1 @ 0x0102
f map.wut_start_rx_tx 1 @ 0x0105
f map.modem_start_unk0xba27 1 @ 0x0108
f map.fifo_rx_update 1 @ 0x010b
f map.rx_sync_timeout 1 @ 0x010e
f map.xreg0x02_bit0_set_and_clr 1 @ 0x0111
f map.ph_process_len_field 1 @ 0x0114
f map.main_loop_wut_event 1 @ 0x0117
f map.rc32k_do_cal 1 @ 0x011a
f map.main_loop_parse_cfg 1 @ 0x011d
f map.rx_start_dsp_unk_0xc182 1 @ 0x0120
f map.rx_packet_received 1 @ 0x0123
f map.set_pcon 1 @ 0x0126
f map.change_state_from_ezconfig 1 @ 0x0129
f map.rssi_above_thresh 1 @ 0x012c
f map.int0x0f_config_callback 1 @ 0x012f
f map.spi_unknown_cmd @ 0x0132
f map.fifo_raise_underflow_overflow_err 1 @ 0x0135
f map.rx_packet_invalid 1 @ 0x0138
f map.eint1_config_callback 1 @ 0x013b
f map.raise_postamble_detect 1 @ 0x013e
f map.usec_timer_unk_0xbd85 1 @ 0x0141
f map.rx_ph_start 1 @ 0x0144
f map.cmd_get_chip_status 1 @ 0x0147
f map.0x17_isr_finish 1 @ 0x014a
f map.cmd_offline_recal 1 @ 0x014d
f map.dsp_reg_r7_unk0xb371 1 @ 0x0150
f map.rc32k_set_source 1 @ 0x0153
f map.config_clk 1 @ 0x0156
f map.wut_check_low_batt 1 @ 0x015c
f map.fifo_rx_write_phase_sample @ 0x015f
f map.rx_start_dsp_reg_r7_unk_0xc0f5 1 @ 0x0162
f map.cmd_ircal 1 @ 0x0165
f map.cmd_get_property 1 @ 0x0168
f map.fifo_rx_reset_hw 1 @ 0x016b
f map.change_state_from_rx_idle 1 @ 0x016e
f map.fifo_rx_write_byte 1 @ 0x0171
f map.override_pa_sel 1 @ 0x0174
f map.config_cmd_unk0x11 1 @ 0x017a
f map.cmd_part_info 1 @ 0x017d
f map.dsp_set_0x03_0x58_from_cache_set_0x87_to_0x02 1 @ 0x0180
f map.vco_calibration 1 @ 0x183
f map.rx_process_byte_b 1 @ 0x0186
f map.raise_sync_detect 1 @ 0x0189
f map.config_from_nvram 1 @ 0x018c
f map.tx_ph_start 1 @ 0x018f
f map.raise_preamble_detect 1 @ 0x0192
f map.spi_parse_more_cmds 1 @ 0x0195
f map.radio_spi_active_to_ready 1 @ 0x0198
f map.config_dsa_ctrl2 1 @ 0x19b
f map.cmd_ircal_manual 1 @ 0x019e
f map.ircal_calibration_step 1 @ 0x01a1
f map.power_up_entry 1 @ 0x01a4
f map.config_from_ezconfig 1 @ 0x01a7
f map.gpio_state_clr_r7_set_r5_toggle_r3 1 @ 0x01aa
f map.cmd_func_info 1 @ 0x01ad
f map.change_from_tx_tune 1 @ 0x01b0
f map.pti_send_curr_state 1 @ 0x01b3
f map.rc32k_cal_unk0xb16e 1 @ 0x01b6
f map.modem_isr_arrivingdet 1 @ 0x01b9
f map.config_modem_etsi 1 @ 0x01bc
f map.rx_ph_isr_preamble_detected 1 @ 0x01bf
f map.modem_start_rx 1 @ 0x01c2
f map.reset_finish 1 @ 0x01c5
f map.rx_ph_isr_sync_detected 1 @ 0x01c8
f map.modem_start_unk0xb560 1 @ 0x01cb
f map.change_state_from_spi_active 1 @ 0x01ce
f map.group_id_to_index 1 @ 0x01d1
f map.adc_unk0xc7c3 1 @ 0x01d7
f map.save_flags_26 1 @ 0x01da
f map.flag0x28_processing 1 @ 0x01dd
f map.clear_int_pending_flags 1 @ 0x01e0
f map.change_from_rx_tune 1 @ 0x01e3
f map.rx_ph_init 1 @ 0x01e6
f map.clear_int_modem_rssi 1 @0x01e9
f map.rssi_timer_config 1 @ 0x01ec
f map.pa_dig_pwr_sequencing 1 @ 0x01ef
f map.modem_start_tx 1 @ 0x01f2
f map.rc32k_cal_unk0xb230 1 @ 0x01f5
f map.rx_start 1 @ 0x01f8
f map.ircal_set_cal_val_r7 1 @ 0x01fb
f map.modem_set_frequency 1 @ 0x01fe

f map.tx_ph_send_frame 1 @ 0x0201
f map.tx_raw_send_frame 1 @ 0x0204
f map.rc32k_xreg0xe5_write_r7_xreg0xe6_write_0 1 @ 0x0207
f map.dsp_config_reg_0x06 1 @ 0x020a
f map.modem_isr_rfpd 1 @ 0x020d
f map.rc32k_cal_unk0xb2d2 @ 0x0210
f map.main_loop_unknown_cmd 1 @ 0x0213
f map.cmd_set_property 1 @ 0x0216
f map.pkt_tx_unk_0xd512 1 @ 0x0219
f map.clk_wait_for_xo_ready 1 @ 0x021c
f map.fifo_rx_clear_almost_full 1 @ 0x021f
f map.tx_send_frame_size_r7 1 @ 0x0222
f map.cmd_fifo_info 1 @ 0x0225
f map.fifo_tx_update 1 @ 0x0228
f map.set_frr_var_r7_to_r5 1 @ 0x022b
f map.reset_callback 1 @ 0x022e
CCu hook for custom reset code @ 0x022e
f map.rx_ph_filter 1 @ 0x0231
f map.rc32k_calibrate 1 @ 0x0234
f map.invalid_prop_group_set 1 @ 0x237
f map.modem_isr_sync_timeout 1 @ 0x023a
f map.ircal_perform_calibration 1 @ 0x0240
f map.adc_acquisition 1 @ 0x0249
f map.main_loop 1 @ 0x024f
f map.pti_send_r7 1 @ 0x0252
f map.config_run_r7 1 @ 0x0255
f map.cmd_gpio_pin_config 1 @ 0x0258
f map.gpio_state_set_r7 1 @ 0x025b
f map.clk_bufclk_unk0xba0d 1 @ 0x025e
f map.main_loop_bit7_event 1 @ 0x0261
f map.cmd_request_device_state 1 @ 0x0264
f map.rx_ph_isr_pkt_end 1 @ 0x0267
f map.fifo_tx_reset_hw 1 @ 0x0270
f map.pkt_tx_unk_0xd5c5 1 @ 0x0273
f map.change_from_rx 1 @ 0x0276
f map.main_loop_change_state 1 @ 0x0279
f map.config_modem_chflt 1 @ 0x027c
f map.config_preamble_timeout @ 0x0282
f map.modem_isr_preamble_timeout 1 @ 0x0285
f map.reset_entry 1 @ 0x028b
f map.eint1_pause 1 @ 0x028e
f map.wut_set_mantissa_r5r7 1 @ 0x0291
f map.tx_sequencer_mode_delay 1 @ 0x0297
f map.change_state_from_ready 1 @ 0x029a
f map.change_from_spi_active_to_ezconfig 1 @ 0x029d
f map.config_modem_clkgen_band 1 @ 0x02a0
f map.config_radio_extra_steps 1 @ 0x02a3
f map.pti_send_rx_info 1 @ 0x02a6
f map.main_loop_bit7_cmd1_2 @ 0x02a9
f map.change_device_state 1 @ 0x02ac
f map.cmd_tx_hop 1 @ 0x02b2
f map.cmd_get_int_status 1 @ 0x02b5
f map.cmd_get_modem_status 1 @ 0x02b8
f map.ph_pkt_len_adjust 1 @0x02bb
f map.cmd_start_rx 1 @ 0x02be
f map.cmd_start_tx 1 @ 0x02c1
f map.rx_nextstate_remain 1 @ 0x02c4
f map.cmd_rx_hop 1 @ 0x02c7
f map.nop_0xd251 1 @ 0x02ca
f map.ezconfig_decrypt_byte 1 @ 0x02cd
f map.spi_parse_cmds 1 @ 0x02d0
f map.cmd_ezconfig_check 1 @ 0x02d3
f map.pkt_tx_unk_0xd5b1 1 @ 0x02d6
f map.ezconfig_set_property 1 @ 0x02d9
f map.cmd_packet_info 1 @ 0x02dc
f map.cmd_change_state 1 @ 0x02df
f map.rx_hop_trigger 1 @ 0x02e2
f map.cmd_get_ph_status 1 @ 0x02e5
f map.ezconfig_array_read 1 @ 0x02e8

afu $$+3 @@s:0x0057 0x02eb 3

echo ..patches

.(fcn 0x02eb 0x0311 patch.timer0_handler)
axd xreg_base+0x0 @ 0x02f4
axd xreg_base+0x10 @ 0x02fc
.(fcn 0x0311 0x0330 patch.config_modem)
.(fcn 0x0330 0x0342 patch.config_dsa_ctrl2)
axd xreg_base+0xfa @ 0x033a
.(fcn 0x0342 0x0350 patch.config_cmd_unk0x01)
axd dsp_base+0x23 @ 0x034a
.(fcn 0x0350 0x0360 patch.reset_entry)
axd dsp_base+0x53 @ 0x0353
axd dsp_base+0x54 @ 0x0358
.(fcn 0x0360 0x036d patch.radio_spi_active_to_ready)
axd dsp_base+0x53 @ 0x0366
.(fcn 0x036d 0x0376 patch.tx_start)
axd dsp_base+0x21 @ 0x036d
.(fcn 0x0376 0x0382 patch.rx_start)
.(fcn 0x0382 0x0390 patch.enter_sleep_state)
axd dsp_base+0x54 @ 0x0382
axd dsp_base+0x54 @ 0x038b
.(fcn 0x0390 0x039d patch.change_state_from_spi_active)
.(fcn 0x039d 0x03a9 patch.usec_delay_unk_0xbda1)
.(fcn 0x03a9 0x03b2 patch.fifo_rx_write_byte)
.(fcn 0x03bf 0x03c5 patch.check_thresh_at_latch)
.(fcn 0x03c5 0x03dc patch.modem_start_rx)
.(fcn 0x03dc 0x03fb patch.reset_finish)
axd 0x5121 @ 0x03e5
axd 0x5122 @ 0x03e9
axd 0x5123 @ 0x03ed
.(fcn 0x03fb 0x0403 patch.rx_ph_start)
.(fcn 0x0403 0x0412 patch.tx_ph_start)
axd xreg_base+0xd8 @ 0x0408
.(fcn 0x0412 0x0421 patch.change_state_from_ezconfig)
.(fcn 0x0421 0x0427 patch.pti_send_rx_info)
.(fcn 0x0427 0x043e patch.config_modem_chflt)
axd xreg_base+0x1b @ 0x0430
.(fcn 0x043e 0x044e patch.cmd_start_tx)
.(fcn 0x044e 0x0454 patch.rx_hop_trigger)
.(fcn 0x0454 0x0466 patch.ezconfig_array_read)
.(fcn 0x0488 0x049c hack.memory_dump)

# run r2 analysis

echo analyzing references

aar 0x560 @ 0
aar 0x8000 @ 0x8000

echo looking for rogue functions
afl~-\>
