# Si4362 C0 register definitions auto-generated from WDS
f dsp_base 1 @ 0x7000
Cd 1 0x100 @ 0x7000
f xreg_base 1 @ 0x5000
Cd 1 0x100 @ 0x5000
f xreg2_base 1 @ 0x5100
Cd 1 0x100 @ 0x5100

f dsp.xosc_calcode 1 @ dsp_base+0x00
CCu 5:clk_en_clkbuf 4:calcode[4] 3:calcode[3] 2:calcode[2] 1:calcode[1] 0:calcode[0] @ dsp_base+0x00
f dsp.xosc_cfg 1 @ dsp_base+0x01
CCu 7:xo_vpk[3] 6:xo_vpk[2] 5:xo_vpk[1] 4:xo_vpk[0] 3:clk_en_dig[3] 2:clk_en_adc[2] 1:clk_en_pll[1] 0:clk_en_lna[0] @ dsp_base+0x01
f dsp.xosc_cap 1 @ dsp_base+0x02
CCu 7:xo_cap[7] 6:xo_cap[6] 5:xo_cap[5] 4:xo_cap[4] 3:xo_cap[3] 2:xo_cap[2] 1:xo_cap[1] 0:xo_cap[0] @ dsp_base+0x02
f dsp.vtr_sy_load_aconfig0 1 @ dsp_base+0x03
CCu 5:cal[5] 4:cal[4] 3:cal[3] 2:cal[2] 1:cal[1] 0:cal[0] @ dsp_base+0x03
f dsp.vtr_sy_load_aconfig1 1 @ dsp_base+0x04
CCu 1:tempco_c[0] 0:tempco_c[0] @ dsp_base+0x04
f dsp.vtr_sy_load_aconfig2 1 @ dsp_base+0x05
CCu 2:tempco_f[2] 1:tempco_f[1] 0:tempco_f[0] @ dsp_base+0x05
f dsp.reg_fbdiv_load_acfg_anareg 1 @ dsp_base+0x06
CCu 7:trim[3] 6:trim[2] 5:trim[1] 4:trim[0] 3:en_min_load 2:fine[2] 1:fine[1] 0:fine[0] @ dsp_base+0x06
f dsp.reg_cplf_load_acfg_anareg 1 @ dsp_base+0x07
CCu 7:trim[3] 6:trim[2] 5:trim[1] 4:trim[0] 3:en_min_load 2:fine[2] 1:fine[1] 0:fine[0] @ dsp_base+0x07
f dsp.reg_clkgen_load_acfg_anareg 1 @ dsp_base+0x08
CCu 7:trim[3] 6:trim[2] 5:trim[1] 4:trim[0] 3:en_min_load 2:fine[2] 1:fine[1] 0:fine[0] @ dsp_base+0x08
f dsp.fbdiv_load_acfg0 1 @ dsp_base+0x09
CCu 2:dis_dsmck 1:narrow 0:sy_sel @ dsp_base+0x09
f dsp.pfdcp_config0 1 @ dsp_base+0x0a
CCu 6:cp_ff_cur [6] 5:cp_ff_cur [5] 4:cp_ff_cur [4] 3:cp_ff_cur [3] 2:cp_ff_cur [2] 1:cp_ff_cur [1] 0:cp_ff_cur [0] @ dsp_base+0x0a
f dsp.pfdcp_config1 1 @ dsp_base+0x0b
CCu 3:cp_int_cur [3] 2:cp_int_cur [2] 1:cp_int_cur [1] 0:cp_int_cur [0] @ dsp_base+0x0b
f dsp.lpfilt_load_acfg_lpfilt0 1 @ dsp_base+0x0c
CCu 1:lpf_ff_bias[1] 0:lpf_ff_bias[0] @ dsp_base+0x0c
f dsp.lpfilt_load_acfg_lpfilt1 1 @ dsp_base+0x0d
CCu 6:lpf_ff_c1_bit[2] 5:lpf_ff_c1_bit[1] 4:lpf_ff_c1_bit[0] 3:lpf_ff_c1_code[1] 2:lpf_ff_c1_code[0] 1:lpf_ff_c3_bit[1] 0:lpf_ff_c3_bit[0] @ dsp_base+0x0d
f dsp.lpfilt_load_acfg_lpfilt2 1 @ dsp_base+0x0e
CCu 4:lpf_ff_c2_bit[4] 3:lpf_ff_c2_bit[3] 2:lpf_ff_c2_bit[2] 1:lpf_ff_c2_bit[1] 0:lpf_ff_c2_bit[0] @ dsp_base+0x0e
f dsp.lpfilt_load_acfg_lpfilt3 1 @ dsp_base+0x0f
CCu 3:lpf_ff_r2_bit[3] 2:lpf_ff_r2_bit[2] 1:lpf_ff_r2_bit[1] 0:lpf_ff_r2_bit[0] @ dsp_base+0x0f
f dsp.vco_load_acfg0 1 @ dsp_base+0x10
CCu 3:kv_min 2:ladr_select 1:kv_dir_opnlop 0:kv_int_opnlop @ dsp_base+0x10
f dsp.vco_load_acfg1 1 @ dsp_base+0x11
CCu 3:kvcal[3] 2:kvcal[2] 1:kvcal[1] 0:kvcal[0] @ dsp_base+0x11
f dsp.vco_load_acfg2 1 @ dsp_base+0x12
CCu 2:vtn_tune[2] 1:vtn_tune[1] 0:vtn_tune[0] @ dsp_base+0x12
f dsp.vco_load_acfg3 1 @ dsp_base+0x13
CCu 6:r_vtp_tune[6] 5:r_vtp_tune[5] 4:r_vtp_tune[4] 3:r_vtp_tune[3] 2:r_vtp_tune[2] 1:r_vtp_tune[1] 0:r_vtp_tune[0] @ dsp_base+0x13
f dsp.vco_load_acfg4 1 @ dsp_base+0x14
CCu 6:r_vtp_tune_ladr[6] 5:r_vtp_tune_ladr[5] 4:r_vtp_tune_ladr[4] 3:r_vtp_tune_ladr[3] 2:r_vtp_tune_ladr[2] 1:r_vtp_tune_ladr[1] 0:r_vtp_tune_ladr[0] @ dsp_base+0x14
f dsp.vco_load_acfg5 1 @ dsp_base+0x15
CCu 1:r_iref_tune[1] 0:r_iref_tune[0] @ dsp_base+0x15
f dsp.vco_load_acfg6 1 @ dsp_base+0x16
CCu 3:kv_dir[1] 2:kv_dir[0] 1:kv_int[1] 0:kv_int[0] @ dsp_base+0x16
f dsp.vco_load_acfg7 1 @ dsp_base+0x17
CCu 3:v1p5_calcode[3] 2:v1p5_calcode[2] 1:v1p5_calcode[1] 0:v1p5_calcode[0] @ dsp_base+0x17
f dsp.clkgen_load_acfg0 1 @ dsp_base+0x18
CCu 7:ovrwrt 1:mode[1] 0:mode[0] @ dsp_base+0x18
f dsp.clkgen_load_acfg1 1 @ dsp_base+0x19
CCu 7:ovrwrt_fcal 3:fcal_en_acfg 2:clr_fcal 1:send_fcal 0:run_fcal @ dsp_base+0x19
f dsp.clkgen_load_acfg2 1 @ dsp_base+0x1a
CCu 5:txclk_ctrl[1] 4:txclk_ctrl[0] 3:sy_sel 2:band[2] 1:band[1] 0:band[0] @ dsp_base+0x1a
f dsp.vtr_rx_load_aconfig0 1 @ dsp_base+0x1b
CCu 5:cal[5] 4:cal[4] 3:cal[3] 2:cal[2] 1:cal[1] 0:cal[0] @ dsp_base+0x1b
f dsp.vtr_rx_load_aconfig1 1 @ dsp_base+0x1c
CCu 1:tempco_c[1] 0:tempco_c[0] @ dsp_base+0x1c
f dsp.vtr_rx_load_aconfig2 1 @ dsp_base+0x1d
CCu 2:tempco_f[2] 1:tempco_f[1] 0:tempco_f[0] @ dsp_base+0x1d
f dsp.reg_rxfe_load_acfg_anareg 1 @ dsp_base+0x1e
CCu 7:trim[3] 6:trim[2] 5:trim[1] 4:trim[0] 3:en_min_load 2:fine[2] 1:fine[1] 0:fine[0] @ dsp_base+0x1e
f dsp.reg_adc_load_acfg_anareg 1 @ dsp_base+0x1f
CCu 7:trim[3] 6:trim[2] 5:trim[1] 4:trim[0] 3:en_min_load 2:fine[2] 1:fine[1] 0:fine[0] @ dsp_base+0x1f
f dsp.lna_gaincfg 1 @ dsp_base+0x20
CCu 3:gain_ovr 2:gaincfg[2] 1:gaincfg[1] 0:gaincfg[0] @ dsp_base+0x20
f dsp.lna_config 1 @ dsp_base+0x21
CCu 4:gnd_ovr 3:dpa 2:dtie 1:ngnd 0:pgnd @ dsp_base+0x21
f dsp.lna_bias 1 @ dsp_base+0x22
CCu 7:ircal 6:irclkdiv 5:pw[1] 4:pw[0] 3:bcurr[3] 2:bcurr[2] 1:bcurr[1] 0:bcurr[0] @ dsp_base+0x22
f dsp.mix_cntrl 1 @ dsp_base+0x23
CCu 7:pdlo 6:hvcm 5:cml 4:etsi 3:ibias[3] 2:ibias[2] 1:ibias[1] 0:ibias[0] @ dsp_base+0x23
f dsp.mix_dcoc 1 @ dsp_base+0x24
CCu 7:qc[3] 6:qc[2] 5:qc[1] 4:qc[0] 3:ic[3] 2:ic[2] 1:ic[1] 0:ic[0] @ dsp_base+0x24
f dsp.pga_pga_gain 1 @ dsp_base+0x25
CCu 7:gain_ovr 2:gain[2] 1:gain[1] 0:gain[0] @ dsp_base+0x25
f dsp.pga_pga_conf1 1 @ dsp_base+0x26
CCu 6:boost 5:lpm 4:iofs[4] 3:iofs[3] 2:iofs[2] 1:iofs[1] 0:iofs[0] @ dsp_base+0x26
f dsp.pga_pga_conf2 1 @ dsp_base+0x27
CCu 6:lpf[1] 5:lpf[0] 4:qofs[4] 3:qofs[3] 2:qofs[2] 1:qofs[1] 0:qofs[0] @ dsp_base+0x27
f dsp.adc_adc_ctrl 1 @ dsp_base+0x28
CCu 5:force_lgain 4:hgain 3:en_drst 2:lowpower 1:realadc 0:adcrst @ dsp_base+0x28
f dsp.adc_vtr_cal 1 @ dsp_base+0x29
CCu 5:vtr_cal[5] 4:vtr_cal[4] 3:vtr_cal[3] 2:vtr_cal[2] 1:vtr_cal[1] 0:vtr_cal[0] @ dsp_base+0x29
f dsp.adc_adc_cal 1 @ dsp_base+0x2a
CCu 4:adc_cal[4] 3:adc_cal[3] 2:adc_cal[2] 1:adc_cal[1] 0:adc_cal[0] @ dsp_base+0x2a
f dsp.rfpkd_cal_ctrl 1 @ dsp_base+0x2b
CCu 3:cal1 2:cal0 1:encal 0:encmp @ dsp_base+0x2b
f dsp.rfpkd_ocal0 1 @ dsp_base+0x2c
CCu 5:ocal0[5] 4:ocal0[4] 3:ocal0[3] 2:ocal0[2] 1:ocal0[1] 0:ocal0[0] @ dsp_base+0x2c
f dsp.rfpkd_ocal1 1 @ dsp_base+0x2d
CCu 5:ocal1[5] 4:ocal1[4] 3:ocal1[3] 2:ocal1[2] 1:ocal1[1] 0:ocal1[0] @ dsp_base+0x2d
f dsp.rfpkd_ocal2 1 @ dsp_base+0x2e
CCu 5:ocal2[5] 4:ocal2[4] 3:ocal2[3] 2:ocal2[2] 1:ocal2[1] 0:ocal2[0] @ dsp_base+0x2e
f dsp.rfpkd_ocal3 1 @ dsp_base+0x2f
CCu 5:ocal3[5] 4:ocal3[4] 3:ocal3[3] 2:ocal3[2] 1:ocal3[1] 0:ocal3[0] @ dsp_base+0x2f
f dsp.rfpkd_thresholds 1 @ dsp_base+0x30
CCu 7:thH_etsi 6:thL_etsi 5:thh[2] 4:thh[1] 3:thh[0] 2:thl[2] 1:thl[1] 0:thl[0] @ dsp_base+0x30
f dsp.ifpkd_control 1 @ dsp_base+0x31
CCu 5:mode 4:sela 3:selb 2:enhc 1:encmp 0:hyst @ dsp_base+0x31
f dsp.ifpkd_thresholds 1 @ dsp_base+0x32
CCu 7:thh[3] 6:thh[2] 5:thh[1] 4:thh[0] 3:thl[3] 2:thl[2] 1:thl[1] 0:thl[0] @ dsp_base+0x32
f dsp.txramp_load_acfg 1 @ dsp_base+0x33
CCu 7:vset[3] 6:vset[2] 5:vset[1] 4:vset[0] 3:tc[3] 2:tc[2] 1:tc[1] 0:tc[0] @ dsp_base+0x33
f dsp.vtr_tx_load_aconfig0 1 @ dsp_base+0x34
CCu 5:cal[5] 4:cal[4] 3:cal[3] 2:cal[2] 1:cal[1] 0:cal[0] @ dsp_base+0x34
f dsp.vtr_tx_load_aconfig1 1 @ dsp_base+0x35
CCu 1:tempco_c[1] 0:tempco_c[0] @ dsp_base+0x35
f dsp.vtr_tx_load_aconfig2 1 @ dsp_base+0x36
CCu 2:tempco_f[2] 1:tempco_f[1] 0:tempco_f[0] @ dsp_base+0x36
f dsp.reg_tx1_load_acfg_txreg 1 @ dsp_base+0x37
CCu 7:trim[3] 6:trim[2] 5:trim[1] 4:trim[0] 3:en_min_load 2:fine[2] 1:fine[1] 0:fine[0] @ dsp_base+0x37
f dsp.reg_tx2_load_acfg_txreg 1 @ dsp_base+0x38
CCu 7:trim[3] 6:trim[2] 5:trim[1] 4:trim[0] 3:en_min_load 2:fine[2] 1:fine[1] 0:fine[0] @ dsp_base+0x38
f dsp.pa_ddac 1 @ dsp_base+0x39
CCu 6:ddac[6] 5:ddac[5] 4:ddac[4] 3:ddac[3] 2:ddac[2] 1:ddac[1] 0:ddac[0] @ dsp_base+0x39
f dsp.pa_pda 1 @ dsp_base+0x3a
CCu 5:pda[5] 4:pda[4] 3:pda[3] 2:pda[2] 1:pda[1] 0:pda[0] @ dsp_base+0x3a
f dsp.pa_pdo 1 @ dsp_base+0x3b
CCu 5:pdo[5] 4:pdo[4] 3:pdo[3] 2:pdo[2] 1:pdo[1] 0:pdo[0] @ dsp_base+0x3b
f dsp.pa_rmsdet 1 @ dsp_base+0x3c
CCu 7:apc_tc[3] 6:apc_tc[2] 5:apc_tc[1] 4:apc_tc[0] 3:apc_adet_mode 2:apc_rmsdet_a 0:edrive @ dsp_base+0x3c
f dsp.pa_apc_ref 1 @ dsp_base+0x3d
CCu 7:apc_refset[4] 6:apc_refset[3] 5:apc_refset[2] 4:apc_refset[1] 3:apc_refset[0] 2:apc_refos[2] 1:apc_refos[1] 0:apc_refos[0] @ dsp_base+0x3d
f dsp.pa_enables 1 @ dsp_base+0x3e
CCu 7:no_ramp_hold 6:pd_apc 5:clkpass 4:odev_bias_vlv 3:odev_bias_dio 2:odev_bias_fb 1:apc_ook_dead_off 0:cas_ook_dead_on @ dsp_base+0x3e
f dsp.pa_apc_mode 1 @ dsp_base+0x3f
CCu 7:sns_en 5:apc_cint 4:apc_pre_adet_gain 3:apc_gain2 2:apc_dbfs[2] 1:apc_dbfs[1] 0:apc_dbfs[0] @ dsp_base+0x3f
f dsp.pa_ob 1 @ dsp_base+0x40
CCu 7:vcas[1] 6:vcas[0] 5:ob[5] 4:ob[4] 3:ob[3] 2:ob[2] 1:ob[1] 0:ob[0] @ dsp_base+0x40
f dsp.pa_esd 1 @ dsp_base+0x41
CCu 7:esd_pdbot 6:esd_cason 5:flagrst 4:pdovflag 3:flagvth[3] 2:flagvth[2] 1:flagvth[1] 0:flagvth[0] @ dsp_base+0x41
f dsp.pa_sc 1 @ dsp_base+0x42
CCu 5:sc[5] 4:sc[4] 3:sc[3] 2:sc[2] 1:sc[1] 0:sc[0] @ dsp_base+0x42
f dsp.pa_ovclamp 1 @ dsp_base+0x43
CCu 7:pd_ov_clamp 3:ovc_th[3] 2:ovc_th[2] 1:ovc_th[1] 0:ovc_th[0] @ dsp_base+0x43
f dsp.pa_capcode 1 @ dsp_base+0x44
CCu 4:capcode[4] 3:capcode[3] 2:capcode[2] 1:capcode[1] 0:capcode[0] @ dsp_base+0x44
f dsp.pa_rescode 1 @ dsp_base+0x45
CCu 4:rescode[4] 3:rescode[3] 2:rescode[2] 1:rescode[1] 0:rescode[0] @ dsp_base+0x45
f dsp.pa_tc 1 @ dsp_base+0x46
CCu 4:tc[4] 3:tc[3] 2:tc[2] 1:tc[1] 0:tc[0] @ dsp_base+0x46
f dsp.refcal_load_aconfig_refca 1 @ dsp_base+0x47
CCu 7:v_adc 5:divider[5] 4:divider[4] 3:divider[3] 2:divider[2] 1:divider[1] 0:divider[0] @ dsp_base+0x47
f dsp.cpotp_cp_control 1 @ dsp_base+0x48
CCu 7:valid[3] 6:valid[2] 5:valid[1] 4:valid[0] 3:vddio[3] 2:vddio[2] 1:vddio[1] 0:vddio[0] @ dsp_base+0x48
f dsp.lbd_load_aconfig0 1 @ dsp_base+0x49
CCu 4:threshold[4] 3:threshold[3] 2:threshold[2] 1:threshold[1] 0:threshold[0] @ dsp_base+0x49
f dsp.lbd_load_aconfig1 1 @ dsp_base+0x4a
CCu 2:trim[2] 1:trim[1] 0:trim[0] @ dsp_base+0x4a
f dsp.auxadc_con0 1 @ dsp_base+0x4b
CCu 7:sel_input[2] 6:sel_input[1] 5:sel_input[0] 4:sel_ref[2] 3:sel_ref[1] 2:sel_ref[0] 1:sel_ibias 0:vbat_byp @ dsp_base+0x4b
f dsp.auxadc_con1 1 @ dsp_base+0x4c
CCu 7:att0[1] 6:att0[0] 5:vbat_att1[1] 4:vbat_att1[0] 3:vbat_att2[1] 2:vbat_att2[0] 1:en_fast 0:vbat_track @ dsp_base+0x4c
f dsp.xo32k_load_acfg 1 @ dsp_base+0x4d
CCu 2:forcestart 1:locurr 0:hicurr @ dsp_base+0x4d
f dsp.rc32k_load_acfg0 1 @ dsp_base+0x4e
CCu 4:dc[4] 3:dc[3] 2:dc[2] 1:dc[1] 0:dc[0] @ dsp_base+0x4e
f dsp.rc32k_load_acfg1 1 @ dsp_base+0x4f
CCu 6:df[6] 5:df[5] 4:df[4] 3:df[3] 2:df[2] 1:df[1] 0:df[0] @ dsp_base+0x4f
f dsp.rc32k_load_acfg2 1 @ dsp_base+0x50
CCu 4:forcestart 3:sync_finecal 2:fastsettle 1:hicurr 0:chop @ dsp_base+0x50
f dsp.bg_dig_load_acfg_bg 1 @ dsp_base+0x51
CCu 3:trim[3] 2:trim[2] 1:trim[1] 0:trim[0] @ dsp_base+0x51
f dsp.reg_ram_load_acfg_ramreg 1 @ dsp_base+0x52
CCu 7:trim[3] 6:trim[2] 5:trim[1] 4:trim[0] 3:en_min_load 2:fine[2] 1:fine[1] 0:fine[0] @ dsp_base+0x52
f dsp.reg_dig_load_acfg_digreg 1 @ dsp_base+0x53
CCu 7:trim[3] 6:trim[2] 5:trim[1] 4:trim[0] 3:en_min_load 2:fine[2] 1:fine[1] 0:fine[0] @ dsp_base+0x53
f dsp.bosc_load_acfg0 1 @ dsp_base+0x54
CCu 3:fosc[3] 2:fosc[2] 1:fosc[1] 0:fosc[0] @ dsp_base+0x54
f dsp.clkbuf_divider_setting 1 @ dsp_base+0x55
CCu 7:div_mode[1] 6:div_mode[0] 5:divx_set[3] 4:divx_set[2] 3:divx_set[1] 2:divx_set[0] 1:div_reset 0:pdbias @ dsp_base+0x55
f dsp.clkbuf_driver_setting 1 @ dsp_base+0x56
CCu 7:drv_mode[1] 6:drv_mode[0] 5:Idrv_set[2] 4:Idrv_set[1] 3:Idrv_set[0] 2:vgain[2] 1:vgain[1] 0:vgain[0] @ dsp_base+0x56
f dsp.clkbuf_offset_setting 1 @ dsp_base+0x57
CCu 7:pd_south 6:phase_flip 5:gpio_on 4:offset[4] 3:offset[3] 2:offset[2] 1:offset[1] 0:offset[0] @ dsp_base+0x57
f dsp.xosc_load_testa 1 @ dsp_base+0x80
CCu 2:testa[2] 1:testa[1] 0:testa[0] @ dsp_base+0x80
f dsp.vtr_sy_load_testa_vtr 1 @ dsp_base+0x81
CCu 4:testa_n2 3:testa_st 2:testa_pcas 1:testa_pgate 0:testa_vcal @ dsp_base+0x81
f dsp.reg_fbdiv_load_testa_anareg 1 @ dsp_base+0x82
CCu 3:slice 2:vref 1:vfb 0:vreg_ana @ dsp_base+0x82
f dsp.reg_cplf_load_testa_anareg 1 @ dsp_base+0x83
CCu 3:slice 2:vref 1:vfb 0:vreg_ana @ dsp_base+0x83
f dsp.reg_clkgen_load_testa_anareg 1 @ dsp_base+0x84
CCu 3:slice 2:vref 1:vfb 0:vreg_ana @ dsp_base+0x84
f dsp.pfdcp_test_config2 1 @ dsp_base+0x86
CCu 7:force_cp_ff_up 6:force_cp_ff_dn 5:tristate_cp_ff 4:force_cp_int_up 3:force_cp_int_dn 2: tristate_cp_int 1:conn_i_up 0:conn_i_dn @ dsp_base+0x86
f dsp.pfdcp_test_config3 1 @ dsp_base+0x87
CCu 1:refclk_edgeb 0:test_cur_cp @ dsp_base+0x87
f dsp.lpfilt_load_testa_lpfilt 1 @ dsp_base+0x88
CCu 3:en_diaga_out 2:en_diaga_in 1:en_lpf_int_diaga 0:en_lpf_ff_diaga @ dsp_base+0x88
f dsp.vco_load_testa_vco 1 @ dsp_base+0x89
CCu 5:en_diaga_vdc1p5 4:en_diaga_vladr 3:en_diaga_vreg_vco 2:en_diaga_ivco 1:en_diaga_ivco_indiode 0:en_diaga_iext_indiode @ dsp_base+0x89
f dsp.vtr_rx_load_testa_vtr 1 @ dsp_base+0x8b
CCu 4:testa_n2 3:testa_st 2:testa_pcas 1:testa_pgate 0:testa_vcal @ dsp_base+0x8b
f dsp.reg_rxfe_load_testa_anareg 1 @ dsp_base+0x8c
CCu 3:slice 2:vref 1:vfb 0:vreg_ana @ dsp_base+0x8c
f dsp.reg_adc_load_testa_anareg 1 @ dsp_base+0x8d
CCu 3:slice 2:vref 1:vfb 0:vreg_ana @ dsp_base+0x8d
f dsp.lna_test 1 @ dsp_base+0x8e
CCu 1:testa_nbias 0:testa_pbias @ dsp_base+0x8e
f dsp.mix_testa 1 @ dsp_base+0x8f
CCu 6:t_vlo 5:t_pg 4:t_ng 3:t_icgm 2:t_gmcm 1:t_cmi 0:t_cmq @ dsp_base+0x8f
f dsp.pga_pga_test 1 @ dsp_base+0x90
CCu 3:ta_iopa_q 2:ta_ovcm_q 1:ta_iopa_i 0:ta_ovcm_i @ dsp_base+0x90
f dsp.pga_pga_test_diff 1 @ dsp_base+0x91
CCu 7:tpn_inp_q 6:tpn_inn_q 5:tpn_outp_q 4:tpn_outn_q 3:tpn_inp_i 2:tpn_inn_i 1:tpn_outp_i 0:tpn_outn_i @ dsp_base+0x91
f dsp.adc_vtr_test 1 @ dsp_base+0x92
CCu 6:vtrcal 5:tc[5] 4:tc[4] 3:tc[3] 2:tc[2] 1:tc[1] 0:tc[0] @ dsp_base+0x92
f dsp.adc_adc_test 1 @ dsp_base+0x93
CCu 7:selad[3] 6:selad[2] 5:selad[1] 4:selad[0] 3:bias_ovr 2:biast[2] 1:biast[1] 0:biast[0] @ dsp_base+0x93
f dsp.rfpkd_test 1 @ dsp_base+0x94
CCu 1:gnsth 0:gnstl @ dsp_base+0x94
f dsp.rcal_load_testa_rcal 1 @ dsp_base+0x97
CCu 4:en_diaga 3:rcal[3] 2:rcal[2] 1:rcal[1] 0:rcal[0] @ dsp_base+0x97
f dsp.vtr_tx_load_testa_vtr 1 @ dsp_base+0x98
CCu 4:testa_n2 3:testa_st 2:testa_pcas 1:testa_pgate 0:testa_vcal @ dsp_base+0x98
f dsp.reg_tx1_load_testa_txreg 1 @ dsp_base+0x99
CCu 3:slice 2:vref 1:vfb 0:vreg_ana @ dsp_base+0x99
f dsp.reg_tx2_load_testa_txreg 1 @ dsp_base+0x9a
CCu 3:slice 2:vref 1:vfb 0:vreg_ana @ dsp_base+0x9a
f dsp.pa_apc_diaga 1 @ dsp_base+0x9b
CCu 7:ad_mute 6:ad_adrvcm 5:ad_pclamp 4:ad_gatebias 3:ad_idac 2:ad_irmsn 1:ad_iref 0:ad_irmsp @ dsp_base+0x9b
f dsp.pa_bias_diaga 1 @ dsp_base+0x9c
CCu 7:bd_ognd 6:bd_adrv2 5:bd_cgnd 4:bd_adrv0 3:bd_tgnd 2:bd_lowbat 1:bd_vcas 0:bd_v0p4 @ dsp_base+0x9c
f dsp.refcal_load_testa_refcal 1 @ dsp_base+0x9e
CCu 4:testa_adcref 3:testa_supn 2:testa_inn 1:testa_vptat 0:testa_vbg @ dsp_base+0x9e
f dsp.cpotp_load_testa_cp 1 @ dsp_base+0x9f
CCu 3:tst_pump_filt 2:tst_vddio 1:tst_vfbhr 0:tst_vfblr @ dsp_base+0x9f
f dsp.lbd_load_testa_anareg 1 @ dsp_base+0xa0
CCu 2:comp_out 1:v_div 0:v1p0 @ dsp_base+0xa0
f dsp.auxadc_test 1 @ dsp_base+0xa1
CCu 3:testa[3] 2:testa[2] 1:testa[1] 0:testa[0] @ dsp_base+0xa1
f dsp.xo32k_load_testa 1 @ dsp_base+0xa2
CCu 5:locurrx 4:pdx 3:hicurrx 2:vdg1 1:vdg2 0:vout @ dsp_base+0xa2
f dsp.rc32k_load_testa 1 @ dsp_base+0xa3
CCu 3:hicurrx 2:chopb 1:fastsettlex 0:vr @ dsp_base+0xa3
f dsp.bg_dig_load_testa_bg 1 @ dsp_base+0xa4
CCu 1:ib_2p5ua[0] 0:ref_0p6v[0] @ dsp_base+0xa4
f dsp.reg_ram_load_testa_ramreg 1 @ dsp_base+0xa5
CCu 3:slice 2:vref 1:vfb 0:vreg_ana @ dsp_base+0xa5
f dsp.reg_dig_load_testa_digreg 1 @ dsp_base+0xa6
CCu 3:slice 2:vref 1:vfb 0:vreg_ana @ dsp_base+0xa6
f sfr.SP 1 @ _sfr+0x81
CCu 7:SP[7] 6:SP[6] 5:SP[5] 4:SP[4] 3:SP[3] 2:SP[2] 1:SP[1] 0:SP[0] @ _sfr+0x81
f sfr.DPL 1 @ _sfr+0x82
CCu 7:DPTR[7] 6:DPTR[6] 5:DPTR[5] 4:DPTR[4] 3:DPTR[3] 2:DPTR[2] 1:DPTR[1] 0:DPTR[0] @ _sfr+0x82
f sfr.DPH 1 @ _sfr+0x83
CCu 7:DPTR[15] 6:DPTR[14] 5:DPTR[13] 4:DPTR[12] 3:DPTR[11] 2:DPTR[10] 1:DPTR[9] 0:DPTR[8] @ _sfr+0x83
f sfr.SFR_PAGE 1 @ _sfr+0x84
CCu 0:SFR_PAGE @ _sfr+0x84
f sfr.MCU_ERR 1 @ _sfr+0x85
CCu 5:CPU_STOP 4:CPU_IDLE 3:MAERR[3] 2:MAERR[2] 1:MAERR[1] 0:MAERR[0] @ _sfr+0x85
f sfr.XPAGE 1 @ _sfr+0x86
CCu 7:XDATA[7] 6:XDATA[6] 5:XDATA[5] 4:XDATA[4] 3:XDATA[3] 2:XDATA[2] 1:XDATA[1] 0:XDATA[0] @ _sfr+0x86
f sfr.PCON 1 @ _sfr+0x87
CCu 2:CLKGATE_EN 1:STOP 0:IDLE @ _sfr+0x87
f sfr.MULT_A3 1 @ _sfr+0x88
CCu 7:mult_a[31] 6:mult_a[30] 5:mult_a[29] 4:mult_a[28] 3:mult_a[27] 2:mult_a[26] 1:mult_a[25] 0:mult_a[24] @ _sfr+0x88
f sfr.MULT_A2 1 @ _sfr+0x89
CCu 7:mult_a[23] 6:mult_a[22] 5:mult_a[21] 4:mult_a[20] 3:mult_a[19] 2:mult_a[18] 1:mult_a[17] 0:mult_a[16] @ _sfr+0x89
f sfr.MULT_A1 1 @ _sfr+0x8A
CCu 7:mult_a[15] 6:mult_a[14] 5:mult_a[13] 4:mult_a[12] 3:mult_a[11] 2:mult_a[10] 1:mult_a[9] 0:mult_a[8] @ _sfr+0x8A
f sfr.MULT_A0 1 @ _sfr+0x8B
CCu 7:mult_a[7] 6:mult_a[6] 5:mult_a[5] 4:mult_a[4] 3:mult_a[3] 2:mult_a[2] 1:mult_a[1] 0:mult_a[0] @ _sfr+0x8B
f sfr.MULT_B1 1 @ _sfr+0x8C
CCu 7:mult_b[15] 6:mult_b[14] 5:mult_b[13] 4:mult_b[12] 3:mult_b[11] 2:mult_b[10] 1:mult_b[9] 0:mult_b[8] @ _sfr+0x8C
f sfr.MULT_B0 1 @ _sfr+0x8D
CCu 7:mult_b[7] 6:mult_b[6] 5:mult_b[5] 4:mult_b[4] 3:mult_b[3] 2:mult_b[2] 1:mult_b[1] 0:mult_b[0] @ _sfr+0x8D
f sfr.T0CFG 1 @ _sfr+0x8E
CCu 7:T0CNT[11] 6:T0CNT[10] 5:T0CNT[9] 4:T0CNT[8] 2:T0DIV 1:T0RPT 0:T0EN @ _sfr+0x8E
f sfr.T0COUNT 1 @ _sfr+0x8F
CCu 7:T0CNT[7] 6:T0CNT[6] 5:T0CNT[5] 4:T0CNT[4] 3:T0CNT[3] 2:T0CNT[2] 1:T0CNT[1] 0:T0CNT[0] @ _sfr+0x8F
f sfr.MULT_CTRL 1 @ _sfr+0x90
CCu 1:mult_complete 0:mult_start @ _sfr+0x90
f sfr.T1CFG 1 @ _sfr+0x91
CCu 7:T1CNT[11] 6:T1CNT[10] 5:T1CNT[9] 4:T1CNT[8] 2:T1DIV 1:T1RPT 0:T1EN @ _sfr+0x91
f sfr.T1COUNT 1 @ _sfr+0x92
CCu 7:T1CNT[7] 6:T1CNT[6] 5:T1CNT[5] 4:T1CNT[4] 3:T1CNT[3] 2:T1CNT[2] 1:T1CNT[1] 0:T1CNT[0] @ _sfr+0x92
f sfr.ACFG_CTRL 1 @ _sfr+0x93
CCu 6:auto_load_en 5:load_length[1] 4:load_length[0] 0:acfg_load_en @ _sfr+0x93
f sfr.ACFG_ADDR 1 @ _sfr+0x94
CCu 7:acfg_addr[7] 6:acfg_addr[6] 5:acfg_addr[5] 4:acfg_addr[4] 3:acfg_addr[3] 2:acfg_addr[2] 1:acfg_addr[1] 0:acfg_addr[0] @ _sfr+0x94
f sfr.ACFG_DATA 1 @ _sfr+0x95
CCu 7:acfg_data[7] 6:acfg_data[6] 5:acfg_data[5] 4:acfg_data[4] 3:acfg_data[3] 2:acfg_data[2] 1:acfg_data[1] 0:acfg_data[0] @ _sfr+0x95
f sfr.DIAG_DIS 1 @ _sfr+0x96
CCu 2:diaga2_dis 1:diaga_dis 0:diagpn_dis @ _sfr+0x96
f sfr.BIT_SWAP 1 @ _sfr+0x97
CCu 7:swap[7] 6:swap[6] 5:swap[5] 4:swap[4] 3:swap[3] 2:swap[2] 1:swap[1] 0:swap[0] @ _sfr+0x97
f sfr.BPCTL 1 @ _sfr+0x99
CCu 7:BP7EN 6:BP6EN 5:BP5EN 4:BP4EN 3:BP3EN 2:BP2EN 1:BP1EN 0:BP0EN @ _sfr+0x99
f sfr.WPCTL 1 @ _sfr+0x9A
CCu 7:WPSEL[1] 6:WPSEL[0] 5:WPWRITE 4:WPEN @ _sfr+0x9A
f sfr.BPL0 1 @ _sfr+0x9B
CCu 7:BP0[7] 6:BP0[6] 5:BP0[5] 4:BP0[4] 3:BP0[3] 2:BP0[2] 1:BP0[1] 0:BP0[0] @ _sfr+0x9B
f sfr.BPH0 1 @ _sfr+0x9C
CCu 7:BP0[15] 6:BP0[14] 5:BP0[13] 4:BP0[12] 3:BP0[11] 2:BP0[10] 1:BP0[9] 0:BP0[8] @ _sfr+0x9C
f sfr.BPL1 1 @ _sfr+0x9D
CCu 7:BP1[7] 6:BP1[6] 5:BP1[5] 4:BP1[4] 3:BP1[3] 2:BP1[2] 1:BP1[1] 0:BP1[0] @ _sfr+0x9D
f sfr.BPH1 1 @ _sfr+0x9E
CCu 7:BP1[15] 6:BP1[14] 5:BP1[13] 4:BP1[12] 3:BP1[11] 2:BP1[10] 1:BP1[9] 0:BP1[8] @ _sfr+0x9E
f sfr.BPL2 1 @ _sfr+0x9F
CCu 7:BP2[7] 6:BP2[6] 5:BP2[5] 4:BP2[4] 3:BP2[3] 2:BP2[2] 1:BP2[1] 0:BP2[0] @ _sfr+0x9F
f sfr.BPH2 1 @ _sfr+0xA1
CCu 7:BP2[15] 6:BP2[14] 5:BP2[13] 4:BP2[12] 3:BP2[11] 2:BP2[10] 1:BP2[9] 0:BP2[8] @ _sfr+0xA1
f sfr.PCL 1 @ _sfr+0xA2
CCu 7:PC[7] 6:PC[6] 5:PC[5] 4:PC[4] 3:PC[3] 2:PC[2] 1:PC[1] 0:PC[0] @ _sfr+0xA2
f sfr.PCH 1 @ _sfr+0xA3
CCu 7:PC[15] 6:PC[14] 5:PC[13] 4:PC[12] 3:PC[11] 2:PC[10] 1:PC[9] 0:PC[8] @ _sfr+0xA3
f sfr.DSRFLG 1 @ _sfr+0xA4
CCu 7:HALT 6:ISTATE[2] 5:ISTATE[1] 4:ISTATE[0] 3:GP 2:BP 1:IRDY 0:ORDY @ _sfr+0xA4
f sfr.DSRH 1 @ _sfr+0xA5
CCu 7:DBDATA[7] 6:DBDATA[6] 5:DBDATA[5] 4:DBDATA[4] 3:DBDATA[3] 2:DBDATA[2] 1:DBDATA[1] 0:DBDATA[0] @ _sfr+0xA5
f sfr.DSROP 1 @ _sfr+0xA6
CCu 7:SFRPAGE 6:SFRADDR[6] 5:SFRADDR[5] 4:SFRADDR[4] 3:SFRADDR[3] 2:SFRADDR[2] 1:SFRADDR[1] 0:SFRADDR[0] @ _sfr+0xA6
f sfr.PH_FIFO_ACC 1 @ _sfr+0xA7
CCu 7:PHFFDATA[7] 6:PHFFDATA[6] 5:PHFFDATA[5] 4:PHFFDATA[4] 3:PHFFDATA[3] 2:PHFFDATA[2] 1:PHFFDATA[1] 0:PHFFDATA[0] @ _sfr+0xA7
f sfr.IE 1 @ _sfr+0xA8
CCu 7:GIE 6:PH_INFOE 5:PA_RAMPE 4:TIMER1E 3:TIMER0E 2:DEBUGE 1:MODEME @ _sfr+0xA8
f sfr.PH_FIFO_RST 1 @ _sfr+0xA9
CCu 7:CRC_TX_RESULT 6:TX_FIELD5_ST_CLR 5:TX_FIELD4_ST_CLR 4:PHRXFF_RST 3:TX_FIELD3_ST_CLR 2:TX_FIELD2_ST_CLR 1:TX_FIELD1_ST_CLR 0:PHTXFF_RST @ _sfr+0xA9
f sfr.PH_CNTL_1 1 @ _sfr+0xAA
CCu 7:RX_RESUME_AFTER_HALT 6:MAN_INV_EN 5:LSB_FIRST 4:RX_SKIP_PREAM 3:TX_SKIP_SYNC 2:TX_SKIP_PREAM 1:TX_EN 0:RX_EN @ _sfr+0xAA
f sfr.PH_CNTL_2 1 @ _sfr+0xAB
CCu 7:CRC2_PADDING_EN 6:RX_ALMOST_FULL_TH[2] 5:RX_ALMOST_FULL_TH[1] 4:RX_ALMOST_FULL_TH[0] 3:PN_BIT_REVERSE 2:TX_ALMOST_EMPTY_TH[2] 1:TX_ALMOST_EMPTY_TH[1] 0:TX_ALMOST_EMPTY_TH[0] @ _sfr+0xAB
f sfr.PH_CNTL_3 1 @ _sfr+0xAC
CCu 7:CRC_LSB_FIRST 6:CRC_MSBYTE_FIRST 5:CRC_INV_EN 4:DEMOD_4FSK_EN 3:RX_MULTI_PCKT 2:PN_SEED_LOAD 1:CRC2_SEED_LOAD 0:CRC1_SEED_LOAD @ _sfr+0xAC
f sfr.PH_INT_ENABLE_1 1 @ _sfr+0xAD
CCu 7:RX_PACKET_RCVD_EN 6:RX_PACKET_VALID_EN 5:TX_PACKET_SENT_EN 4:SYNC_DET_EN 3:PREAM_DET_EN 2:HALT_AFTER_FIELD_EN 1:RX_ALMOST_FULL_EN 0:TX_ALMOST_EMPTY_EN @ _sfr+0xAD
f sfr.PH_INT_ENABLE_2 1 @ _sfr+0xAE
CCu 5:ERR3OUT6_EN 3:RX_OVFL_EN 2:TX_UNDRFL_EN 1:CRC2_ERROR_EN 0:CRC1_ERROR_EN @ _sfr+0xAE
f sfr.NIRQ0 1 @ _sfr+0xB1
CCu 7:nIRQ_7 6:nIRQ_6 5:nIRQ_5 4:nIRQ_4 3:nIRQ_3 2:nIRQ_2 1:nIRQ_1 0:nIRQ_0 @ _sfr+0xB1
f sfr.NIRQ1 1 @ _sfr+0xB2
CCu 7:nIRQ_15 6:nIRQ_14 5:nIRQ_13 4:nIRQ_12 3:nIRQ_11 2:nIRQ_10 1:nIRQ_9 0:nIRQ_8 @ _sfr+0xB2
f sfr.NIRQ2 1 @ _sfr+0xB3
CCu 7:nIRQ_23 6:nIRQ_22 5:nIRQ_21 4:nIRQ_20 3:nIRQ_19 2:nIRQ_18 1:nIRQ_17 0:nIRQ_16 @ _sfr+0xB3
f sfr.NIRQ0_CLR 1 @ _sfr+0xB4
CCu 7:nIRQ_CLR_7 6:nIRQ_CLR_6 5:nIRQ_CLR_5 4:nIRQ_CLR_4 3:nIRQ_CLR_3 2:nIRQ_CLR_2 1:nIRQ_CLR_1 0:nIRQ_CLR_0 @ _sfr+0xB4
f sfr.NIRQ1_CLR 1 @ _sfr+0xB5
CCu 7:nIRQ_CLR_15 6:nIRQ_CLR_14 5:nIRQ_CLR_13 4:nIRQ_CLR_12 3:nIRQ_CLR_11 2:nIRQ_CLR_10 1:nIRQ_CLR_9 0:nIRQ_CLR_8 @ _sfr+0xB5
f sfr.NIRQ2_CLR 1 @ _sfr+0xB6
CCu 7:nIRQ_CLR_23 6:nIRQ_CLR_22 5:nIRQ_CLR_21 4:nIRQ_CLR_20 3:nIRQ_CLR_19 2:nIRQ_CLR_18 1:nIRQ_CLR_17 0:nIRQ_CLR_16 @ _sfr+0xB6
f sfr.IP 1 @ _sfr+0xB8
CCu 6:PH_INFOP 5:PA_RAMPP 4:TIMER1P 3:TIMER0P 2:DEBUGP 1:MODEMP @ _sfr+0xB8
f sfr.PH_INT_STATUS_1 1 @ _sfr+0xBA
CCu 7:RX_PACKET_RCVD 6:RX_PACKET_VALID 5:TX_PACKET_SENT 4:SYNC_DET 3:PREAM_DET 2:HALT_AFTER_FIELD 1:RX_ALMOST_FULL 0:TX_ALMOST_EMPTY @ _sfr+0xBA
f sfr.PH_INT_STATUS_2 1 @ _sfr+0xBB
CCu 7:SYNC1_DET 6:SYNC2_DET 5:ERR3OUT6 4:RX_ZERO_BT 3:RX_OVFL 2:TX_UNDRFL 1:CRC2_ERROR 0:CRC1_ERROR @ _sfr+0xBB
f sfr.PH_STATUS_1 1 @ _sfr+0xBC
CCu 7:RX_STATE[3] 6:RX_STATE[2] 5:RX_STATE[1] 4:RX_STATE[0] 3:TX_STATE[3] 2:TX_STATE[2] 1:TX_STATE[1] 0:TX_STATE[0] @ _sfr+0xBC
f sfr.PH_STATUS_2 1 @ _sfr+0xBD
CCu 6:CRC2_ERROR_FIELD[2] 5:CRC2_ERROR_FIELD[1] 4:CRC2_ERROR_FIELD[0] 2:CRC1_ERROR_FIELD[2] 1:CRC1_ERROR_FIELD[1] 0:CRC1_ERROR_FIELD[0] @ _sfr+0xBD
f sfr.PK_CTRL 1 @ _sfr+0xC0
CCu 7:pti_en 6:pti_en_rx 5:pti_en_tx 4:pti_rev 3:pti_ppol 2:pti_sp 1:pti_is 0:pti_div[8] @ _sfr+0xC0
f sfr.PK_DIV 1 @ _sfr+0xC1
CCu 7:pti_div[7] 6:pti_div[6] 5:pti_div[5] 4:pti_div[4] 3:pti_div[3] 2:pti_div[2] 1:pti_div[1] 0:pti_div[0] @ _sfr+0xC1
f sfr.PK_STATUS 1 @ _sfr+0xC2
CCu 7:pti_status[7] 6:pti_status[6] 5:pti_status[5] 4:pti_status[4] 3:pti_status[3] 2:pti_status[2] 1:pti_status[1] 0:pti_status[0] @ _sfr+0xC2
f sfr.PK_STOP 1 @ _sfr+0xC3
CCu 7:pti_stop[7] 6:pti_stop[6] 5:pti_stop[5] 4:pti_stop[4] 3:pti_stop[3] 2:pti_stop[2] 1:pti_stop[1] 0:pti_stop[0] @ _sfr+0xC3
f sfr.PK_STATE 1 @ _sfr+0xC4
CCu 7:st_xmit_data 6:st_rx_frame 5:st_tx_en 4:st_tx_frame 3:status_count[3] 2:status_count[2] 1:status_count[1] 0:status_count[0] @ _sfr+0xC4
f sfr.NIRQ0_RD 1 @ _sfr+0xC5
CCu 7:nIRQ_RD_7 6:nIRQ_RD_6 5:nIRQ_RD_5 4:nIRQ_RD_4 3:nIRQ_RD_3 2:nIRQ_RD_2 1:nIRQ_RD_1 0:nIRQ_RD_0 @ _sfr+0xC5
f sfr.NIRQ1_RD 1 @ _sfr+0xC6
CCu 7:nIRQ_RD_15 6:nIRQ_RD_14 5:nIRQ_RD_13 4:nIRQ_RD_12 3:nIRQ_RD_11 2:nIRQ_RD_10 1:nIRQ_RD_9 0:nIRQ_RD_8 @ _sfr+0xC6
f sfr.NIRQ2_RD 1 @ _sfr+0xC7
CCu 7:nIRQ_RD_23 6:nIRQ_RD_22 5:nIRQ_RD_21 4:nIRQ_RD_20 3:nIRQ_RD_19 2:nIRQ_RD_18 1:nIRQ_RD_17 0:nIRQ_RD_16 @ _sfr+0xC7
f sfr.MODEM_STUS 1 @ _sfr+0xC8
CCu 7:dbg_rx_state[3] 6:dbg_rx_state[2] 5:dbg_rx_state[1] 4:dbg_rx_state[0] 3:rx_saturate 2:ant_sw 1:modem_st[1] 0:modem_st[0] @ _sfr+0xC8
f sfr.MODEMRPT_EN 1 @ _sfr+0xC9
CCu 7:rfpd_irpt_en 6:rssijump_det_en 5:mdm_resume_en 4:no_pmdet_en 3:arrivingdet_en 2:rssi_irpt_en 1:pmdet_or_ramp_done_en 0:rx_clk_or_txbitclk_irpt_en @ _sfr+0xC9
f sfr.MODEMRPT_STUS 1 @ _sfr+0xCA
CCu 7:rfpd_irpt 6:rssijump_det 5:mdm_resume 4:no_pmdet 3:arrivingdet_irpt 2:rssi_irpt 1:pmdet_or_ramp_done 0:rx_clk_or_txbitclk_irpt @ _sfr+0xCA
f sfr.MCU_CFG 1 @ _sfr+0xCE
CCu 2:MCU_OVERLAY 1:STALL_MODE[1] 0:STALL_MODE[0] @ _sfr+0xCE
f sfr.MODEM_CTRL 1 @ _sfr+0xCF
CCu 4:TX_PH_EN 3:IF_SHIFT 2:MOD_EN 1:TX_MDM_EN 0:DEMOD_EN @ _sfr+0xCF
f sfr.PSW 1 @ _sfr+0xD0
CCu 7:CY 6:AC 5:F0 4:RS[1] 3:RS[0] 2:OV 0:P @ _sfr+0xD0
f sfr.FIELD_NUM 1 @ _sfr+0xD1
CCu 5:RX_FIELD_CONFIGURED 4:FIELD_TO_CONFIG[4] 3:FIELD_TO_CONFIG[3] 2:FIELD_TO_CONFIG[2] 1:FIELD_TO_CONFIG[1] 0:FIELD_TO_CONFIG[0] @ _sfr+0xD1
f sfr.FIELD_LENGTH_1 1 @ _sfr+0xD2
CCu 7:FIELD_LENGTH[7] 6:FIELD_LENGTH[6] 5:FIELD_LENGTH[5] 4:FIELD_LENGTH[4] 3:FIELD_LENGTH[3] 2:FIELD_LENGTH[2] 1:FIELD_LENGTH[1] 0:FIELD_LENGTH[0] @ _sfr+0xD2
f sfr.FIELD_LENGTH_2 1 @ _sfr+0xD3
CCu 7:FIELD_LENGTH[15] 6:FIELD_LENGTH[14] 5:FIELD_LENGTH[13] 4:FIELD_LENGTH[12] 3:FIELD_LENGTH[11] 2:FIELD_LENGTH[10] 1:FIELD_LENGTH[9] 0:FIELD_LENGTH[8] @ _sfr+0xD3
f sfr.FIELD_CONFIG 1 @ _sfr+0xD4
CCu 5:TX_FIELD_BEGIN_INT_EN 4:FIELD_4FSK_EN 3:FIELD_HALT_AFTER_FLD 2:FIELD_LAST_IN_PCKT 1:FIELD_DW_EN 0:FIELD_MAN_EN @ _sfr+0xD4
f sfr.FIELD_CRC_CONFIG 1 @ _sfr+0xD5
CCu 7:RX_CRC2_RESEED_AFTER_FIELD 6:TR_CRC2_RESEED_AFTER_FIELD 5:TR_CRC2_AFTER_FIELD 4:TR_CRC1_AFTER_FIELD 3:RX_CRC2_AFTER_FIELD 2:RX_CRC1_AFTER_FIELD 1:FIELD_CRC2_EN 0:FIELD_CRC1_EN @ _sfr+0xD5
f sfr.IQ_CALAMP 1 @ _sfr+0xD6
CCu 5:Kamp_sign 4:kamp[4] 3:kamp[3] 2:kamp[2] 1:kamp[1] 0:kamp[0] @ _sfr+0xD6
f sfr.IQ_CALPH 1 @ _sfr+0xD7
CCu 5:kph_sign 4:kph[4] 3:kph[3] 2:kph[2] 1:kph[1] 0:kph[0] @ _sfr+0xD7
f sfr.IRQ 1 @ _sfr+0xD9
CCu 7:AUTOCLR 6:PH_INFOI 5:PA_RAMPI 4:TIMER1I 3:TIMER0I 2:DEBUGI 1:MODEMI @ _sfr+0xD9
f sfr.EIRQ1 1 @ _sfr+0xDA
CCu 7:PH_HALTI 6:RX_PH_AFI 5:TX_PH_AEI 4:PH_ERRI 3:SPI_ERI 2:DMARD_I 1:DMAWR_I 0:COMMANDI @ _sfr+0xDA
f sfr.EIRQ2 1 @ _sfr+0xDB
CCu 4:MCUSWI 3:XOSC_OKI 2:BITCLKI 1:MCTLCMDI 0:WUTI @ _sfr+0xDB
f sfr.EIE1 1 @ _sfr+0xDC
CCu 7:PH_HALTE 6:RX_PH_AFE 5:TX_PH_AEE 4:PH_ERRE 3:SPI_ERE 2:DMARD_E 1:DMAWR_E 0:COMMANDE @ _sfr+0xDC
f sfr.EIE2 1 @ _sfr+0xDD
CCu 4:MCUSWE 3:XOSC_OKE 2:BITCLKE 1:MCTLCMDE 0:WUTE @ _sfr+0xDD
f sfr.EIP1 1 @ _sfr+0xDE
CCu 7:PH_HALTP 6:RX_PH_AFP 5:TX_PH_AEP 4:PH_ERRP 3:SPI_ERP 2:DMARD_P 1:DMAWR_P 0:COMMANDP @ _sfr+0xDE
f sfr.EIP2 1 @ _sfr+0xDF
CCu 4:MCUSWP 3:XOSC_OKP 2:BITCLKP 1:MCTLCMDP 0:WUTP @ _sfr+0xDF
f sfr.A 1 @ _sfr+0xE0
CCu 7:A[7] 6:A[6] 5:A[5] 4:A[4] 3:A[3] 2:A[2] 1:A[1] 0:A[0] @ _sfr+0xE0
f sfr.TXDATARATE2 1 @ _sfr+0xE1
CCu 7:txdr[23] 6:txdr[22] 5:txdr[21] 4:txdr[20] 3:txdr[19] 2:txdr[18] 1:txdr[17] 0:txdr[16] @ _sfr+0xE1
f sfr.TXDATARATE1 1 @ _sfr+0xE2
CCu 7:txdr[15] 6:txdr[14] 5:txdr[13] 4:txdr[12] 3:txdr[11] 2:txdr[10] 1:txdr[9] 0:txdr[8] @ _sfr+0xE2
f sfr.TXDATARATE0 1 @ _sfr+0xE3
CCu 7:txdr[7] 6:txdr[6] 5:txdr[5] 4:txdr[4] 3:txdr[3] 2:txdr[2] 1:txdr[1] 0:txdr[0] @ _sfr+0xE3
f sfr.FREQ_DEV2 1 @ _sfr+0xE4
CCu 7:mcu_txbit 6:mcu_rampping 5:dsource[1] 4:dsource[0] 3:modtyp[2] 2:modtyp[1] 1:modtyp[0] 0:txfd[16] @ _sfr+0xE4
f sfr.FREQ_DEV1 1 @ _sfr+0xE5
CCu 7:txfd[15] 6:txfd[14] 5:txfd[13] 4:txfd[12] 3:txfd[11] 2:txfd[10] 1:txfd[9] 0:txfd[8] @ _sfr+0xE5
f sfr.FREQ_DEV0 1 @ _sfr+0xE6
CCu 7:txfd[7] 6:txfd[6] 5:txfd[5] 4:txfd[4] 3:txfd[3] 2:txfd[2] 1:txfd[1] 0:txfd[0] @ _sfr+0xE6
f sfr.FREQ_OFFSET1 1 @ _sfr+0xE7
CCu 7:txfo[15] 6:txfo[14] 5:txfo[13] 4:txfo[12] 3:txfo[11] 2:txfo[10] 1:txfo[9] 0:txfo[8] @ _sfr+0xE7
f sfr.FREQ_OFFSET0 1 @ _sfr+0xE8
CCu 7:txfo[7] 6:txfo[6] 5:txfo[5] 4:txfo[4] 3:txfo[3] 2:txfo[2] 1:txfo[1] 0:txfo[0] @ _sfr+0xE8
f sfr.FREQINTE 1 @ _sfr+0xE9
CCu 7:freq_prog_req 6:fc_inte[6] 5:fc_inte[5] 4:fc_inte[4] 3:fc_inte[3] 2:fc_inte[2] 1:fc_inte[1] 0:fc_inte[0] @ _sfr+0xE9
f sfr.FREQ_FRAC2 1 @ _sfr+0xEA
CCu 7:Ramp_dly[2] 6:Ramp_dly[1] 5:Ramp_dly[0] 4:spare1 3:fc_frac[19] 2:fc_frac[18] 1:fc_frac[17] 0:fc_frac[16] @ _sfr+0xEA
f sfr.FREQ_FRAC1 1 @ _sfr+0xEB
CCu 7:fc_frac[15] 6:fc_frac[14] 5:fc_frac[13] 4:fc_frac[12] 3:fc_frac[11] 2:fc_frac[10] 1:fc_frac[9] 0:fc_frac[8] @ _sfr+0xEB
f sfr.FREQ_FRAC0 1 @ _sfr+0xEC
CCu 7:fc_frac[7] 6:fc_frac[6] 5:fc_frac[5] 4:fc_frac[4] 3:fc_frac[3] 2:fc_frac[2] 1:fc_frac[1] 0:fc_frac[0] @ _sfr+0xEC
f sfr.PHASE_OUT 1 @ _sfr+0xED
CCu 7:arrcnt_ph 6:phrd_out[6] 5:phrd_out[5] 4:phrd_out[4] 3:phrd_out[3] 2:phrd_out[2] 1:phrd_out[1] 0:phrd_out[0] @ _sfr+0xED
f sfr.GPIO_TST 1 @ _sfr+0xEE
CCu 7:GPIO_TST_7 6:GPIO_TST_6 5:GPIO_TST_5 4:GPIO_TST_4 3:GPIO_TST_3 2:GPIO_TST_2 1:GPIO_TST_1 0:GPIO_TST_0 @ _sfr+0xEE
f sfr.B 1 @ _sfr+0xF0
CCu 7:B[7] 6:B[6] 5:B[5] 4:B[4] 3:B[3] 2:B[2] 1:B[1] 0:B[0] @ _sfr+0xF0
f sfr.CIC_NDEC 1 @ _sfr+0xF1
CCu 7:ndec2[1] 6:ndec2[0] 5:ndec1[1] 4:ndec1[0] 3:ndec0[2] 2:ndec0[1] 1:ndec0[0] 0:RXgainx2 @ _sfr+0xF1
f sfr.RXOSR1 1 @ _sfr+0xF2
CCu 7:chflt_lopw 6:droopfltbyp 5:distogg 4:ph0size 3:rxosr[11] 2:rxosr[10] 1:rxosr[9] 0:rxosr[8] @ _sfr+0xF2
f sfr.RXOSR0 1 @ _sfr+0xF3
CCu 7:rxosr[7] 6:rxosr[6] 5:rxosr[5] 4:rxosr[4] 3:rxosr[3] 2:rxosr[2] 1:rxosr[1] 0:rxosr[0] @ _sfr+0xF3
f sfr.BCR_OFFSET2 1 @ _sfr+0xF4
CCu 7:bcrfbbyp 6:slicefbbyp 5:ncoff[21] 4:ncoff[20] 3:ncoff[19] 2:ncoff[18] 1:ncoff[17] 0:ncoff[16] @ _sfr+0xF4
f sfr.BCR_OFFSET1 1 @ _sfr+0xF5
CCu 7:ncoff[15] 6:ncoff[14] 5:ncoff[13] 4:ncoff[12] 3:ncoff[11] 2:ncoff[10] 1:ncoff[9] 0:ncoff[8] @ _sfr+0xF5
f sfr.BCR_OFFSET0 1 @ _sfr+0xF6
CCu 7:ncoff[7] 6:ncoff[6] 5:ncoff[5] 4:ncoff[4] 3:ncoff[3] 2:ncoff[2] 1:ncoff[1] 0:ncoff[0] @ _sfr+0xF6
f sfr.BCR_GAIN1 1 @ _sfr+0xF7
CCu 7:dis_midpt 6:esc_midpt 5:rxcomp_lat 4:rxncocomp 3:cgainx2 2:crgain[10] 1:crgain[9] 0:crgain[8] @ _sfr+0xF7
f sfr.BCR_GAIN0 1 @ _sfr+0xF8
CCu 7:crgain[7] 6:crgain[6] 5:crgain[5] 4:crgain[4] 3:crgain[3] 2:crgain[2] 1:crgain[1] 0:crgain[0] @ _sfr+0xF8
f sfr.BCR_GEAR 1 @ _sfr+0xF9
CCu 7:dwn3byp 6:dwn2byp 5:crfast[2] 4:crfast[1] 3:crfast[0] 2:crslow[2] 1:crslow[1] 0:crslow[0] @ _sfr+0xF9
f sfr.RSSI_VAL 1 @ _sfr+0xFA
CCu 7:rssi[7] 6:rssi[6] 5:rssi[5] 4:rssi[4] 3:rssi[3] 2:rssi[2] 1:rssi[1] 0:rssi[0] @ _sfr+0xFA
f sfr.ANT_RSSI2 1 @ _sfr+0xFC
CCu 7:adrssi2[7] 6:adrssi2[6] 5:adrssi2[5] 4:adrssi2[4] 3:adrssi2[3] 2:adrssi2[2] 1:adrssi2[1] 0:adrssi2[0] @ _sfr+0xFC
f sfr.ANT_RSSI1 1 @ _sfr+0xFD
CCu 7:adrssi1[7] 6:adrssi1[6] 5:adrssi1[5] 4:adrssi1[4] 3:adrssi1[3] 2:adrssi1[2] 1:adrssi1[1] 0:adrssi1[0] @ _sfr+0xFD
f sfr.AGC_CTRL1 1 @ _sfr+0xFE
CCu 7:antdiv_auto 6:tx_ant_inv 5:spare2 4:adcwatch 3:adcrst 2:fw_lna[2] 1:fw_lna[1] 0:fw_lna[0] @ _sfr+0xFE
f sfr.AGC_CTRL0 1 @ _sfr+0xFF
CCu 7:pga_gain[2] 6:pga_gain[1] 5:pga_gain[0] 4:lna_gain[2] 3:lna_gain[1] 2:lna_gain[0] 1:mcu_agc 0:mcu_rst_dff @ _sfr+0xFF
f xreg.CLKGEN_CFG0 1 @ xreg_base+0x00
CCu 7:Crystal_ok 6:lv_en_clkbuf 5:Cpu_boot_clk_dis 4:Cpu_boot_clk_en 3:rc_cal_clk_en 2:dma_prior 1:Boot_crystal_clk_sel 0:Crystal_en @ xreg_base+0x00
f xreg.CLKGEN_CFG1 1 @ xreg_base+0x01
CCu 7:Vcount_clk_en 6:Ph_clk_en 5:Int_clk_en 4:Timer_clk_en 3:Mod_clk_en 2:Demod_clk_en 1:Acfg_clk_en 0:Gpio_ctl_clk_en @ xreg_base+0x01
f xreg.CLKGEN_SW_RST 1 @ xreg_base+0x02
CCu 7:Spare3_sw_rst 6:Spare2_sw_rst 5:Spare1_sw_rst 4:demodlp_sw_rst 3:Spare5_sw_rst 2:Demod_sw_rst 1:Mod_sw_rst 0:Ph_sw_rst @ xreg_base+0x02
f xreg.CLKGEN_OVR_EN0 1 @ xreg_base+0x03
CCu 7:Vcount_clk_ovr_en 6:Ph_clk_ovr_en 5:Int_clk_ovr_en 4:Timer_clk_ovr_en 3:Mod_clk_ovr_en 2:Demod_clk_ovr_en 1:Acfg_clk_ovr_en 0:Gpio_ctl_clk_ovr_en @ xreg_base+0x03
f xreg.CLKGEN_OVR_VAL0 1 @ xreg_base+0x04
CCu 7:Vcount_clk_ovr_val 6:Ph_clk_ovr_val 5:Int_clk_ovr_val 4:Timer_clk_ovr_val 3:Mod_clk_ovr_val 2:Demod_clk_ovr_val 1:Acfg_clk_ovr_val 0:Gpio_ctl_clk_ovr_val @ xreg_base+0x04
f xreg.CLKGEN_OVR_EN1 1 @ xreg_base+0x05
CCu 7:auxadc_clk_en 6:ph_bit_clk_en 5:clk_cpotp_en 4:Sequencer_clk_en 3:Rc_cal_clk_ovr_en 1:dmard_clk_ovr_en 0:dmawr_clk_ovr_en @ xreg_base+0x05
f xreg.CLKGEN_OVR_VAL1 1 @ xreg_base+0x06
CCu 5:clk_cpotp_ovr_val 4:clk_cpotp_ovr_en 3:Rc_cal_clk_ovr_val 1:dmard_clk_ovr_val 0:dmawr_clk_ovr_val @ xreg_base+0x06
f xreg.CLKGEN_SYS_RST 1 @ xreg_base+0x07
CCu 4:Cpu_rst 3:Cpu_run 2:activate_reset 1:Rst_cnt_th[1] 0:Rst_cnt_th[0] @ xreg_base+0x07
f xreg.CLKGEN_RC_CAL 1 @ xreg_base+0x08
CCu 6:Cntr_clk_sel[2] 5:Cntr_clk_sel[1] 4:Cntr_clk_sel[0] 2:Ref_clk_sel[2] 1:Ref_clk_sel[1] 0:Ref_clk_sel[0] @ xreg_base+0x08
f xreg.CLK_GEN_DIV 1 @ xreg_base+0x09
CCu 7:Timer2_clk_src[1] 6:Timer2_clk_src[0] 5:Timer1_clk_src[1] 4:Timer1_clk_src[0] 3:Clk_div_ratio[2] 2:Clk_div_ratio[1] 1:Clk_div_ratio[0] 0:Clk_div_en @ xreg_base+0x09
f xreg.RX1CHFLTCOE13 1 @ xreg_base+0x0A
CCu 7:rx1coe13[7] 6:rx1coe13[6] 5:rx1coe13[5] 4:rx1coe13[4] 3:rx1coe13[3] 2:rx1coe13[2] 1:rx1coe13[1] 0:rx1coe13[0] @ xreg_base+0x0A
f xreg.RX1CHFLTCOE12 1 @ xreg_base+0x0B
CCu 7:rx1coe12[7] 6:rx1coe12[6] 5:rx1coe12[5] 4:rx1coe12[4] 3:rx1coe12[3] 2:rx1coe12[2] 1:rx1coe12[1] 0:rx1coe12[0] @ xreg_base+0x0B
f xreg.RX1CHFLTCOE11 1 @ xreg_base+0x0C
CCu 7:rx1coe11[7] 6:rx1coe11[6] 5:rx1coe11[5] 4:rx1coe11[4] 3:rx1coe11[3] 2:rx1coe11[2] 1:rx1coe11[1] 0:rx1coe11[0] @ xreg_base+0x0C
f xreg.RX1CHFLTCOE10 1 @ xreg_base+0x0D
CCu 7:rx1coe10[7] 6:rx1coe10[6] 5:rx1coe10[5] 4:rx1coe10[4] 3:rx1coe10[3] 2:rx1coe10[2] 1:rx1coe10[1] 0:rx1coe10[0] @ xreg_base+0x0D
f xreg.RX1CHFLTCOE9 1 @ xreg_base+0x0E
CCu 7:rx1coe9[7] 6:rx1coe9[6] 5:rx1coe9[5] 4:rx1coe9[4] 3:rx1coe9[3] 2:rx1coe9[2] 1:rx1coe9[1] 0:rx1coe9[0] @ xreg_base+0x0E
f xreg.RX1CHFLTCOE8 1 @ xreg_base+0x0F
CCu 7:rx1coe8[7] 6:rx1coe8[6] 5:rx1coe8[5] 4:rx1coe8[4] 3:rx1coe8[3] 2:rx1coe8[2] 1:rx1coe8[1] 0:rx1coe8[0] @ xreg_base+0x0F
f xreg.RX1CHFLTCOE7 1 @ xreg_base+0x10
CCu 7:rx1coe7[7] 6:rx1coe7[6] 5:rx1coe7[5] 4:rx1coe7[4] 3:rx1coe7[3] 2:rx1coe7[2] 1:rx1coe7[1] 0:rx1coe7[0] @ xreg_base+0x10
f xreg.RX1CHFLTCOE6 1 @ xreg_base+0x11
CCu 7:rx1coe6[7] 6:rx1coe6[6] 5:rx1coe6[5] 4:rx1coe6[4] 3:rx1coe6[3] 2:rx1coe6[2] 1:rx1coe6[1] 0:rx1coe6[0] @ xreg_base+0x11
f xreg.RX1CHFLTCOE5 1 @ xreg_base+0x12
CCu 7:rx1coe5[7] 6:rx1coe5[6] 5:rx1coe5[5] 4:rx1coe5[4] 3:rx1coe5[3] 2:rx1coe5[2] 1:rx1coe5[1] 0:rx1coe5[0] @ xreg_base+0x12
f xreg.RX1CHFLTCOE4 1 @ xreg_base+0x13
CCu 7:rx1coe4[7] 6:rx1coe4[6] 5:rx1coe4[5] 4:rx1coe4[4] 3:rx1coe4[3] 2:rx1coe4[2] 1:rx1coe4[1] 0:rx1coe4[0] @ xreg_base+0x13
f xreg.RX1CHFLTCOE3 1 @ xreg_base+0x14
CCu 7:rx1coe3[7] 6:rx1coe3[6] 5:rx1coe3[5] 4:rx1coe3[4] 3:rx1coe3[3] 2:rx1coe3[2] 1:rx1coe3[1] 0:rx1coe3[0] @ xreg_base+0x14
f xreg.RX1CHFLTCOE2 1 @ xreg_base+0x15
CCu 7:rx1coe2[7] 6:rx1coe2[6] 5:rx1coe2[5] 4:rx1coe2[4] 3:rx1coe2[3] 2:rx1coe2[2] 1:rx1coe2[1] 0:rx1coe2[0] @ xreg_base+0x15
f xreg.RX1CHFLTCOE1 1 @ xreg_base+0x16
CCu 7:rx1coe1[7] 6:rx1coe1[6] 5:rx1coe1[5] 4:rx1coe1[4] 3:rx1coe1[3] 2:rx1coe1[2] 1:rx1coe1[1] 0:rx1coe1[0] @ xreg_base+0x16
f xreg.RX1CHFLTCOE0 1 @ xreg_base+0x17
CCu 7:rx1coe0[7] 6:rx1coe0[6] 5:rx1coe0[5] 4:rx1coe0[4] 3:rx1coe0[3] 2:rx1coe0[2] 1:rx1coe0[1] 0:rx1coe0[0] @ xreg_base+0x17
f xreg.RX1CHFLTCOEM0 1 @ xreg_base+0x18
CCu 7:rx1coe10[9] 6:rx1coe10[8] 5:rx1coe11[9] 4:rx1coe11[8] 3:rx1coe12[9] 2:rx1coe12[8] 1:rx1coe13[9] 0:rx1coe13[8] @ xreg_base+0x18
f xreg.RX1CHFLTCOEM1 1 @ xreg_base+0x19
CCu 7:rx1coe6[9] 6:rx1coe6[8] 5:rx1coe7[9] 4:rx1coe7[8] 3:rx1coe8[9] 2:rx1coe8[8] 1:rx1coe9[9] 0:rx1coe9[8] @ xreg_base+0x19
f xreg.RX1CHFLTCOEM2 1 @ xreg_base+0x1A
CCu 7:rx1coe2[9] 6:rx1coe2[8] 5:rx1coe3[9] 4:rx1coe3[8] 3:rx1coe4[9] 2:rx1coe4[8] 1:rx1coe5[9] 0:rx1coe5[8] @ xreg_base+0x1A
f xreg.RX1CHFLTCOEM3 1 @ xreg_base+0x1B
CCu 7:eyexest_en 6:eyexest_fast 5:syntimeout_ph 4:rx_tpsel 3:rx1coe0[9] 2:rx1coe0[8] 1:rx1coe1[9] 0:rx1coe1[8] @ xreg_base+0x1B
f xreg.RX2CHFLTCOE13 1 @ xreg_base+0x1C
CCu 7:rx2coe13[7] 6:rx2coe13[6] 5:rx2coe13[5] 4:rx2coe13[4] 3:rx2coe13[3] 2:rx2coe13[2] 1:rx2coe13[1] 0:rx2coe13[0] @ xreg_base+0x1C
f xreg.RX2CHFLTCOE12 1 @ xreg_base+0x1D
CCu 7:rx2coe12[7] 6:rx2coe12[6] 5:rx2coe12[5] 4:rx2coe12[4] 3:rx2coe12[3] 2:rx2coe12[2] 1:rx2coe12[1] 0:rx2coe12[0] @ xreg_base+0x1D
f xreg.RX2CHFLTCOE11 1 @ xreg_base+0x1E
CCu 7:rx2coe11[7] 6:rx2coe11[6] 5:rx2coe11[5] 4:rx2coe11[4] 3:rx2coe11[3] 2:rx2coe11[2] 1:rx2coe11[1] 0:rx2coe11[0] @ xreg_base+0x1E
f xreg.RX2CHFLTCOE10 1 @ xreg_base+0x1F
CCu 7:rx2coe10[7] 6:rx2coe10[6] 5:rx2coe10[5] 4:rx2coe10[4] 3:rx2coe10[3] 2:rx2coe10[2] 1:rx2coe10[1] 0:rx2coe10[0] @ xreg_base+0x1F
f xreg.RX2CHFLTCOE9 1 @ xreg_base+0x20
CCu 7:rx2coe9[7] 6:rx2coe9[6] 5:rx2coe9[5] 4:rx2coe9[4] 3:rx2coe9[3] 2:rx2coe9[2] 1:rx2coe9[1] 0:rx2coe9[0] @ xreg_base+0x20
f xreg.RX2CHFLTCOE8 1 @ xreg_base+0x21
CCu 7:rx2coe8[7] 6:rx2coe8[6] 5:rx2coe8[5] 4:rx2coe8[4] 3:rx2coe8[3] 2:rx2coe8[2] 1:rx2coe8[1] 0:rx2coe8[0] @ xreg_base+0x21
f xreg.RX2CHFLTCOE7 1 @ xreg_base+0x22
CCu 7:rx2coe7[7] 6:rx2coe7[6] 5:rx2coe7[5] 4:rx2coe7[4] 3:rx2coe7[3] 2:rx2coe7[2] 1:rx2coe7[1] 0:rx2coe7[0] @ xreg_base+0x22
f xreg.RX2CHFLTCOE6 1 @ xreg_base+0x23
CCu 7:rx2coe6[7] 6:rx2coe6[6] 5:rx2coe6[5] 4:rx2coe6[4] 3:rx2coe6[3] 2:rx2coe6[2] 1:rx2coe6[1] 0:rx2coe6[0] @ xreg_base+0x23
f xreg.RX2CHFLTCOE5 1 @ xreg_base+0x24
CCu 7:rx2coe5[7] 6:rx2coe5[6] 5:rx2coe5[5] 4:rx2coe5[4] 3:rx2coe5[3] 2:rx2coe5[2] 1:rx2coe5[1] 0:rx2coe5[0] @ xreg_base+0x24
f xreg.RX2CHFLTCOE4 1 @ xreg_base+0x25
CCu 7:rx2coe4[7] 6:rx2coe4[6] 5:rx2coe4[5] 4:rx2coe4[4] 3:rx2coe4[3] 2:rx2coe4[2] 1:rx2coe4[1] 0:rx2coe4[0] @ xreg_base+0x25
f xreg.RX2CHFLTCOE3 1 @ xreg_base+0x26
CCu 7:rx2coe3[7] 6:rx2coe3[6] 5:rx2coe3[5] 4:rx2coe3[4] 3:rx2coe3[3] 2:rx2coe3[2] 1:rx2coe3[1] 0:rx2coe3[0] @ xreg_base+0x26
f xreg.RX2CHFLTCOE2 1 @ xreg_base+0x27
CCu 7:rx2coe2[7] 6:rx2coe2[6] 5:rx2coe2[5] 4:rx2coe2[4] 3:rx2coe2[3] 2:rx2coe2[2] 1:rx2coe2[1] 0:rx2coe2[0] @ xreg_base+0x27
f xreg.RX2CHFLTCOE1 1 @ xreg_base+0x28
CCu 7:rx2coe1[7] 6:rx2coe1[6] 5:rx2coe1[5] 4:rx2coe1[4] 3:rx2coe1[3] 2:rx2coe1[2] 1:rx2coe1[1] 0:rx2coe1[0] @ xreg_base+0x28
f xreg.RX2CHFLTCOE0 1 @ xreg_base+0x29
CCu 7:rx2coe0[7] 6:rx2coe0[6] 5:rx2coe0[5] 4:rx2coe0[4] 3:rx2coe0[3] 2:rx2coe0[2] 1:rx2coe0[1] 0:rx2coe0[0] @ xreg_base+0x29
f xreg.RX2CHFLTCOEM0 1 @ xreg_base+0x2A
CCu 7:rx2coe10[9] 6:rx2coe10[8] 5:rx2coe11[9] 4:rx2coe11[8] 3:rx2coe12[9] 2:rx2coe12[8] 1:rx2coe13[9] 0:rx2coe13[8] @ xreg_base+0x2A
f xreg.RX2CHFLTCOEM1 1 @ xreg_base+0x2B
CCu 7:rx2coe6[9] 6:rx2coe6[8] 5:rx2coe7[9] 4:rx2coe7[8] 3:rx2coe8[9] 2:rx2coe8[8] 1:rx2coe9[9] 0:rx2coe9[8] @ xreg_base+0x2B
f xreg.RX2CHFLTCOEM2 1 @ xreg_base+0x2C
CCu 7:rx2coe2[9] 6:rx2coe2[8] 5:rx2coe3[9] 4:rx2coe3[8] 3:rx2coe4[9] 2:rx2coe4[8] 1:rx2coe5[9] 0:rx2coe5[8] @ xreg_base+0x2C
f xreg.RX2CHFLTCOEM3 1 @ xreg_base+0x2D
CCu 7:large_freq_err 6:afcgain_ovr_flw 5:spare4 4:spare3 3:rx2coe0[9] 2:rx2coe0[8] 1:rx2coe1[9] 0:rx2coe1[8] @ xreg_base+0x2D
f xreg.AFC_GEAR 1 @ xreg_base+0x2E
CCu 7:afcbd 6:enafc 5:afcgearh[2] 4:afcgearh[1] 3:afcgearh[0] 2:afcgearl[2] 1:afcgearl[1] 0:afcgearl[0] @ xreg_base+0x2E
f xreg.AFC_TIMING 1 @ xreg_base+0x2F
CCu 7:shwait[3] 6:shwait[2] 5:shwait[1] 4:shwait[0] 3:lgwait[3] 2:lgwait[2] 1:lgwait[1] 0:lgwait[0] @ xreg_base+0x2F
f xreg.AFC_GAIN1 1 @ xreg_base+0x30
CCu 7:gear_sw[1] 6:gear_sw[0] 5:enfbpll 4:afcgain[12] 3:afcgain[11] 2:afcgain[10] 1:afcgain[9] 0:afcgain[8] @ xreg_base+0x30
f xreg.AFC_GAIN0 1 @ xreg_base+0x31
CCu 7:afcgain[7] 6:afcgain[6] 5:afcgain[5] 4:afcgain[4] 3:afcgain[3] 2:afcgain[2] 1:afcgain[1] 0:afcgain[0] @ xreg_base+0x31
f xreg.AFC_LIMITER1 1 @ xreg_base+0x32
CCu 7:enafcfrz 6:afclim[14] 5:afclim[13] 4:afclim[12] 3:afclim[11] 2:afclim[10] 1:afclim[9] 0:afclim[8] @ xreg_base+0x32
f xreg.AFC_LIMITER0 1 @ xreg_base+0x33
CCu 7:afclim[7] 6:afclim[6] 5:afclim[5] 4:afclim[4] 3:afclim[3] 2:afclim[2] 1:afclim[1] 0:afclim[0] @ xreg_base+0x33
f xreg.AFC_READ1 1 @ xreg_base+0x34
CCu 7:afc_corr[15] 6:afc_corr[14] 5:afc_corr[13] 4:afc_corr[12] 3:afc_corr[11] 2:afc_corr[10] 1:afc_corr[9] 0:afc_corr[8] @ xreg_base+0x34
f xreg.AFC_READ0 1 @ xreg_base+0x35
CCu 7:afc_corr[7] 6:afc_corr[6] 5:afc_corr[5] 4:afc_corr[4] 3:afc_corr[3] 2:afc_corr[2] 1:afc_corr[1] 0:afc_corr[0] @ xreg_base+0x35
f xreg.OOK_CNT1 1 @ xreg_base+0x36
CCu 7:S2p_map[1] 6:S2p_map[0] 5:ookfrzen 4:ma_freqdwn 3:raw_syn 2:slicer_fast 1:Squelch[1] 0:Squelch[0] @ xreg_base+0x36
f xreg.SPIKE_THD 1 @ xreg_base+0x37
CCu 7:spikerm_en 6:spike_thd[6] 5:spike_thd[5] 4:spike_thd[4] 3:spike_thd[3] 2:spike_thd[2] 1:spike_thd[1] 0:spike_thd[0] @ xreg_base+0x37
f xreg.OOK_PK 1 @ xreg_base+0x38
CCu 7:ookfastma 6:attack[2] 5:attack[1] 4:attack[0] 3:decay[3] 2:decay[2] 1:decay[1] 0:decay[0] @ xreg_base+0x38
f xreg.OOK_BLOPK 1 @ xreg_base+0x39
CCu 7:bw_pk[7] 6:bw_pk[6] 5:bw_pk[5] 4:bw_pk[4] 3:bw_pk[3] 2:bw_pk[2] 1:bw_pk[1] 0:bw_pk[0] @ xreg_base+0x39
f xreg.ZEROIFOFFSET 1 @ xreg_base+0x3A
CCu 7:zeroff[7] 6:zeroff[6] 5:zeroff[5] 4:zeroff[4] 3:zeroff[3] 2:zeroff[2] 1:zeroff[1] 0:zeroff[0] @ xreg_base+0x3A
f xreg.RSSI_THRD 1 @ xreg_base+0x3B
CCu 7:rssith[7] 6:rssith[6] 5:rssith[5] 4:rssith[4] 3:rssith[3] 2:rssith[2] 1:rssith[1] 0:rssith[0] @ xreg_base+0x3B
f xreg.PHC4GFSK1 1 @ xreg_base+0x3C
CCu 7:phcompbyp 6:phcomp4fsk1[6] 5:phcomp4fsk1[5] 4:phcomp4fsk1[4] 3:phcomp4fsk1[3] 2:phcomp4fsk1[2] 1:phcomp4fsk1[1] 0:phcomp4fsk1[0] @ xreg_base+0x3C
f xreg.PHC4GFSK0 1 @ xreg_base+0x3D
CCu 7:phcomp2fsk 6:phcomp4fsk0[6] 5:phcomp4fsk0[5] 4:phcomp4fsk0[4] 3:phcomp4fsk0[3] 2:phcomp4fsk0[2] 1:phcomp4fsk0[1] 0:phcomp4fsk0[0] @ xreg_base+0x3D
f xreg.THD4GFSK1 1 @ xreg_base+0x3E
CCu 7:thd4gfsk[15] 6:thd4gfsk[14] 5:thd4gfsk[13] 4:thd4gfsk[12] 3:thd4gfsk[11] 2:thd4gfsk[10] 1:thd4gfsk[9] 0:thd4gfsk[8] @ xreg_base+0x3E
f xreg.THD4GFSK0 1 @ xreg_base+0x3F
CCu 7:thd4gfsk[7] 6:thd4gfsk[6] 5:thd4gfsk[5] 4:thd4gfsk[4] 3:thd4gfsk[3] 2:thd4gfsk[2] 1:thd4gfsk[1] 0:thd4gfsk[0] @ xreg_base+0x3F
f xreg.CODE4GFSK 1 @ xreg_base+0x40
CCu 7:code4gfsk[7] 6:code4gfsk[6] 5:code4gfsk[5] 4:code4gfsk[4] 3:code4gfsk[3] 2:code4gfsk[2] 1:code4gfsk[1] 0:code4gfsk[0] @ xreg_base+0x40
f xreg.RAW_CTRL1 1 @ xreg_base+0x41
CCu 7:ook_zerog 6:rawgain[1] 5:rawgain[0] 4:non_frzen 3:conschk_byp 2:raweye[10] 1:raweye[9] 0:raweye[8] @ xreg_base+0x41
f xreg.RAW_CTRL0 1 @ xreg_base+0x42
CCu 7:raweye[7] 6:raweye[6] 5:raweye[5] 4:raweye[4] 3:raweye[3] 2:raweye[2] 1:raweye[1] 0:raweye[0] @ xreg_base+0x42
f xreg.SCH_PRD 1 @ xreg_base+0x43
CCu 7:sch_frzen 6:rawflt_sel 5:schprd_h[2] 4:schprd_h[1] 3:schprd_h[0] 2:schprd_low[2] 1:schprd_low[1] 0:schprd_low[0] @ xreg_base+0x43
f xreg.ANT_MODE 1 @ xreg_base+0x44
CCu 7:swant_timer[1] 6:swant_timer[0] 5:byp1p5 4:skip2ph 3:skip2phth 2:anwait[2] 1:anwait[1] 0:anwait[0] @ xreg_base+0x44
f xreg.DC_CAL4 1 @ xreg_base+0x45
CCu 7:enfzpmend 6:enafc_clksw 5:matap 4:dc_rst 3:dc_freez 2:dc_gear[2] 1:dc_gear[1] 0:dc_gear[0] @ xreg_base+0x45
f xreg.DC_CAL3 1 @ xreg_base+0x46
CCu 6:dcini_chi[14] 5:dcini_chi[13] 4:dcini_chi[12] 3:dcini_chi[11] 2:dcini_chi[10] 1:dcini_chi[9] 0:dcini_chi[8] @ xreg_base+0x46
f xreg.DC_CAL2 1 @ xreg_base+0x47
CCu 7:dcini_chi[7] 6:dcini_chi[6] 5:dcini_chi[5] 4:dcini_chi[4] 3:dcini_chi[3] 2:dcini_chi[2] 1:dcini_chi[1] 0:dcini_chi[0] @ xreg_base+0x47
f xreg.DC_CAL1 1 @ xreg_base+0x48
CCu 6:dcini_chq[14] 5:dcini_chq[13] 4:dcini_chq[12] 3:dcini_chq[11] 2:dcini_chq[10] 1:dcini_chq[9] 0:dcini_chq[8] @ xreg_base+0x48
f xreg.DC_CAL0 1 @ xreg_base+0x49
CCu 7:dcini_chq[7] 6:dcini_chq[6] 5:dcini_chq[5] 4:dcini_chq[4] 3:dcini_chq[3] 2:dcini_chq[2] 1:dcini_chq[1] 0:dcini_chq[0] @ xreg_base+0x49
f xreg.DC_EST3 1 @ xreg_base+0x4A
CCu 6:dcest_chi[14] 5:dcest_chi[13] 4:dcest_chi[12] 3:dcest_chi[11] 2:dcest_chi[10] 1:dcest_chi[9] 0:dcest_chi[8] @ xreg_base+0x4A
f xreg.DC_EST2 1 @ xreg_base+0x4B
CCu 7:dcest_chi[7] 6:dcest_chi[6] 5:dcest_chi[5] 4:dcest_chi[4] 3:dcest_chi[3] 2:dcest_chi[2] 1:dcest_chi[1] 0:dcest_chi[0] @ xreg_base+0x4B
f xreg.DC_EST1 1 @ xreg_base+0x4C
CCu 6:dcest_chq[14] 5:dcest_chq[13] 4:dcest_chq[12] 3:dcest_chq[11] 2:dcest_chq[10] 1:dcest_chq[9] 0:dcest_chq[8] @ xreg_base+0x4C
f xreg.DC_EST0 1 @ xreg_base+0x4D
CCu 7:dcest_chq[7] 6:dcest_chq[6] 5:dcest_chq[5] 4:dcest_chq[4] 3:dcest_chq[3] 2:dcest_chq[2] 1:dcest_chq[1] 0:dcest_chq[0] @ xreg_base+0x4D
f xreg.MDM_CTRL 1 @ xreg_base+0x4E
CCu 7:ph_src_sel 6:en2Tb_est 5:pm_pattern[1] 4:pm_pattern[0] 3:detector[1] 2:detector[0] 1:agc_slow 0:nonstdpk @ xreg_base+0x4E
f xreg.AGC_OVERRIDE3 1 @ xreg_base+0x4F
CCu 7:agcovpkt 6:ifpdslow 5:rfpdslow 4:sgi_n 3:enrssijmp 2:jmpdlylen 1:enjmprx 0:rst_pkdt_period @ xreg_base+0x4F
f xreg.AGC_OVERRIDE2 1 @ xreg_base+0x50
CCu 7:measwin[3] 6:measwin[2] 5:measwin[1] 4:measwin[0] 3:settlewin[3] 2:settlewin[2] 1:settlewin[1] 0:settlewin[0] @ xreg_base+0x50
f xreg.AGC_OVERRIDE1 1 @ xreg_base+0x51
CCu 7:rfpd_decay[7] 6:rfpd_decay[6] 5:rfpd_decay[5] 4:rfpd_decay[4] 3:rfpd_decay[3] 2:rfpd_decay[2] 1:rfpd_decay[1] 0:rfpd_decay[0] @ xreg_base+0x51
f xreg.AGC_OVERRIDE0 1 @ xreg_base+0x52
CCu 7:ifpd_decay[7] 6:ifpd_decay[6] 5:ifpd_decay[5] 4:ifpd_decay[4] 3:ifpd_decay[3] 2:ifpd_decay[2] 1:ifpd_decay[1] 0:ifpd_decay[0] @ xreg_base+0x52
f xreg.LNA_PGA_MAX 1 @ xreg_base+0x53
CCu 7:cc_assess_sel 6:lna_max[2] 5:lna_max[1] 4:lna_max[0] 3:LNA_PGA_OVR 2:pga_max[2] 1:pga_max[1] 0:pga_max[0] @ xreg_base+0x53
f xreg.RSSIJMPTHD 1 @ xreg_base+0x54
CCu 7:Rssijmp_up 6:rssijmpthd[6] 5:rssijmpthd[5] 4:rssijmpthd[4] 3:rssijmpthd[3] 2:rssijmpthd[2] 1:rssijmpthd[1] 0:rssijmpthd[0] @ xreg_base+0x54
f xreg.RSSI_COMP 1 @ xreg_base+0x55
CCu 7:Rssijmp_dwn 6:rssi_comp[6] 5:rssi_comp[5] 4:rssi_comp[4] 3:rssi_comp[3] 2:rssi_comp[2] 1:rssi_comp[1] 0:rssi_comp[0] @ xreg_base+0x55
f xreg.PMDETTHD 1 @ xreg_base+0x56
CCu 7:skipsyn 6:preath[6] 5:preath[5] 4:preath[4] 3:preath[3] 2:preath[2] 1:preath[1] 0:preath[0] @ xreg_base+0x56
f xreg.INVPMDET_THD 1 @ xreg_base+0x57
CCu 7:ant2pm_thd[3] 6:ant2pm_thd[2] 5:ant2pm_thd[1] 4:ant2pm_thd[0] 3:inv_preath[3] 2:inv_preath[2] 1:inv_preath[1] 0:inv_preath[0] @ xreg_base+0x57
f xreg.TXFLTCOE8 1 @ xreg_base+0x58
CCu 7:txcoe8[7] 6:txcoe8[6] 5:txcoe8[5] 4:txcoe8[4] 3:txcoe8[3] 2:txcoe8[2] 1:txcoe8[1] 0:txcoe8[0] @ xreg_base+0x58
f xreg.TXFLTCOE7 1 @ xreg_base+0x59
CCu 7:txcoe7[7] 6:txcoe7[6] 5:txcoe7[5] 4:txcoe7[4] 3:txcoe7[3] 2:txcoe7[2] 1:txcoe7[1] 0:txcoe7[0] @ xreg_base+0x59
f xreg.TXFLTCOE6 1 @ xreg_base+0x5A
CCu 7:txcoe6[7] 6:txcoe6[6] 5:txcoe6[5] 4:txcoe6[4] 3:txcoe6[3] 2:txcoe6[2] 1:txcoe6[1] 0:txcoe6[0] @ xreg_base+0x5A
f xreg.TXFLTCOE5 1 @ xreg_base+0x5B
CCu 7:txcoe5[7] 6:txcoe5[6] 5:txcoe5[5] 4:txcoe5[4] 3:txcoe5[3] 2:txcoe5[2] 1:txcoe5[1] 0:txcoe5[0] @ xreg_base+0x5B
f xreg.TXFLTCOE4 1 @ xreg_base+0x5C
CCu 7:txcoe4[7] 6:txcoe4[6] 5:txcoe4[5] 4:txcoe4[4] 3:txcoe4[3] 2:txcoe4[2] 1:txcoe4[1] 0:txcoe4[0] @ xreg_base+0x5C
f xreg.TXFLTCOE3 1 @ xreg_base+0x5D
CCu 7:txcoe3[7] 6:txcoe3[6] 5:txcoe3[5] 4:txcoe3[4] 3:txcoe3[3] 2:txcoe3[2] 1:txcoe3[1] 0:txcoe3[0] @ xreg_base+0x5D
f xreg.TXFLTCOE2 1 @ xreg_base+0x5E
CCu 7:txcoe2[7] 6:txcoe2[6] 5:txcoe2[5] 4:txcoe2[4] 3:txcoe2[3] 2:txcoe2[2] 1:txcoe2[1] 0:txcoe2[0] @ xreg_base+0x5E
f xreg.TXFLTCOE1 1 @ xreg_base+0x5F
CCu 7:txcoe1[7] 6:txcoe1[6] 5:txcoe1[5] 4:txcoe1[4] 3:txcoe1[3] 2:txcoe1[2] 1:txcoe1[1] 0:txcoe1[0] @ xreg_base+0x5F
f xreg.TXFLTCOE0 1 @ xreg_base+0x60
CCu 7:txcoe0[7] 6:txcoe0[6] 5:txcoe0[5] 4:txcoe0[4] 3:txcoe0[3] 2:txcoe0[2] 1:txcoe0[1] 0:txcoe0[0] @ xreg_base+0x60
f xreg.TXNCOMOD3 1 @ xreg_base+0x61
CCu 7:enmanch 6:Eninv_rxbit 5:Eninv_txbit 4:Eninv_fd 3:Txosrx2 2:Txosrx4 1:txncomod[25] 0:txncomod[24] @ xreg_base+0x61
f xreg.TXNCOMOD2 1 @ xreg_base+0x62
CCu 7:txncomod[23] 6:txncomod[22] 5:txncomod[21] 4:txncomod[20] 3:txncomod[19] 2:txncomod[18] 1:txncomod[17] 0:txncomod[16] @ xreg_base+0x62
f xreg.TXNCOMOD1 1 @ xreg_base+0x63
CCu 7:txncomod[15] 6:txncomod[14] 5:txncomod[13] 4:txncomod[12] 3:txncomod[11] 2:txncomod[10] 1:txncomod[9] 0:txncomod[8] @ xreg_base+0x63
f xreg.TXNCOMOD0 1 @ xreg_base+0x64
CCu 7:txncomod[7] 6:txncomod[6] 5:txncomod[5] 4:txncomod[4] 3:txncomod[3] 2:txncomod[2] 1:txncomod[1] 0:txncomod[0] @ xreg_base+0x64
f xreg.IF_FREQ2 1 @ xreg_base+0x65
CCu 7:dsmclk_inv 6:smclk_div2 5:adc_gain_cor_en 4:zeroif 3:fixif 2:Eninv_adcq 1:if_freq[17] 0:if_freq[16] @ xreg_base+0x65
f xreg.IF_FREQ1 1 @ xreg_base+0x66
CCu 7:if_freq[15] 6:if_freq[14] 5:if_freq[13] 4:if_freq[12] 3:if_freq[11] 2:if_freq[10] 1:if_freq[9] 0:if_freq[8] @ xreg_base+0x66
f xreg.IF_FREQ0 1 @ xreg_base+0x67
CCu 7:if_freq[7] 6:if_freq[6] 5:if_freq[5] 4:if_freq[4] 3:if_freq[3] 2:if_freq[2] 1:if_freq[1] 0:if_freq[0] @ xreg_base+0x67
f xreg.DSM_CTRL 1 @ xreg_base+0x68
CCu 7:dsmclk_sel 6:dsm_mode 5:dsmdt_en 4:dsmdttp 3:dsm_rst 2:dsm_lsb 1:dsm_order[1] 0:dsm_order[0] @ xreg_base+0x68
f xreg.DMA_RST 1 @ xreg_base+0x69
CCu 4:SPI_WRBUFF_CLEAN 3:SPI_RDBUFF_CLEAN 2:DMARD_2SPI_CLEAN 1:RD_DMA_CLEAN 0:WR_DMA_CLEAN @ xreg_base+0x69
f xreg.DMA_WROFF_LSBS 1 @ xreg_base+0x6A
CCu 7:DMAWR_OFF[7] 6:DMAWR_OFF[6] 5:DMAWR_OFF[5] 4:DMAWR_OFF[4] 3:DMAWR_OFF[3] 2:DMAWR_OFF[2] 1:DMAWR_OFF[1] 0:DMAWR_OFF[0] @ xreg_base+0x6A
f xreg.DMA_RDOFF_LSBS 1 @ xreg_base+0x6B
CCu 7:DMARD_OFF[7] 6:DMARD_OFF[6] 5:DMARD_OFF[5] 4:DMARD_OFF[4] 3:DMARD_OFF[3] 2:DMARD_OFF[2] 1:DMARD_OFF[1] 0:DMARD_OFF[0] @ xreg_base+0x6B
f xreg.DMA_WROFF_MSBS 1 @ xreg_base+0x6C
CCu 2:DMAWR_OFF[10] 1:DMAWR_OFF[9] 0:DMAWR_OFF[8] @ xreg_base+0x6C
f xreg.DMA_CFG 1 @ xreg_base+0x6D
CCu 2:DMA_SEL_THRESH16 1:SPI_RDBUF_BYTE_INT_ENB 0:DUMP_EN @ xreg_base+0x6D
f xreg.DMA_RDOFF_MSBS 1 @ xreg_base+0x6E
CCu 2:DMARD_OFF[10] 1:DMARD_OFF[9] 0:DMARD_OFF[8] @ xreg_base+0x6E
f xreg.DMARD_VALID 1 @ xreg_base+0x6F
CCu 7:DMARD_VALID_BYTES[7] 6:DMARD_VALID_BYTES[6] 5:DMARD_VALID_BYTES[5] 4:DMARD_VALID_BYTES[4] 3:DMARD_VALID_BYTES[3] 2:DMARD_VALID_BYTES[2] 1:DMARD_VALID_BYTES[1] 0:DMARD_VALID_BYTES[0] @ xreg_base+0x6F
f xreg.CMD_BUFF0 1 @ xreg_base+0x70
CCu 7:CMD_BUFF0[7] 6:CMD_BUFF0[6] 5:CMD_BUFF0[5] 4:CMD_BUFF0[4] 3:CMD_BUFF0[3] 2:CMD_BUFF0[2] 1:CMD_BUFF0[1] 0:CMD_BUFF0[0] @ xreg_base+0x70
f xreg.CMD_BUFF1 1 @ xreg_base+0x71
CCu 7:CMD_BUFF1[7] 6:CMD_BUFF1[6] 5:CMD_BUFF1[5] 4:CMD_BUFF1[4] 3:CMD_BUFF1[3] 2:CMD_BUFF1[2] 1:CMD_BUFF1[1] 0:CMD_BUFF1[0] @ xreg_base+0x71
f xreg.CMD_BUFF2 1 @ xreg_base+0x72
CCu 7:CMD_BUFF2[7] 6:CMD_BUFF2[6] 5:CMD_BUFF2[5] 4:CMD_BUFF2[4] 3:CMD_BUFF2[3] 2:CMD_BUFF2[2] 1:CMD_BUFF2[1] 0:CMD_BUFF2[0] @ xreg_base+0x72
f xreg.CMD_BUFF3 1 @ xreg_base+0x73
CCu 7:CMD_BUFF3[7] 6:CMD_BUFF3[6] 5:CMD_BUFF3[5] 4:CMD_BUFF3[4] 3:CMD_BUFF3[3] 2:CMD_BUFF3[2] 1:CMD_BUFF3[1] 0:CMD_BUFF3[0] @ xreg_base+0x73
f xreg.CMD_BUFF4 1 @ xreg_base+0x74
CCu 7:CMD_BUFF4[7] 6:CMD_BUFF4[6] 5:CMD_BUFF4[5] 4:CMD_BUFF4[4] 3:CMD_BUFF4[3] 2:CMD_BUFF4[2] 1:CMD_BUFF4[1] 0:CMD_BUFF4[0] @ xreg_base+0x74
f xreg.CMD_BUFF5 1 @ xreg_base+0x75
CCu 7:CMD_BUFF5[7] 6:CMD_BUFF5[6] 5:CMD_BUFF5[5] 4:CMD_BUFF5[4] 3:CMD_BUFF5[3] 2:CMD_BUFF5[2] 1:CMD_BUFF5[1] 0:CMD_BUFF5[0] @ xreg_base+0x75
f xreg.CMD_BUFF6 1 @ xreg_base+0x76
CCu 7:CMD_BUFF6[7] 6:CMD_BUFF6[6] 5:CMD_BUFF6[5] 4:CMD_BUFF6[4] 3:CMD_BUFF6[3] 2:CMD_BUFF6[2] 1:CMD_BUFF6[1] 0:CMD_BUFF6[0] @ xreg_base+0x76
f xreg.CMD_BUFF7 1 @ xreg_base+0x77
CCu 7:CMD_BUFF7[7] 6:CMD_BUFF7[6] 5:CMD_BUFF7[5] 4:CMD_BUFF7[4] 3:CMD_BUFF7[3] 2:CMD_BUFF7[2] 1:CMD_BUFF7[1] 0:CMD_BUFF7[0] @ xreg_base+0x77
f xreg.CMD_BUFF8 1 @ xreg_base+0x78
CCu 7:CMD_BUFF8[7] 6:CMD_BUFF8[6] 5:CMD_BUFF8[5] 4:CMD_BUFF8[4] 3:CMD_BUFF8[3] 2:CMD_BUFF8[2] 1:CMD_BUFF8[1] 0:CMD_BUFF8[0] @ xreg_base+0x78
f xreg.CMD_BUFF9 1 @ xreg_base+0x79
CCu 7:CMD_BUFF9[7] 6:CMD_BUFF9[6] 5:CMD_BUFF9[5] 4:CMD_BUFF9[4] 3:CMD_BUFF9[3] 2:CMD_BUFF9[2] 1:CMD_BUFF9[1] 0:CMD_BUFF9[0] @ xreg_base+0x79
f xreg.CMD_BUFF10 1 @ xreg_base+0x7A
CCu 7:CMD_BUFF10[7] 6:CMD_BUFF10[6] 5:CMD_BUFF10[5] 4:CMD_BUFF10[4] 3:CMD_BUFF10[3] 2:CMD_BUFF10[2] 1:CMD_BUFF10[1] 0:CMD_BUFF10[0] @ xreg_base+0x7A
f xreg.CMD_BUFF11 1 @ xreg_base+0x7B
CCu 7:CMD_BUFF11[7] 6:CMD_BUFF11[6] 5:CMD_BUFF11[5] 4:CMD_BUFF11[4] 3:CMD_BUFF11[3] 2:CMD_BUFF11[2] 1:CMD_BUFF11[1] 0:CMD_BUFF11[0] @ xreg_base+0x7B
f xreg.CMD_BUFF12 1 @ xreg_base+0x7C
CCu 7:CMD_BUFF12[7] 6:CMD_BUFF12[6] 5:CMD_BUFF12[5] 4:CMD_BUFF12[4] 3:CMD_BUFF12[3] 2:CMD_BUFF12[2] 1:CMD_BUFF12[1] 0:CMD_BUFF12[0] @ xreg_base+0x7C
f xreg.CMD_BUFF13 1 @ xreg_base+0x7D
CCu 7:CMD_BUFF13[7] 6:CMD_BUFF13[6] 5:CMD_BUFF13[5] 4:CMD_BUFF13[4] 3:CMD_BUFF13[3] 2:CMD_BUFF13[2] 1:CMD_BUFF13[1] 0:CMD_BUFF13[0] @ xreg_base+0x7D
f xreg.CMD_BUFF14 1 @ xreg_base+0x7E
CCu 7:CMD_BUFF14[7] 6:CMD_BUFF14[6] 5:CMD_BUFF14[5] 4:CMD_BUFF14[4] 3:CMD_BUFF14[3] 2:CMD_BUFF14[2] 1:CMD_BUFF14[1] 0:CMD_BUFF14[0] @ xreg_base+0x7E
f xreg.CMD_BUFF15 1 @ xreg_base+0x7F
CCu 7:CMD_BUFF15[7] 6:CMD_BUFF15[6] 5:CMD_BUFF15[5] 4:CMD_BUFF15[4] 3:CMD_BUFF15[3] 2:CMD_BUFF15[2] 1:CMD_BUFF15[1] 0:CMD_BUFF15[0] @ xreg_base+0x7F
f xreg.FAST_RES_A 1 @ xreg_base+0x80
CCu 7:FAST_RES_A[7] 6:FAST_RES_A[6] 5:FAST_RES_A[5] 4:FAST_RES_A[4] 3:FAST_RES_A[3] 2:FAST_RES_A[2] 1:FAST_RES_A[1] 0:FAST_RES_A[0] @ xreg_base+0x80
f xreg.FAST_RES_B 1 @ xreg_base+0x81
CCu 7:FAST_RES_B[7] 6:FAST_RES_B[6] 5:FAST_RES_B[5] 4:FAST_RES_B[4] 3:FAST_RES_B[3] 2:FAST_RES_B[2] 1:FAST_RES_B[1] 0:FAST_RES_B[0] @ xreg_base+0x81
f xreg.FAST_RES_C 1 @ xreg_base+0x82
CCu 7:FAST_RES_C[7] 6:FAST_RES_C[6] 5:FAST_RES_C[5] 4:FAST_RES_C[4] 3:FAST_RES_C[3] 2:FAST_RES_C[2] 1:FAST_RES_C[1] 0:FAST_RES_C[0] @ xreg_base+0x82
f xreg.FAST_RES_D 1 @ xreg_base+0x83
CCu 7:FAST_RES_D[7] 6:FAST_RES_D[6] 5:FAST_RES_D[5] 4:FAST_RES_D[4] 3:FAST_RES_D[3] 2:FAST_RES_D[2] 1:FAST_RES_D[1] 0:FAST_RES_D[0] @ xreg_base+0x83
f xreg.CTS 1 @ xreg_base+0x84
CCu 7:CTS[7] 6:CTS[6] 5:CTS[5] 4:CTS[4] 3:CTS[3] 2:CTS[2] 1:CTS[1] 0:CTS[0] @ xreg_base+0x84
f xreg.SPI_STATUS 1 @ xreg_base+0x85
CCu 7:WARM_BOOT 4:FAST_PEND 3:NEW_COMMAND 2:SPI_LLRAM_OVERLAY 1:UNDERRUN 0:OVERWRITE @ xreg_base+0x85
f xreg.CURR_OPCODE 1 @ xreg_base+0x86
CCu 7:CURR_OPCODE[7] 6:CURR_OPCODE[6] 5:CURR_OPCODE[5] 4:CURR_OPCODE[4] 3:CURR_OPCODE[3] 2:CURR_OPCODE[2] 1:CURR_OPCODE[1] 0:CURR_OPCODE[0] @ xreg_base+0x86
f xreg.DMAWR_WRPNT_LSB 1 @ xreg_base+0x87
CCu 7:DMAWR_WRPNT[7] 6:DMAWR_WRPNT[6] 5:DMAWR_WRPNT[5] 4:DMAWR_WRPNT[4] 3:DMAWR_WRPNT[3] 2:DMAWR_WRPNT[2] 1:DMAWR_WRPNT[1] 0:DMAWR_WRPNT[0] @ xreg_base+0x87
f xreg.DMARD_WRPNT_LSB 1 @ xreg_base+0x88
CCu 7:DMARD_WRPNT[7] 6:DMARD_WRPNT[6] 5:DMARD_WRPNT[5] 4:DMARD_WRPNT[4] 3:DMARD_WRPNT[3] 2:DMARD_WRPNT[2] 1:DMARD_WRPNT[1] 0:DMARD_WRPNT[0] @ xreg_base+0x88
f xreg.DMA_WRPNT_MSBS 1 @ xreg_base+0x89
CCu 6:DMAWR_WRPNT[10] 5:DMAWR_WRPNT[9] 4:DMAWR_WRPNT[8] 2:DMARD_WRPNT[10] 1:DMARD_WRPNT[9] 0:DMARD_WRPNT[8] @ xreg_base+0x89
f xreg.DMAWR_BASE_LSB 1 @ xreg_base+0x8A
CCu 7:DMAWR_BASE[7] 6:DMAWR_BASE[6] 5:DMAWR_BASE[5] 4:DMAWR_BASE[4] 3:DMAWR_BASE[3] 2:DMAWR_BASE[2] 1:DMAWR_BASE[1] 0:DMAWR_BASE[0] @ xreg_base+0x8A
f xreg.DMARD_BASE_LSB 1 @ xreg_base+0x8B
CCu 7:DMARD_BASE[7] 6:DMARD_BASE[6] 5:DMARD_BASE[5] 4:DMARD_BASE[4] 3:DMARD_BASE[3] 2:DMARD_BASE[2] 1:DMARD_BASE[1] 0:DMARD_BASE[0] @ xreg_base+0x8B
f xreg.DMA_BASE_MSBS 1 @ xreg_base+0x8C
CCu 7:DMAWR_BASE[11] 6:DMAWR_BASE[10] 5:DMAWR_BASE[9] 4:DMAWR_BASE[8] 3:DMARD_BASE[11] 2:DMARD_BASE[10] 1:DMARD_BASE[9] 0:DMARD_BASE[8] @ xreg_base+0x8C
f xreg.DMAWR_LIMIT_LSB 1 @ xreg_base+0x8D
CCu 7:DMAWR_LIMIT[7] 6:DMAWR_LIMIT[6] 5:DMAWR_LIMIT[5] 4:DMAWR_LIMIT[4] 3:DMAWR_LIMIT[3] 2:DMAWR_LIMIT[2] 1:DMAWR_LIMIT[1] 0:DMAWR_LIMIT[0] @ xreg_base+0x8D
f xreg.DMARD_LIMIT_LSB 1 @ xreg_base+0x8E
CCu 7:DMARD_LIMIT[7] 6:DMARD_LIMIT[6] 5:DMARD_LIMIT[5] 4:DMARD_LIMIT[4] 3:DMARD_LIMIT[3] 2:DMARD_LIMIT[2] 1:DMARD_LIMIT[1] 0:DMARD_LIMIT[0] @ xreg_base+0x8E
f xreg.DMARD_LIMIT_MSB 1 @ xreg_base+0x8F
CCu 2:DMARD_LIMIT[10] 1:DMARD_LIMIT[9] 0:DMARD_LIMIT[8] @ xreg_base+0x8F
f xreg.SPI_CMD_STATUS 1 @ xreg_base+0x91
CCu 7:CMD_BUF_CLEAN 6:SPI_ACTIVE 5:CMD_ERROR 4:CMD_COUNT[4] 3:CMD_COUNT[3] 2:CMD_COUNT[2] 1:CMD_COUNT[1] 0:CMD_COUNT[0] @ xreg_base+0x91
f xreg.DMAWR_LIMIT_MSB 1 @ xreg_base+0x92
CCu 2:DMAWR_LIMIT[10] 1:DMAWR_LIMIT[9] 0:DMAWR_LIMIT[8] @ xreg_base+0x92
f xreg.VCO_CNT1 1 @ xreg_base+0x93
CCu 7:T_VCO_CNT1[7] 6:T_VCO_CNT1[6] 5:T_VCO_CNT1[5] 4:T_VCO_CNT1[4] 3:T_VCO_CNT1[3] 2:T_VCO_CNT1[2] 1:T_VCO_CNT1[1] 0:T_VCO_CNT1[0] @ xreg_base+0x93
f xreg.VCO_CNT0 1 @ xreg_base+0x94
CCu 7:T_VCO_CNT0[7] 6:T_VCO_CNT0[6] 5:T_VCO_CNT0[5] 4:T_VCO_CNT0[4] 3:T_VCO_CNT0[3] 2:T_VCO_CNT0[2] 1:T_VCO_CNT0[1] 0:T_VCO_CNT0[0] @ xreg_base+0x94
f xreg.W_SIZE 1 @ xreg_base+0x95
CCu 7:W_SIZE[7] 6:W_SIZE[6] 5:W_SIZE[5] 4:W_SIZE[4] 3:W_SIZE[3] 2:W_SIZE[2] 1:W_SIZE[1] 0:W_SIZE[0] @ xreg_base+0x95
f xreg.VCO_CAP1 1 @ xreg_base+0x96
CCu 7:VCO_CAP[10] 6:VCO_CAP[9] 5:VCO_CAP[8] 4:VCO_CAP[7] 3:VCO_CAP[6] 2:VCO_CAP[5] 1:VCO_CAP[4] 0:VCO_CAP[3] @ xreg_base+0x96
f xreg.VCO_CAP0 1 @ xreg_base+0x97
CCu 3:VCO_CAP[2] 2:VCO_CAP[1] 1:VCO_CAP[0] 0:VCO_CAP_MSB @ xreg_base+0x97
f xreg.V_CFG 1 @ xreg_base+0x98
CCu 7:START_CAL_FROM[3] 6:START_CAL_FROM[2] 5:START_CAL_FROM[1] 4:START_CAL_FROM[0] 3:Abort 2:Run_once 1:Calc_new_cap 0:Vco_stat @ xreg_base+0x98
f xreg.IO_SEL0 1 @ xreg_base+0x99
CCu 6:odrv_str_gpio0[1] 5:odrv_str_gpio0[0] 4:GPIO0_SEL[4] 3:GPIO0_SEL[3] 2:GPIO0_SEL[2] 1:GPIO0_SEL[1] 0:GPIO0_SEL[0] @ xreg_base+0x99
f xreg.IO_SEL1 1 @ xreg_base+0x9A
CCu 6:odrv_str_gpio1[1] 5:odrv_str_gpio1[0] 4:GPIO1_SEL[4] 3:GPIO1_SEL[3] 2:GPIO1_SEL[2] 1:GPIO1_SEL[1] 0:GPIO1_SEL[0] @ xreg_base+0x9A
f xreg.IO_SEL2 1 @ xreg_base+0x9B
CCu 6:odrv_str_gpio2[1] 5:odrv_str_gpio2[0] 4:GPIO2_SEL[4] 3:GPIO2_SEL[3] 2:GPIO2_SEL[2] 1:GPIO2_SEL[1] 0:GPIO2_SEL[0] @ xreg_base+0x9B
f xreg.IO_SEL3 1 @ xreg_base+0x9C
CCu 6:odrv_str_gpio3[1] 5:odrv_str_gpio3[0] 4:GPIO3_SEL[4] 3:GPIO3_SEL[3] 2:GPIO3_SEL[2] 1:GPIO3_SEL[1] 0:GPIO3_SEL[0] @ xreg_base+0x9C
f xreg.IO_SDO 1 @ xreg_base+0x9D
CCu 6:odrv_str_sdo[1] 5:odrv_str_sdo[0] 4:SDO_SEL[4] 3:SDO_SEL[3] 2:SDO_SEL[2] 1:SDO_SEL[1] 0:SDO_SEL[0] @ xreg_base+0x9D
f xreg.IO_NIRQ 1 @ xreg_base+0x9E
CCu 6:odrv_str_nirq[1] 5:odrv_str_nirq[0] 4:NIRQ_SEL[4] 3:NIRQ_SEL[3] 2:NIRQ_SEL[2] 1:NIRQ_SEL[1] 0:NIRQ_SEL[0] @ xreg_base+0x9E
f xreg.ANT_CFG 1 @ xreg_base+0x9F
CCu 6:lna_sw_ctrl[2] 5:lna_sw_ctrl[1] 4:lna_sw_ctrl[0] 2:ant_sw_ctrl[2] 1:ant_sw_ctrl[1] 0:ant_sw_ctrl[0] @ xreg_base+0x9F
f xreg.DIR_TX_DATA_SEL 1 @ xreg_base+0xA0
CCu 3:dir_mod_tx_data_sel[3] 2:dir_mod_tx_data_sel[2] 1:dir_mod_tx_data_sel[1] 0:dir_mod_tx_data_sel[0] @ xreg_base+0xA0
f xreg.IO_ASEL 1 @ xreg_base+0xA1
CCu 7:asel_gpio3[1] 6:asel_gpio3[0] 5:asel_gpio2[1] 4:asel_gpio2[0] 3:asel_gpio1[1] 2:asel_gpio1[0] 1:asel_gpio0[1] 0:asel_gpio0[0] @ xreg_base+0xA1
f xreg.HV_GPIO0_CTRL 1 @ xreg_base+0xA2
CCu 7:en_pup_gpio0 6:pd_ioa_gpio0 5:pd_odrv_gpio0 4:pd_idrv_gpio0 3:gpio0_ctrl[3] 2:gpio0_ctrl[2] 1:gpio0_ctrl[1] 0:gpio0_ctrl[0] @ xreg_base+0xA2
f xreg.HV_GPIO1_CTRL 1 @ xreg_base+0xA3
CCu 7:en_pup_gpio1 6:pd_ioa_gpio1 5:pd_odrv_gpio1 4:pd_idrv_gpio1 3:gpio1_ctrl[3] 2:gpio1_ctrl[2] 1:gpio1_ctrl[1] 0:gpio1_ctrl[0] @ xreg_base+0xA3
f xreg.HV_GPIO2_CTRL 1 @ xreg_base+0xA4
CCu 7:en_pup_gpio2 6:pd_ioa_gpio2 5:pd_odrv_gpio2 4:pd_idrv_gpio2 3:gpio2_ctrl[3] 2:gpio2_ctrl[2] 1:gpio2_ctrl[1] 0:gpio2_ctrl[0] @ xreg_base+0xA4
f xreg.HV_GPIO3_CTRL 1 @ xreg_base+0xA5
CCu 7:en_pup_gpio3 6:pd_ioa_gpio3 5:pd_odrv_gpio3 4:pd_idrv_gpio3 3:gpio3_ctrl[3] 2:gpio3_ctrl[2] 1:gpio3_ctrl[1] 0:gpio3_ctrl[0] @ xreg_base+0xA5
f xreg.HV_SDO_CTRL 1 @ xreg_base+0xA6
CCu 7:en_pup_sdo 5:pd_odrv_sdo 4:pd_idrv_sdo 2:sdo_ctrl[2] 1:sdo_ctrl[1] 0:sdo_ctrl[0] @ xreg_base+0xA6
f xreg.HV_NIRQ_CTRL 1 @ xreg_base+0xA7
CCu 7:en_pup_nirq 5:pd_odrv_nirq 2:nirq_ctrl[2] 1:nirq_ctrl[1] 0:nirq_ctrl[0] @ xreg_base+0xA7
f xreg.HV_IOIN_READ 1 @ xreg_base+0xA8
CCu 7:i_sck 6:i_sdi 5:i_sdo 4:i_nsel 3:i_gpio3 2:i_gpio2 1:i_gpio1 0:i_gpio0 @ xreg_base+0xA8
f xreg.HV_IOOUT_READ 1 @ xreg_base+0xA9
CCu 7:o_nirq 5:o_sdo 4:i_cts1 3:o_gpio3 2:o_gpio2 1:o_gpio1 0:o_gpio0 @ xreg_base+0xA9
f xreg.HV_MISC0_CTRL 1 @ xreg_base+0xAA
CCu 4:pdacfg_mi 3:pdacfg_tx 2:pdacfg_rx 1:pdacfg_sy 0:pdacfg_32k @ xreg_base+0xAA
f xreg.HV_MISC1_CTRL 1 @ xreg_base+0xAB
CCu 6:hv_spare_high_0 5:hv_spare_low_0 4:rst_acfg_mi 3:rst_acfg_tx 2:rst_acfg_rx 1:rst_acfg_sy 0:rst_acfg_32k @ xreg_base+0xAB
f xreg.HV_MISC2_CTRL 1 @ xreg_base+0xAC
CCu 7:sel32xo 6:en_rc32k 5:en_xo32k 4:bypass_reg_ram 3:enreg_ram 2:enreg_vbattx 1:enreg_vbatd 0:enreg_vbata @ xreg_base+0xAC
f xreg.HV_SDO_IDLE 1 @ xreg_base+0xAD
CCu 6:hv_spare_high_1 5:hv_spare_low_1 4:en_pup_sclk 3:en_pup_sdi 2:en_ioclk32k 1:sdo_out_def_val 0:auto_sdo @ xreg_base+0xAD
f xreg.TEST_GPIO0 1 @ xreg_base+0xAE
CCu 5:TEST_GPIO0[5] 4:TEST_GPIO0[4] 3:TEST_GPIO0[3] 2:TEST_GPIO0[2] 1:TEST_GPIO0[1] 0:TEST_GPIO0[0] @ xreg_base+0xAE
f xreg.TEST_GPIO1 1 @ xreg_base+0xAF
CCu 5:TEST_GPIO1[5] 4:TEST_GPIO1[4] 3:TEST_GPIO1[3] 2:TEST_GPIO1[2] 1:TEST_GPIO1[1] 0:TEST_GPIO1[0] @ xreg_base+0xAF
f xreg.TEST_GPIO2 1 @ xreg_base+0xB0
CCu 5:TEST_GPIO2[5] 4:TEST_GPIO2[4] 3:TEST_GPIO2[3] 2:TEST_GPIO2[2] 1:TEST_GPIO2[1] 0:TEST_GPIO2[0] @ xreg_base+0xB0
f xreg.TEST_NIRQ 1 @ xreg_base+0xB1
CCu 5:TEST_NIRQ[5] 4:TEST_NIRQ[4] 3:TEST_NIRQ[3] 2:TEST_NIRQ[2] 1:TEST_NIRQ[1] 0:TEST_NIRQ[0] @ xreg_base+0xB1
f xreg.TEST_GPIO3 1 @ xreg_base+0xB2
CCu 5:TEST_GPIO3[5] 4:TEST_GPIO3[4] 3:TEST_GPIO3[3] 2:TEST_GPIO3[2] 1:TEST_GPIO3[1] 0:TEST_GPIO3[0] @ xreg_base+0xB2
f xreg.TEST_SDO 1 @ xreg_base+0xB3
CCu 5:TEST_SDO[5] 4:TEST_SDO[4] 3:TEST_SDO[3] 2:TEST_SDO[2] 1:TEST_SDO[1] 0:TEST_SDO[0] @ xreg_base+0xB3
f xreg.MOD_4FSK_PH_2FSK 1 @ xreg_base+0xB4
CCu 7:MINUS_3_LEVEL_MAP[1] 6:MINUS_3_LEVEL_MAP[0] 5:MINUS_1_LEVEL_MAP[1] 4:MINUS_1_LEVEL_MAP[0] 3:PLUS_1_LEVEL_MAP[1] 2:PLUS_1_LEVEL_MAP[0] 1:PLUS_3_LEVEL_MAP[1] 0:PLUS_3_LEVEL_MAP[0] @ xreg_base+0xB4
f xreg.CRC1_POLYNOM_1 1 @ xreg_base+0xB5
CCu 7:CRC1_POLYNOM[7] 6:CRC1_POLYNOM[6] 5:CRC1_POLYNOM[5] 4:CRC1_POLYNOM[4] 3:CRC1_POLYNOM[3] 2:CRC1_POLYNOM[2] 1:CRC1_POLYNOM[1] 0:CRC1_POLYNOM[0] @ xreg_base+0xB5
f xreg.CRC1_POLYNOM_2 1 @ xreg_base+0xB6
CCu 7:CRC1_POLYNOM[15] 6:CRC1_POLYNOM[14] 5:CRC1_POLYNOM[13] 4:CRC1_POLYNOM[12] 3:CRC1_POLYNOM[11] 2:CRC1_POLYNOM[10] 1:CRC1_POLYNOM[9] 0:CRC1_POLYNOM[8] @ xreg_base+0xB6
f xreg.CRC1_SEED_1 1 @ xreg_base+0xB7
CCu 7:CRC1_SEED[7] 6:CRC1_SEED[6] 5:CRC1_SEED[5] 4:CRC1_SEED[4] 3:CRC1_SEED[3] 2:CRC1_SEED[2] 1:CRC1_SEED[1] 0:CRC1_SEED[0] @ xreg_base+0xB7
f xreg.CRC1_SEED_2 1 @ xreg_base+0xB8
CCu 7:CRC1_SEED[15] 6:CRC1_SEED[14] 5:CRC1_SEED[13] 4:CRC1_SEED[12] 3:CRC1_SEED[11] 2:CRC1_SEED[10] 1:CRC1_SEED[9] 0:CRC1_SEED[8] @ xreg_base+0xB8
f xreg.CRC1_RESULT_1 1 @ xreg_base+0xB9
CCu 7:CRC1_RESULT[7] 6:CRC1_RESULT[6] 5:CRC1_RESULT[5] 4:CRC1_RESULT[4] 3:CRC1_RESULT[3] 2:CRC1_RESULT[2] 1:CRC1_RESULT[1] 0:CRC1_RESULT[0] @ xreg_base+0xB9
f xreg.CRC1_RESULT_2 1 @ xreg_base+0xBA
CCu 7:CRC1_RESULT[15] 6:CRC1_RESULT[14] 5:CRC1_RESULT[13] 4:CRC1_RESULT[12] 3:CRC1_RESULT[11] 2:CRC1_RESULT[10] 1:CRC1_RESULT[9] 0:CRC1_RESULT[8] @ xreg_base+0xBA
f xreg.CRC2_POLYNOM_1 1 @ xreg_base+0xBB
CCu 7:CRC2_POLYNOM[7] 6:CRC2_POLYNOM[6] 5:CRC2_POLYNOM[5] 4:CRC2_POLYNOM[4] 3:CRC2_POLYNOM[3] 2:CRC2_POLYNOM[2] 1:CRC2_POLYNOM[1] 0:CRC2_POLYNOM[0] @ xreg_base+0xBB
f xreg.CRC2_POLYNOM_2 1 @ xreg_base+0xBC
CCu 7:CRC2_POLYNOM[15] 6:CRC2_POLYNOM[14] 5:CRC2_POLYNOM[13] 4:CRC2_POLYNOM[12] 3:CRC2_POLYNOM[11] 2:CRC2_POLYNOM[10] 1:CRC2_POLYNOM[9] 0:CRC2_POLYNOM[8] @ xreg_base+0xBC
f xreg.CRC2_POLYNOM_3 1 @ xreg_base+0xBD
CCu 7:CRC2_POLYNOM[23] 6:CRC2_POLYNOM[22] 5:CRC2_POLYNOM[21] 4:CRC2_POLYNOM[20] 3:CRC2_POLYNOM[19] 2:CRC2_POLYNOM[18] 1:CRC2_POLYNOM[17] 0:CRC2_POLYNOM[16] @ xreg_base+0xBD
f xreg.CRC2_POLYNOM_4 1 @ xreg_base+0xBE
CCu 7:CRC2_POLYNOM[31] 6:CRC2_POLYNOM[30] 5:CRC2_POLYNOM[29] 4:CRC2_POLYNOM[28] 3:CRC2_POLYNOM[27] 2:CRC2_POLYNOM[26] 1:CRC2_POLYNOM[25] 0:CRC2_POLYNOM[24] @ xreg_base+0xBE
f xreg.CRC2_SEED_1 1 @ xreg_base+0xBF
CCu 7:CRC2_SEED[7] 6:CRC2_SEED[6] 5:CRC2_SEED[5] 4:CRC2_SEED[4] 3:CRC2_SEED[3] 2:CRC2_SEED[2] 1:CRC2_SEED[1] 0:CRC2_SEED[0] @ xreg_base+0xBF
f xreg.CRC2_SEED_2 1 @ xreg_base+0xC0
CCu 7:CRC2_SEED[15] 6:CRC2_SEED[14] 5:CRC2_SEED[13] 4:CRC2_SEED[12] 3:CRC2_SEED[11] 2:CRC2_SEED[10] 1:CRC2_SEED[9] 0:CRC2_SEED[8] @ xreg_base+0xC0
f xreg.CRC2_SEED_3 1 @ xreg_base+0xC1
CCu 7:CRC2_SEED[23] 6:CRC2_SEED[22] 5:CRC2_SEED[21] 4:CRC2_SEED[20] 3:CRC2_SEED[19] 2:CRC2_SEED[18] 1:CRC2_SEED[17] 0:CRC2_SEED[16] @ xreg_base+0xC1
f xreg.CRC2_SEED_4 1 @ xreg_base+0xC2
CCu 7:CRC2_SEED[31] 6:CRC2_SEED[30] 5:CRC2_SEED[29] 4:CRC2_SEED[28] 3:CRC2_SEED[27] 2:CRC2_SEED[26] 1:CRC2_SEED[25] 0:CRC2_SEED[24] @ xreg_base+0xC2
f xreg.CRC2_RESULT_1 1 @ xreg_base+0xC3
CCu 7:CRC2_RESULT[7] 6:CRC2_RESULT[6] 5:CRC2_RESULT[5] 4:CRC2_RESULT[4] 3:CRC2_RESULT[3] 2:CRC2_RESULT[2] 1:CRC2_RESULT[1] 0:CRC2_RESULT[0] @ xreg_base+0xC3
f xreg.CRC2_RESULT_2 1 @ xreg_base+0xC4
CCu 7:CRC2_RESULT[15] 6:CRC2_RESULT[14] 5:CRC2_RESULT[13] 4:CRC2_RESULT[12] 3:CRC2_RESULT[11] 2:CRC2_RESULT[10] 1:CRC2_RESULT[9] 0:CRC2_RESULT[8] @ xreg_base+0xC4
f xreg.CRC2_RESULT_3 1 @ xreg_base+0xC5
CCu 7:CRC2_RESULT[23] 6:CRC2_RESULT[22] 5:CRC2_RESULT[21] 4:CRC2_RESULT[20] 3:CRC2_RESULT[19] 2:CRC2_RESULT[18] 1:CRC2_RESULT[17] 0:CRC2_RESULT[16] @ xreg_base+0xC5
f xreg.CRC2_RESULT_4 1 @ xreg_base+0xC6
CCu 7:CRC2_RESULT[31] 6:CRC2_RESULT[30] 5:CRC2_RESULT[29] 4:CRC2_RESULT[28] 3:CRC2_RESULT[27] 2:CRC2_RESULT[26] 1:CRC2_RESULT[25] 0:CRC2_RESULT[24] @ xreg_base+0xC6
f xreg.PN_POLYNOM_1 1 @ xreg_base+0xC7
CCu 7:PN_POLYNOM[7] 6:PN_POLYNOM[6] 5:PN_POLYNOM[5] 4:PN_POLYNOM[4] 3:PN_POLYNOM[3] 2:PN_POLYNOM[2] 1:PN_POLYNOM[1] 0:PN_POLYNOM[0] @ xreg_base+0xC7
f xreg.PN_POLYNOM_2 1 @ xreg_base+0xC8
CCu 7:PN_POLYNOM[15] 6:PN_POLYNOM[14] 5:PN_POLYNOM[13] 4:PN_POLYNOM[12] 3:PN_POLYNOM[11] 2:PN_POLYNOM[10] 1:PN_POLYNOM[9] 0:PN_POLYNOM[8] @ xreg_base+0xC8
f xreg.PN_SEED_1 1 @ xreg_base+0xC9
CCu 7:PN_SEED[7] 6:PN_SEED[6] 5:PN_SEED[5] 4:PN_SEED[4] 3:PN_SEED[3] 2:PN_SEED[2] 1:PN_SEED[1] 0:PN_SEED[0] @ xreg_base+0xC9
f xreg.PN_SEED_2 1 @ xreg_base+0xCA
CCu 7:PN_SEED[15] 6:PN_SEED[14] 5:PN_SEED[13] 4:PN_SEED[12] 3:PN_SEED[11] 2:PN_SEED[10] 1:PN_SEED[9] 0:PN_SEED[8] @ xreg_base+0xCA
f xreg.PN_BIT_NUM_TO_USE 1 @ xreg_base+0xCB
CCu 7:POSTAMBLE_LEN[3] 6:POSTAMBLE_LEN[2] 5:POSTAMBLE_LEN[1] 4:POSTAMBLE_LEN[0] 3:PN_BIT_NUM_TO_USE[3] 2:PN_BIT_NUM_TO_USE[2] 1:PN_BIT_NUM_TO_USE[1] 0:PN_BIT_NUM_TO_USE[0] @ xreg_base+0xCB
f xreg.PREAM_LENGTH 1 @ xreg_base+0xCC
CCu 7:PREAM_LENGTH[7] 6:PREAM_LENGTH[6] 5:PREAM_LENGTH[5] 4:PREAM_LENGTH[4] 3:PREAM_LENGTH[3] 2:PREAM_LENGTH[2] 1:PREAM_LENGTH[1] 0:PREAM_LENGTH[0] @ xreg_base+0xCC
f xreg.PREAM_CONFIG_1 1 @ xreg_base+0xCD
CCu 7:PREAM_MAN_CONST_1_OR_0 6:PREAM_1010 5:PREAM_0101 4:PREAM_MAN_EN 3:PREAM_FIRST_1_OR_0 2:EN_3OUT6 1:PREAM_LEN_UNIT 0:PREAM_LENGTH[8] @ xreg_base+0xCD
f xreg.PREAM_CONFIG_2 1 @ xreg_base+0xCE
CCu 7:PREAM_NUM_ERRORS_ALWD[2] 6:PREAM_NUM_ERRORS_ALWD[1] 5:PREAM_NUM_ERRORS_ALWD[0] 4:PREAM_PATTERN_LENGTH[4] 3:PREAM_PATTERN_LENGTH[3] 2:PREAM_PATTERN_LENGTH[2] 1:PREAM_PATTERN_LENGTH[1] 0:PREAM_PATTERN_LENGTH[0] @ xreg_base+0xCE
f xreg.PREAM_WORD_1 1 @ xreg_base+0xCF
CCu 7:PREAM_WORD[7] 6:PREAM_WORD[6] 5:PREAM_WORD[5] 4:PREAM_WORD[4] 3:PREAM_WORD[3] 2:PREAM_WORD[2] 1:PREAM_WORD[1] 0:PREAM_WORD[0] @ xreg_base+0xCF
f xreg.PREAM_WORD_2 1 @ xreg_base+0xD0
CCu 7:PREAM_WORD[15] 6:PREAM_WORD[14] 5:PREAM_WORD[13] 4:PREAM_WORD[12] 3:PREAM_WORD[11] 2:PREAM_WORD[10] 1:PREAM_WORD[9] 0:PREAM_WORD[8] @ xreg_base+0xD0
f xreg.PREAM_WORD_3 1 @ xreg_base+0xD1
CCu 7:PREAM_WORD[23] 6:PREAM_WORD[22] 5:PREAM_WORD[21] 4:PREAM_WORD[20] 3:PREAM_WORD[19] 2:PREAM_WORD[18] 1:PREAM_WORD[17] 0:PREAM_WORD[16] @ xreg_base+0xD1
f xreg.PREAM_WORD_4 1 @ xreg_base+0xD2
CCu 7:PREAM_WORD[31] 6:PREAM_WORD[30] 5:PREAM_WORD[29] 4:PREAM_WORD[28] 3:PREAM_WORD[27] 2:PREAM_WORD[26] 1:PREAM_WORD[25] 0:PREAM_WORD[24] @ xreg_base+0xD2
f xreg.SYNC_CONFIG 1 @ xreg_base+0xD3
CCu 7:SYNC_ALLOW_ERRORS_BEGINING_ONLY 6:SYNC_NUM_ERRORS_ALWD[2] 5:SYNC_NUM_ERRORS_ALWD[1] 4:SYNC_NUM_ERRORS_ALWD[0] 3:SYNC_4FSK_EN 2:SYNC_MAN_EN 1:DUAL_SYNC_EN @ xreg_base+0xD3
f xreg.SYNC1_WORD_1 1 @ xreg_base+0xD4
CCu 7:SYNC1_WORD[7] 6:SYNC1_WORD[6] 5:SYNC1_WORD[5] 4:SYNC1_WORD[4] 3:SYNC1_WORD[3] 2:SYNC1_WORD[2] 1:SYNC1_WORD[1] 0:SYNC1_WORD[0] @ xreg_base+0xD4
f xreg.SYNC1_WORD_2 1 @ xreg_base+0xD5
CCu 7:SYNC1_WORD[15] 6:SYNC1_WORD[14] 5:SYNC1_WORD[13] 4:SYNC1_WORD[12] 3:SYNC1_WORD[11] 2:SYNC1_WORD[10] 1:SYNC1_WORD[9] 0:SYNC1_WORD[8] @ xreg_base+0xD5
f xreg.SYNC1_WORD_3 1 @ xreg_base+0xD6
CCu 7:SYNC1_WORD[23] 6:SYNC1_WORD[22] 5:SYNC1_WORD[21] 4:SYNC1_WORD[20] 3:SYNC1_WORD[19] 2:SYNC1_WORD[18] 1:SYNC1_WORD[17] 0:SYNC1_WORD[16] @ xreg_base+0xD6
f xreg.SYNC1_WORD_4 1 @ xreg_base+0xD7
CCu 7:SYNC1_WORD[31] 6:SYNC1_WORD[30] 5:SYNC1_WORD[29] 4:SYNC1_WORD[28] 3:SYNC1_WORD[27] 2:SYNC1_WORD[26] 1:SYNC1_WORD[25] 0:SYNC1_WORD[24] @ xreg_base+0xD7
f xreg.PH_TEST 1 @ xreg_base+0xD8
CCu 4:TEST_PN_AS_DATA_SOURCE 2:ZERO_IF_EN 1:TEST_BUS_MUX[1] 0:TEST_BUS_MUX[0] @ xreg_base+0xD8
f xreg.SY_CTL1 1 @ xreg_base+0xD9
CCu 7:tx_bclk_en 6:rx_bclk_en 5:en_vtr_sy 3:pd_fbdiv 2:enreg_fbdiv 1:pd_clkgen 0:enreg_clkgen @ xreg_base+0xD9
f xreg.SY_CTL2 1 @ xreg_base+0xDA
CCu 7:pll_stl_aid 6:pd_lpfilt 5:pd_pfdcp 4:enreg_cplf 2:center_vco 1:pd_vco 0:enreg_vco @ xreg_base+0xDA
f xreg.TX_CTL 1 @ xreg_base+0xDB
CCu 4:en_txramp 3:en_vtr_rx 2:en_vtr_tx 1:enreg_tx2 0:enreg_tx1 @ xreg_base+0xDB
f xreg.RXFE_CTL 1 @ xreg_base+0xDC
CCu 7:pd_adc 6:enreg_adc 5:pd_ifpkd 4:pd_rfpkd 3:pd_pga 2:pd_mix 1:pd_lna 0:enreg_rxfe @ xreg_base+0xDC
f xreg.BP_CTL1 1 @ xreg_base+0xDD
CCu 5:bypass_reg_rxfe 4:bypass_reg_adc 2:bypass_reg_cplf 1:bypass_reg_fbdiv 0:bypass_reg_clkgen @ xreg_base+0xDD
f xreg.BP_CTL2 1 @ xreg_base+0xDE
CCu 1:bypass_reg_tx2 0:bypass_reg_tx1 @ xreg_base+0xDE
f xreg.ANA_MISC1 1 @ xreg_base+0xDF
CCu 7:apc_ovld_pa 6:pad_ov_pa 4:en_auxadc 3:cmpout_refcal 1:cmplatch_refcal_b 0:en_cmp_refcal @ xreg_base+0xDF
f xreg.ANA_MISC2 1 @ xreg_base+0xE0
CCu 6:batt_fail_lbd 5:en_lbd 4:vpp_ready 3:lvi_cpotp 2:pd_rcal 1:en_bg_ana 0:enreg_cpotp @ xreg_base+0xE0
f xreg.ANA_MISC3 1 @ xreg_base+0xE1
CCu 7:dcdq_ifpkd 6:dcdi_ifpkd 5:cmph_rfpkd 4:cmpl_rfpkd 2:nvm_din 1:nvm_rstb 0:nvm_ceb @ xreg_base+0xE1
f xreg.ANA_MISC4 1 @ xreg_base+0xE2
CCu 3:mode_otp[1] 2:mode_otp[0] 1:asel_rcal[1] 0:asel_rcal[0] @ xreg_base+0xE2
f xreg.LV_SPARE1 1 @ xreg_base+0xE3
CCu 7:spare_lv1[7] 6:spare_lv1[6] 5:spare_lv1[5] 4:spare_lv1[4] 3:spare_lv1[3] 2:spare_lv1[2] 1:spare_lv1[1] 0:spare_lv1[0] @ xreg_base+0xE3
f xreg.LV_SPARE2 1 @ xreg_base+0xE4
CCu 7:spare_lv2[7] 6:spare_lv2[6] 5:spare_lv2[5] 4:spare_lv2[4] 3:spare_lv2[3] 2:spare_lv2[2] 1:spare_lv2[1] 0:spare_lv2[0] @ xreg_base+0xE4
f xreg.FREQ_CTN0 1 @ xreg_base+0xE5
CCu 7:Win_size0[7] 6:Win_size0[6] 5:Win_size0[5] 4:Win_size0[4] 3:Win_size0[3] 2:Win_size0[2] 1:Win_size0[1] 0:Win_size0[0] @ xreg_base+0xE5
f xreg.FREQ_CTN1 1 @ xreg_base+0xE6
CCu 7:Win_size1[7] 6:Win_size1[6] 5:Win_size1[5] 4:Win_size1[4] 3:Win_size1[3] 2:Win_size1[2] 1:Win_size1[1] 0:Win_size1[0] @ xreg_base+0xE6
f xreg.CNT_VAL0 1 @ xreg_base+0xE7
CCu 7:Cnt_val0[7] 6:Cnt_val0[6] 5:Cnt_val0[5] 4:Cnt_val0[4] 3:Cnt_val0[3] 2:Cnt_val0[2] 1:Cnt_val0[1] 0:Cnt_val0[0] @ xreg_base+0xE7
f xreg.CNT_VAL1 1 @ xreg_base+0xE8
CCu 7:Cnt_val1[7] 6:Cnt_val1[6] 5:Cnt_val1[5] 4:Cnt_val1[4] 3:Cnt_val1[3] 2:Cnt_val1[2] 1:Cnt_val1[1] 0:Cnt_val1[0] @ xreg_base+0xE8
f xreg.CNT_EN_STAT 1 @ xreg_base+0xE9
CCu 0:start @ xreg_base+0xE9
f xreg.AUXADC 1 @ xreg_base+0xEA
CCu 7:UDTIME[3] 6:UDTIME[2] 5:UDTIME[1] 4:UDTIME[0] 3:BUSY_SW_RESET 2:CLKEDGEB 1:AUXMODE 0:ADCEN @ xreg_base+0xEA
f xreg.AUXDAT0 1 @ xreg_base+0xEB
CCu 7:SAMP[10] 6:SAMP[9] 5:SAMP[8] 4:SAMP[7] 3:SAMP[6] 2:SAMP[5] 1:SAMP[4] 0:SAMP[3] @ xreg_base+0xEB
f xreg.AUXDAT1 1 @ xreg_base+0xEC
CCu 7:SAMP[2] 6:SAMP[1] 5:SAMP[0] 0:FRST_SAMP_B @ xreg_base+0xEC
f xreg.RAWSARDAT 1 @ xreg_base+0xED
CCu 7:RAW_SAR[7] 6:RAW_SAR[6] 5:RAW_SAR[5] 4:RAW_SAR[4] 3:RAW_SAR[3] 2:RAW_SAR[2] 1:RAW_SAR[1] 0:RAW_SAR[0] @ xreg_base+0xED
f xreg.SEQ_CFG0 1 @ xreg_base+0xEE
CCu 7:nsel_en 6:mod_rampdone_close_en 5:rampdone_mod_en 4:pkrcv_ph_en 3:Seq_en 2:Sw_reset 1:pa_ramp_irpt_en 0:Sw_start @ xreg_base+0xEE
f xreg.CNT_TH0 1 @ xreg_base+0xEF
CCu 7:cnt_th[7] 6:cnt_th[6] 5:cnt_th[5] 4:cnt_th[4] 3:cnt_th[3] 2:cnt_th[2] 1:cnt_th[1] 0:cnt_th[0] @ xreg_base+0xEF
f xreg.CNT_TH1 1 @ xreg_base+0xF0
CCu 7:modem_ph_th[3] 6:modem_ph_th[2] 5:modem_ph_th[1] 4:modem_ph_th[0] 3:cnt_th[11] 2:cnt_th[10] 1:cnt_th[9] 0:cnt_th[8] @ xreg_base+0xF0
f xreg.SEQ_CFG3 1 @ xreg_base+0xF1
CCu 6:Sw_close 5:close_hw_dly_th[5] 4:close_hw_dly_th[4] 3:close_hw_dly_th[3] 2:close_hw_dly_th[2] 1:close_hw_dly_th[1] 0:close_hw_dly_th[0] @ xreg_base+0xF1
f xreg.WUT_EN_CTRL 1 @ xreg_base+0xF2
CCu 7:RST_BLK 5:CAL_SEL[2] 4:CAL_SEL[1] 3:CAL_SEL[0] 2:EN_32K 1:WUT_FUNCTION_EN 0:CAL_FUNCTION_EN @ xreg_base+0xF2
f xreg.WUT_INT_CTRL 1 @ xreg_base+0xF3
CCu 7:CAL_INT_ACK 6:CAL_INT 5:CAL_STAT 4:EN_CAL_INT 3:WUT_INT_ACK 2:WUT_INT 1:WUT_STAT 0:EN_WUT_INT @ xreg_base+0xF3
f xreg.WUT_M_LSB 1 @ xreg_base+0xF4
CCu 7:WUT_M[7] 6:WUT_M[6] 5:WUT_M[5] 4:WUT_M[4] 3:WUT_M[3] 2:WUT_M[2] 1:WUT_M[1] 0:WUT_M[0] @ xreg_base+0xF4
f xreg.WUT_M_MSB 1 @ xreg_base+0xF5
CCu 7:WUT_M[15] 6:WUT_M[14] 5:WUT_M[13] 4:WUT_M[12] 3:WUT_M[11] 2:WUT_M[10] 1:WUT_M[9] 0:WUT_M[8] @ xreg_base+0xF5
f xreg.WUT_R 1 @ xreg_base+0xF6
CCu 4:WUT_R[4] 3:WUT_R[3] 2:WUT_R[2] 1:WUT_R[1] 0:WUT_R[0] @ xreg_base+0xF6
f xreg.DIR_MODE_CFG0 1 @ xreg_base+0xF7
CCu 6:polarity 5:scale_factor[1] 4:scale_factor[0] 3:lock 2:sw_rst 1:msb_first 0:enable @ xreg_base+0xF7
f xreg.DIR_MODE_RDBK 1 @ xreg_base+0xF8
CCu 7:data_in[7] 6:data_in[6] 5:data_in[5] 4:data_in[4] 3:data_in[3] 2:data_in[2] 1:data_in[1] 0:data_in[0] @ xreg_base+0xF8
f xreg.ARRIVAL_CTRL 1 @ xreg_base+0xF9
CCu 7:arriving_src[1] 6:arriving_src[0] 5:arrival_det_en 4:arr_toler[4] 3:arr_toler[3] 2:arr_toler[2] 1:arr_toler[1] 0:arr_toler[0] @ xreg_base+0xF9
f xreg.ARRIVAL_THD 1 @ xreg_base+0xFA
CCu 7:arr_q_pm 6:arr_q_sync 5:bcr_sw_sycw 4:skip_pmdet 3:arrivalthd[3] 2:arrivalthd[2] 1:arrivalthd[1] 0:arrivalthd[0] @ xreg_base+0xFA
f xreg.ONE_SHOT_AFC 1 @ xreg_base+0xFB
CCu 7:oneshot_afc_en 6:bcr_align_en 5:est_osr_en 4:afcma_en 3:oneshot_waitcnt[3] 2:oneshot_waitcnt[2] 1:oneshot_waitcnt[1] 0:oneshot_waitcnt[0] @ xreg_base+0xFB
f xreg.ARR_QUAL 1 @ xreg_base+0xFC
CCu 7:eye_qua_sel 6:arrqual[6] 5:arrqual[5] 4:arrqual[4] 3:arrqual[3] 2:arrqual[2] 1:arrqual[1] 0:arrqual[0] @ xreg_base+0xFC
f xreg.NIRQ0_MASK 1 @ xreg_base+0xFD
CCu 7:nirq_mask_7 6:nirq_mask_6 5:nirq_mask_5 4:nirq_mask_4 3:nirq_mask_3 2:nirq_mask_2 1:nirq_mask_1 0:nirq_mask_0 @ xreg_base+0xFD
f xreg.NIRQ1_MASK 1 @ xreg_base+0xFE
CCu 7:nirq_mask_15 6:nirq_mask_14 5:nirq_mask_13 4:nirq_mask_12 3:nirq_mask_11 2:nirq_mask_10 1:nirq_mask_9 0:nirq_mask_8 @ xreg_base+0xFE
f xreg.NIRQ2_MASK 1 @ xreg_base+0xFF
CCu 7:nirq_mask_23 6:nirq_mask_22 5:nirq_mask_21 4:nirq_mask_20 3:nirq_mask_19 2:nirq_mask_18 1:nirq_mask_17 0:nirq_mask_16 @ xreg_base+0xFF
f xreg2.MCSTAT 1 @ xreg2_base+0x00
CCu 7:PARITYEN 1:ERR 0:MBUSY @ xreg2_base+0x00
f xreg2.MCMD 1 @ xreg2_base+0x01
CCu 7:MINT0 6:MINT1 3:MCMD[3] 2:MCMD[2] 1:MCMD[1] 0:MCMD[0] @ xreg2_base+0x01
f xreg2.RADDRLO 1 @ xreg2_base+0x02
CCu 7:RADDR[7] 6:RADDR[6] 5:RADDR[5] 4:RADDR[4] 3:RADDR[3] 2:RADDR[2] 1:RADDR[1] 0:RADDR[0] @ xreg2_base+0x02
f xreg2.RADDRMD 1 @ xreg2_base+0x03
CCu 7:RADDR[15] 6:RADDR[14] 5:RADDR[13] 4:RADDR[12] 3:RADDR[11] 2:RADDR[10] 1:RADDR[9] 0:RADDR[8] @ xreg2_base+0x03
f xreg2.WADDRLO 1 @ xreg2_base+0x04
CCu 7:WADDR[7] 6:WADDR[6] 5:WADDR[5] 4:WADDR[4] 3:WADDR[3] 2:WADDR[2] 1:WADDR[1] 0:WADDR[0] @ xreg2_base+0x04
f xreg2.WADDRMD 1 @ xreg2_base+0x05
CCu 7:WADDR[15] 6:WADDR[14] 5:WADDR[13] 4:WADDR[12] 3:WADDR[11] 2:WADDR[10] 1:WADDR[9] 0:WADDR[8] @ xreg2_base+0x05
f xreg2.MMDATA 1 @ xreg2_base+0x06
CCu 7:MDATA[7] 6:MDATA[6] 5:MDATA[5] 4:MDATA[4] 3:MDATA[3] 2:MDATA[2] 1:MDATA[1] 0:MDATA[0] @ xreg2_base+0x06
f xreg2.SBDATA 1 @ xreg2_base+0x07
CCu 0:SBDATA @ xreg2_base+0x07
f xreg2.MSIZELO 1 @ xreg2_base+0x08
CCu 7:MSIZE[7] 6:MSIZE[6] 5:MSIZE[5] 4:MSIZE[4] 3:MSIZE[3] 2:MSIZE[2] 1:MSIZE[1] 0:MSIZE[0] @ xreg2_base+0x08
f xreg2.MSIZEHI 1 @ xreg2_base+0x09
CCu 7:MSIZE[15] 6:MSIZE[14] 5:MSIZE[13] 4:MSIZE[12] 3:MSIZE[11] 2:MSIZE[10] 1:MSIZE[9] 0:MSIZE[8] @ xreg2_base+0x09
f xreg2.NVTIM0 1 @ xreg2_base+0x0A
CCu 5:DIV100NS[5] 4:DIV100NS[4] 3:DIV100NS[3] 2:DIV100NS[2] 1:DIV100NS[1] 0:DIV100NS[0] @ xreg2_base+0x0A
f xreg2.NVTIM1 1 @ xreg2_base+0x0B
CCu 3:DIV1US[3] 2:DIV1US[2] 1:DIV1US[1] 0:DIV1US[0] @ xreg2_base+0x0B
f xreg2.NVTIM2 1 @ xreg2_base+0x0C
CCu 5:DIV50US[5] 4:DIV50US[4] 3:DIV50US[3] 2:DIV50US[2] 1:DIV50US[1] 0:DIV50US[0] @ xreg2_base+0x0C
f xreg2.SYNC2_WORD_1 1 @ xreg2_base+0x0D
CCu 7:SYNC2_WORD[7] 6:SYNC2_WORD[6] 5:SYNC2_WORD[5] 4:SYNC2_WORD[4] 3:SYNC2_WORD[3] 2:SYNC2_WORD[2] 1:SYNC2_WORD[1] 0:SYNC2_WORD[0] @ xreg2_base+0x0D
f xreg2.SYNC2_WORD_2 1 @ xreg2_base+0x0E
CCu 7:SYNC2_WORD[15] 6:SYNC2_WORD[14] 5:SYNC2_WORD[13] 4:SYNC2_WORD[12] 3:SYNC2_WORD[11] 2:SYNC2_WORD[10] 1:SYNC2_WORD[9] 0:SYNC2_WORD[8] @ xreg2_base+0x0E
f xreg2.SYNC2_WORD_3 1 @ xreg2_base+0x0F
CCu 7:SYNC2_WORD[23] 6:SYNC2_WORD[22] 5:SYNC2_WORD[21] 4:SYNC2_WORD[20] 3:SYNC2_WORD[19] 2:SYNC2_WORD[18] 1:SYNC2_WORD[17] 0:SYNC2_WORD[16] @ xreg2_base+0x0F
f xreg2.SYNC2_WORD_4 1 @ xreg2_base+0x10
CCu 7:SYNC2_WORD[31] 6:SYNC2_WORD[30] 5:SYNC2_WORD[29] 4:SYNC2_WORD[28] 3:SYNC2_WORD[27] 2:SYNC2_WORD[26] 1:SYNC2_WORD[25] 0:SYNC2_WORD[24] @ xreg2_base+0x10
f xreg2.SYNC_LEN_CONFIG 1 @ xreg2_base+0x11
CCu 4:RXQ_SYNC 3:SYNC_LEN[3] 2:SYNC_LEN[2] 1:SYNC_LEN[1] 0:SYNC_LEN[0] @ xreg2_base+0x11
f xreg2.ARRIVAL_RSSI 1 @ xreg2_base+0x12
CCu 7:arr_squelch 6:rssi_arr_thd[6] 5:rssi_arr_thd[5] 4:rssi_arr_thd[4] 3:rssi_arr_thd[3] 2:rssi_arr_thd[2] 1:rssi_arr_thd[1] 0:rssi_arr_thd[0] @ xreg2_base+0x12
f xreg2.RSSI_MUTE 1 @ xreg2_base+0x13
CCu 7:rssi_sel[1] 6:rssi_sel[0] 5:rssi_high_en 4:rssi_low_en 3:mute_rssi_sel 2:mute_rssi_cnt[2] 1:mute_rssi_cnt[1] 0:mute_rssi_cnt[0] @ xreg2_base+0x13
f xreg2.RSSI_THRD_BL 1 @ xreg2_base+0x14
CCu 7:bl_rssith[7] 6:bl_rssith[6] 5:bl_rssith[5] 4:bl_rssith[4] 3:bl_rssith[3] 2:bl_rssith[2] 1:bl_rssith[1] 0:bl_rssith[0] @ xreg2_base+0x14
f xreg2.RESERVE_CTRL 1 @ xreg2_base+0x15
CCu 7:res_hf_phcomp 6:res_pul_corr 5:res_pmrst 4:res_lockup_byp 3:res_ook_pktrunk 2:res_arr_rst_en 1:spare6 0:spare5 @ xreg2_base+0x15
f xreg2.SEQ_CFG2 1 @ xreg2_base+0x1A
CCu 6:busy 5:Modem_enabled 4:pa_rampdown_th[4] 3:pa_rampdown_th[3] 2:pa_rampdown_th[2] 1:pa_rampdown_th[1] 0:pa_rampdown_th[0] @ xreg2_base+0x1A
f xreg2.SEQ_CFG1 1 @ xreg2_base+0x1B
CCu 5:shortgnd_pa_b 4:drop_pad_nwells_pa 3:float_pad_pa[3] 2:float_pad_pa[2] 1:float_pad_pa[1] 0:float_pad_pa[0] @ xreg2_base+0x1B
f xreg2.FIELD_CONFIG2 1 @ xreg2_base+0x1C
CCu 6:NUM_FIELD_REPEAT[4] 5:NUM_FIELD_REPEAT[3] 4:NUM_FIELD_REPEAT[2] 3:NUM_FIELD_REPEAT[1] 2:NUM_FIELD_REPEAT[0] 1:FIELD_REPEAT_EN[1] 0:FIELD_REPEAT_EN[0] @ xreg2_base+0x1C
f xreg2.DUTY_CYCLING 1 @ xreg2_base+0x1D
CCu 7:mcu_timer_src[1] 6:mcu_timer_src[0] 5:rxclk_irpt_src[2] 4:rxclk_irpt_src[1] 3:rxclk_irpt_src[0] 2:low_duty[2] 1:low_duty[1] 0:low_duty[0] @ xreg2_base+0x1D
f xreg2.NDEC2_AGC 1 @ xreg2_base+0x1E
CCu 6:ndec3[1] 5:ndec3[0] 4:ndec2gain[1] 3:ndec2gain[0] 2:ndec2agc 1:jmp_hold[1] 0:jmp_hold[0] @ xreg2_base+0x1E
f xreg2.PK_DECAY 1 @ xreg2_base+0x1F
CCu 3:spare7 2:squelch_clk_en 1:decay_swal[1] 0:decay_swal[0] @ xreg2_base+0x1F
f xreg2.BPL3 1 @ xreg2_base+0x20
CCu 7:BP3[7] 6:BP3[6] 5:BP3[5] 4:BP3[4] 3:BP3[3] 2:BP3[2] 1:BP3[1] 0:BP3[0] @ xreg2_base+0x20
f xreg2.BPH3 1 @ xreg2_base+0x21
CCu 7:BP3[15] 6:BP3[14] 5:BP3[13] 4:BP3[12] 3:BP3[11] 2:BP3[10] 1:BP3[9] 0:BP3[8] @ xreg2_base+0x21
f xreg2.BPL4 1 @ xreg2_base+0x22
CCu 7:BP4[7] 6:BP4[6] 5:BP4[5] 4:BP4[4] 3:BP4[3] 2:BP4[2] 1:BP4[1] 0:BP4[0] @ xreg2_base+0x22
f xreg2.BPH4 1 @ xreg2_base+0x23
CCu 7:BP4[15] 6:BP4[14] 5:BP4[13] 4:BP4[12] 3:BP4[11] 2:BP4[10] 1:BP4[9] 0:BP4[8] @ xreg2_base+0x23
f xreg2.BPL5 1 @ xreg2_base+0x24
CCu 7:BP5[7] 6:BP5[6] 5:BP5[5] 4:BP5[4] 3:BP5[3] 2:BP5[2] 1:BP5[1] 0:BP5[0] @ xreg2_base+0x24
f xreg2.BPH5 1 @ xreg2_base+0x25
CCu 7:BP5[15] 6:BP5[14] 5:BP5[13] 4:BP5[12] 3:BP5[11] 2:BP5[10] 1:BP5[9] 0:BP5[8] @ xreg2_base+0x25
f xreg2.BPL6 1 @ xreg2_base+0x26
CCu 7:BP6[7] 6:BP6[6] 5:BP6[5] 4:BP6[4] 3:BP6[3] 2:BP6[2] 1:BP6[1] 0:BP6[0] @ xreg2_base+0x26
f xreg2.BPH6 1 @ xreg2_base+0x27
CCu 7:BP6[15] 6:BP6[14] 5:BP6[13] 4:BP6[12] 3:BP6[11] 2:BP6[10] 1:BP6[9] 0:BP6[8] @ xreg2_base+0x27
f xreg2.BPL7 1 @ xreg2_base+0x28
CCu 7:BP7[7] 6:BP7[6] 5:BP7[5] 4:BP7[4] 3:BP7[3] 2:BP7[2] 1:BP7[1] 0:BP7[0] @ xreg2_base+0x28
f xreg2.BPH7 1 @ xreg2_base+0x29
CCu 7:BP7[15] 6:BP7[14] 5:BP7[13] 4:BP7[12] 3:BP7[11] 2:BP7[10] 1:BP7[9] 0:BP7[8] @ xreg2_base+0x29