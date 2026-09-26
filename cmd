
C:\Users\User\Downloads\MT6580S24\MT6580S24>python -c "from pathlib import Path; import zlib; d=Path('kernel_gzip.bin').read_bytes(); z=zlib.decompressobj(16+zlib.MAX_WBITS); out=z.decompress(d); out+=z.flush(); Path('kernel_decompressed.bin').write_bytes(out); print('DECOMPRESSED:',len(out)); print('HEAD:',out[:64].hex(' ')); print('UNUSED:',len(z.unused_data)); print('UNUSED_HEAD:',z.unused_data[:32].hex(' '))"
DECOMPRESSED: 15233024
HEAD: 86 2b 04 eb 00 90 0f e1 1a 90 29 e2 1f 00 19 e3 1f 90 c9 e3 d3 90 89 e3 04 00 00 1a 01 9c 89 e3 0c e0 8f e2 09 f0 6f e1 0e f3 2e e1 6e 00 60 e1 09 f0 21 e1 10 9f 10 ee 9e e1 03 eb 05 a0 b0 e1
UNUSED: 36818
UNUSED_HEAD: 00 00 00 00 00 00 00 00 00 00 00 00 00 d0 9f 53 00 97 9f 53 00 e8 9f 53 00 4f 42 00 00 e4 9f 53

C:\Users\User\Downloads\MT6580S24\MT6580S24>findstr /m /c:"Linux version" kernel_decompressed.bin
kernel_decompressed.bin

C:\Users\User\Downloads\MT6580S24\MT6580S24>python -c "from pathlib import Path; import re; d=Path('kernel_decompressed.bin').read_bytes(); pats=[b'Linux version',b'3.18.',b'4.4.',b'MT6580',b'MediaTek',b'mtk',b'android']; [(print(p, [hex(x.start()) for x in list(re.finditer(re.escape(p),d))[:30]])) for p in pats]"
b'Linux version' ['0x9f8064']
b'3.18.' ['0x9f8072', '0x9fbd18', '0xb6f8b7', '0xb6f8e3', '0xe1f9f6']
b'4.4.' []
b'MT6580' ['0xb41ccb', '0xbca77b', '0xbcb69e']
b'MediaTek' ['0xbe46a8']
b'mtk' ['0xa50bbc', '0xa50bd1', '0xa50be6', '0xa50bfb', '0xa50c0e', '0xa50c23', '0xa50c38', '0xa50c4e', '0xa50c68', '0xa50c79', '0xa50c93', '0xa50ca8', '0xa50cd1', '0xa50ce7', '0xa50cfb', '0xa50d0f', '0xa50d21', '0xa50d37', '0xa50d4a', '0xa50d5e', '0xa50d70', '0xa50d98', '0xa50dae', '0xa50dbd', '0xa50dd4', '0xa50de5', '0xa50e4c', '0xa5158d', '0xa5175c', '0xa5176e']
b'android' ['0xa7abe0', '0xa7abff', '0xa7ac38', '0xa7ae0c', '0xa7ae28', '0xa7b045', '0xa7b055', '0xa7b064', '0xa7b08a', '0xa7b0ae', '0xa7b0d6', '0xa7b0fa', '0xa7b11e', '0xa7b132', '0xa7b145', '0xa7b155', '0xa7b177', '0xa7b195', '0xa7b1bb', '0xa7b1e4', '0xa7b1fa', '0xa7b212', '0xa7b236', '0xa7b2d6', '0xa7b2f3', '0xb4db09', '0xb53119', '0xb5f421', '0xbd4553', '0xbd456d']

C:\Users\User\Downloads\MT6580S24\MT6580S24>python -c "from pathlib import Path; import re; d=Path('kernel_decompressed.bin').read_bytes(); s=re.findall(rb'[\x20-\x7e]{8,}',d); [print(x.decode('latin1')) for x in s if any(k in x.lower() for k in [b'linux version',b'mt6580',b'mediatek',b'mtk',b'android',b'arm'])][:300]"
ARMv7 Processor
AES for ARMv4, CRYPTOGAMS by <appro@openssl.org>
SHA256 block transform for ARMv4/NEON/ARMv8, CRYPTOGAMS by <appro@openssl.org>
Linux version 3.18.79 (jjx@jjx-2) (gcc version 6.3.1 20170404 (Linaro GCC 6.3-2017.05) ) #3 SMP PREEMPT Sat Sep 7 16:58:55 CST 2024
alarmtimer_enqueue
3.18.79 SMP preempt mod_unload modversions ARMv7 p2v8
"dev = (%d,%d), ino = %lu, page_index = 0x%lx, oldaddr = 0x%llx, newaddr = 0x%llx, rw = %s(%s), type = %s_%s", ((unsigned int) ((REC->dev) >> 20)), ((unsigned int) ((REC->dev) & ((1U << 20) - 1))), (unsigned long)REC->ino, (unsigned long)REC->index, (unsigned long long)REC->old_blkaddr, (unsigned long long)REC->new_blkaddr, __print_symbolic(((REC->op|REC->op_flags) & ((1ULL << __REQ_RAHEAD) | ((1ULL << __REQ_WRITE) | (1ULL << __REQ_SYNC) | (1ULL << __REQ_NOIDLE) | (1ULL << __REQ_FLUSH) | (1ULL << __REQ_FUA)))), { 0, "READ" }, { (1ULL << __REQ_RAHEAD), "READAHEAD" }, { (0 | (1ULL << __REQ_SYNC)), "READ_SYNC" }, { (1ULL << __REQ_WRITE), "WRITE" }, { ((1ULL << __REQ_WRITE) | (1ULL << __REQ_SYNC) | (1ULL << __REQ_NOIDLE)), "WRITE_SYNC" }, { ((1ULL << __REQ_WRITE) | (1ULL << __REQ_SYNC) | (1ULL << __REQ_NOIDLE) | (1ULL << __REQ_FLUSH)), "WRITE_FLUSH" }, { ((1ULL << __REQ_WRITE) | (1ULL << __REQ_SYNC) | (1ULL << __REQ_NOIDLE) | (1ULL << __REQ_FUA)), "WRITE_FUA" }, { ((1ULL << __REQ_WRITE) | (1ULL << __REQ_SYNC) | (1ULL << __REQ_NOIDLE) | (1ULL << __REQ_FLUSH) | (1ULL << __REQ_FUA)), "WRITE_FLUSH_FUA" }), __print_symbolic(((REC->op|REC->op_flags) & ((1ULL << __REQ_META) | (1ULL << __REQ_PRIO))), { (1ULL << __REQ_META), "(M)" }, { (1ULL << __REQ_PRIO), "(P)" }, { (1ULL << __REQ_META) | (1ULL << __REQ_PRIO), "(MP)" }, { 0, " \b" }), __print_symbolic(REC->temp, { HOT, "HOT" }, { WARM, "WARM" }, { COLD, "COLD" }), __print_symbolic(REC->type, { NODE, "NODE" }, { DATA, "DATA" }, { META, "META" }, { META_FLUSH, "META_FLUSH" }, { INMEM, "INMEM" }, { INMEM_DROP, "INMEM_DROP" }, { INMEM_INVALIDATE, "INMEM_INVALIDATE" }, { INMEM_REVOKE, "INMEM_REVOKE" }, { IPU, "IN-PLACE" }, { OPU, "OUT-OF-PLACE" })
"dev = (%d,%d), type = %s, policy = (%s, %s, %s), victim = %u ofs_unit = %u, pre_victim_secno = %d, prefree = %u, free = %u", ((unsigned int) ((REC->dev) >> 20)), ((unsigned int) ((REC->dev) & ((1U << 20) - 1))), __print_symbolic(REC->type, { CURSEG_HOT_DATA, "Hot DATA" }, { CURSEG_WARM_DATA, "Warm DATA" }, { CURSEG_COLD_DATA, "Cold DATA" }, { CURSEG_HOT_NODE, "Hot NODE" }, { CURSEG_WARM_NODE, "Warm NODE" }, { CURSEG_COLD_NODE, "Cold NODE" }, { NO_CHECK_TYPE, "No TYPE" }), __print_symbolic(REC->gc_type, { FG_GC, "Foreground GC" }, { BG_GC, "Background GC" }), __print_symbolic(REC->alloc_mode, { LFS, "LFS-mode" }, { SSR, "SSR-mode" }), __print_symbolic(REC->gc_mode, { GC_GREEDY, "Greedy" }, { GC_CB, "Cost-Benefit" }), REC->victim, REC->ofs_unit, (int)REC->pre_victim, REC->prefree, REC->free
mediatek,PTP_FSM
mtk_uart_sysrq_store
mtk_uart_vffsz_store
mtk_uart_verify_port
mtk_uart_enable_ms
mtk_uart_debug_store
mtk_uart_conse_store
mtk_uart_vff_en_store
mtk_uart_lsr_status_store
mtk_uart_stop_tx
mtk_uart_pm_restore_noirq
mtk_uart_set_termios
mtk_uart_dma_alloc
mtk_uart_flush_buffer
mtk_uart_send_xchar
mtk_uart_power_mgnt
mtk_uart_tx_empty
mtk_uart_vfifo_create
mtk_uart_pm_freeze
mtk_uart_pm_restore
mtk_uart_dma_free
mtk_uart_shutdown
mtk_uart_vfifo_delete
mtk_uart_probe
mtk_uart_vfifo_prepare
mtk_uart_startup
mtk_uart_dma_stop
mtk_uart_rx_chars
mediatek,AP_UART0
mediatek,AP_UART1
mediatek,AP_UART2
mediatek,AP_UART3
mediatek,mt6735-uart
mediatek,mt6755-uart
mediatek,mt8173-uart
mediatek,mt6797-uart
mediatek,mt8163-uart
mediatek,mtk-uart
mtk_uart_cal_baud
mtk_uart_dma_start
mtk_uart_fifo_set_trig
mtk_uart_set_auto_baud
mtk_uart_power_up
mtk_uart_power_down
mtk_uart_set_flow_ctrl
mtk_uart_dma_vfifo_rx_tasklet_str
mtk_uart_stop_rx
mtk_uart_break_ctl
mediatek,mt6735-auxadc
mediatek,mt6797-auxadc
mediatek,mt6755-auxadc
mediatek,mt6757-auxadc
mediatek,elbrus-auxadc
mediatek,ap-auxadc
mediatek,m4u
mediatek,perisys_iommu
mediatek,pwm
mediatek,mt8163-pwm
mediatek,mt8173-pwm
mediatek,mt8127-pwm
mediatek,mt2701-pwm
mediatek,als_ps
mediatek,gsensor
mediatek,gsensor
mediatek,gsensor_2
mediatek,mt6580-i2c
mediatek,
mtk_rtc_common.rtc_show_alarm
mtk_rtc_common.rtc_show_time
mediatek,mt6350
mediatek,USB0
mediatek,USB0
mediatek,gpio
mtk_memcfg_late_init
mediatek,gce
mediatek,mt8173-gce
mediatek,mt8163-gce
mediatek,i2c_lcd_bias
mtkfb_process_dbg_opt(), set backlight level = %ld
7[name:disp_debug&][DISP]mtkfb_process_dbg_opt(), set backlight level = %ld
DISP/DBG mtkfb_layer%d write is not implemented yet
7[name:disp_debug&][DISP]DISP/DBG mtkfb_layer%d write is not implemented yet
mtkfb_process_dbg_opt
mediatek,DISPSYS
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/mt6580/ddp_path.c
mtkfb_pm_restore_noirq
mtkfb_release
mtkfb_open
mtkfb_set_backlight_level
mtkfb_set_par
mtkfb_set_backlight_mode
mtkfb_set_backlight_pwm
mtkfb_probe
mtkfb_ioctl
mediatek,mtkfb
7[name:mtkfb_debug&][DISP]addr valid, isVa=0x%x, addr=0x%lx, module=%s!
7[name:mtkfb_debug&][DISP]cmd: %s
7[name:mtkfb_debug&][DISP]addr=0x%lx, start_addr=0x%lx, x=%d,y=%d,w=%d,h=%d,linepitch=%d, color=0x%08x
[mtkfb_dbg] %s
7[name:mtkfb_debug&][DISP][mtkfb_dbg] %s
7[name:mtkfb_debug&][DISP]func|%s
7[name:mtkfb_debug&][DISP]%s,%d, n=%d
7[name:mtkfb_debug&][DISP]%s
7[name:mtkfb_debug&][DISP]Buffer overflow, data length %d is lager than buffer size %d, offset is %lld
&mtkfb_debug_read_lock
MTK_mali_osk_pm_dev_enable
mediatek,EFUSEC
mediatek,smi_common
mediatek,FHCTL
mediatek,fhctl
mediatek,hacc
mediatek,ISPSYS
mediatek,ISP_PIPEM
mediatek,ISP_SYSR
mediatek,camera_hw
mediatek,camera_hw2
mediatek,camera_sub
mediatek,camera_main
mediatek,CAMERA_MAIN_AF
mediatek,CAMERA_MAIN_TWO_AF
mediatek,CAMERA_SUB_AF
mediatek,ap_ccif0
mtk_wcn_cmb_sdio_request_eirq
mtk_wcn_cmb_stub_query_ctrl
mtk_btif_remove
mtk_btif_probe
mtk_btif_rxd_be_blocked_by_timer
mtk_btif_rxd_be_blocked_by_data
mtk_btif_rxd_be_blocked_flag_get
mtk_btif_suspend
mtk_btif_restore_noirq
mtk_btif_resume
mediatek,btif
mtk_wcn_btif_open
mtk_wcn_btif_close
mtk_wcn_btif_write
mtk_wcn_btif_dbg_ctrl
mtk_wcn_btif_parser_wmt_evt
mtk_btif_exp_open_test
mtk_btif_exp_close_test
mtk_btif_exp_write_stress_test
mediatek,lastpc-v1
mediatek,mt6580-mcucfg
mediatek,mt6735-mcucfg
mediatek,mt8163-mcucfg
mediatek,mt8167-mcucfg
mediatek,mt8173-mcucfg
mediatek,bus_dbg-v2
mtk_get_gpu_loading
mtk_get_gpu_loading
mtk_wcn_cmb_stub_query_ctrl
_mtk_cl_mutt_proc_read
mtk_cooler_mutt_unregister_ltf
mtk_cl_mutt_set_mutt_limit
mtk_cooler_mutt_register_ltf
mtk_cooler_mutt_init
mtk_cooler_bcct_init
mtk_chr_get_soc
mtk_chr_get_ui_soc
mtk_chr_get_vbat
mtk_chr_get_ibat
mtk_chr_get_vbus
mtk_chr_get_aicr
mtk_chr_get_tchr
mtk_get_gpu_loading
mediatek,THERM_CTRL
mediatek,audio_bt_cvsd
AudioMTKBTCVSD
mediatek,mt6580-spi
android_bind_enabled_functions
android_setup_config
android_disconnect
android_init_functions
android_work
g_android.stall
g_android.luns
g_android.nofua
g_android.cdrom
g_android.removable
g_android.ro
g_android.file
g_android.host_addr
g_android.dev_addr
g_android.qmult
g_android.u_ether_rx_pending_thld
g_android.tx_wakeup_threshold
g_android.rndis_ul_max_xfer_size_rcvd
g_android.rndis_ul_max_pkt_per_xfer_rcvd
g_android.rndis_debug
g_android.f_rndis_debug
g_android.rndis_ul_max_pkt_per_xfer
g_android.rndis_dl_max_pkt_per_xfer
g_android.mtp_skip_vfs_write
g_android.mtp_skip_vfs_read
mediatek,mt6580-keypad
mediatek,mt6570-keypad
mediatek,mt6735-keypad
mediatek,mt6755-keypad
mediatek,mt6757-keypad
mediatek,mt8173-keypad
mediatek,mt6797-keypad
mediatek,mt8163-keypad
mediatek,mt8167-keypad
mediatek,mt8127-keypad
mediatek,mt2701-keypad
mediatek,mt7623-keypad
mediatek,elbrus-keypad
mediatek,cap_touch
__rtc_set_alarm
mediatek,bat_meter
mediatek,bat_notify
mediatek,battery
mtk_rgu_pause_wdt_store
mediatek,TOPRGU
mediatek,mt6580-mmc
arm,amba-bus
ion_mtk_heap_create
alarm_dev.debug_mask
ClearMemBlock
mtk_local_audio_copy_from_user
mtk_local_audio_copy_to_user
mtk_capture_pcm_page
mtk_soc_capture_platform_init
mtk_capture_remove
mtk_capture_probe
mtk_capture_pcm_copy
mtk_capture_pcm_pointer
mtk_soc_platform_exit
mediatek,mt_soc_pcm_capture
mtk_pcm_dl1_start
mtk_pcm_dl1_stop
mtk_pcm_prepare
mtk_soc_pcm_dl1_close
mtk_soc_dl1_probe
mediatek,mt_soc_pcm_dl1
mtk_asoc_dummypcm_new
mtk_soc_dummy_platform_init
mtk_dummy_probe
mtk_soc_dummy_platform_exit
mediatek,mt_soc_pcm_dummy
mtk_routing_pcm_trigger
mtk_asoc_routing_pcm_new
mtk_soc_routing_platform_init
mtk_afe_routing_probe
mtk_soc_routing_platform_exit
mtk_pm_ops_resume_ipo
mtk_pm_ops_suspend_ipo
mediatek,mt_soc_pcm_routing
mtk_capture2_pcm_page
mtk_soc_capture2_platform_init
mtk_capture2_probe
mtk_capture2_pcm_copy
mtk_capture2_pcm_open
mtk_soc_capture2_platform_exit
mediatek,mt_soc_pcm_capture2
mtk_soc_voice_new
mtk_soc_voice_platform_init
mtk_voice_remove
mtk_voice_probe
mtk_voice1_prepare
mtk_soc_voice_platform_exit
mediatek,mt_soc_pcm_voice_md1
mtk_soc_voice_md2_new
mtk_soc_voice_md2_platform_init
mtk_voice_md2_probe
mtk_voice1_ext_prepare
mtk_voice_md2_close
mtk_soc_voice_md2_platform_exit
mediatek,mt_soc_pcm_voice_md2
mtk_soc_voice_bt_new
mtk_soc_voice_bt_platform_init
mtk_voice_bt_probe
mtk_voice_bt1_prepare
mtk_soc_voice_bt_platform_exit
mtk_voice_bt_close
mtk_voice_bt_pcm_open
mediatek,mt_soc_pcm_voice_md1_bt
mtk_soc_voice_md2_bt_new
mtk_soc_voice_md2_bt_platform_init
mtk_voice_md2_bt_probe
mtk_voice_md2_bt_prepare
mtk_soc_voice_md2_bt_platform_exit
mtk_voice_md2_bt_close
mtk_voice_md2_bt_pcm_open
mediatek,mt_soc_pcm_voice_md2_bt
mediatek,mt_soc_pcm_hdmi
mtk_i2s0_pcm_page
mtk_pcm_i2s0_silence
mtk_asoc_pcm_i2s0_new
mtk_i2s0_soc_platform_init
mtk_i2s0_remove
mtk_i2s0_probe
mtk_pcm_i2s0_close
mtk_i2s0_soc_platform_exit
mediatek,mt_soc_pcm_dl1_i2s0
mtk_I2S0dl1_pcm_page
mtk_pcm_I2S0dl1_silence
mtk_asoc_pcm_I2S0dl1_new
mtk_I2S0dl1_soc_platform_init
mtk_I2S0dl1_remove
mtk_I2S0dl1_probe
mtk_pcm_I2S0dl1_start
mtk_pcm_I2S0dl1_stop
mtk_pcm_I2S0dl1_prepare
mtk_pcm_I2S0dl1_close
mtk_I2S0dl1_soc_platform_exit
mediatek,mt_soc_pcm_dl1_i2s0Dl1
mtk_soc_i2s0_awb_platform_exit
mtk_i2s0_awb_probe
mtk_i2s0_awb_pcm_copy
mtk_soc_i2s0_awb_platform_init
mediatek,mt_soc_pcm_i2s0_awb
mtk_uldlloopbackpcm_trigger
mtk_asoc_uldlloopbackpcm_new
mtk_soc_uldlloopback_platform_init
mtk_uldlloopback_probe
mtk_uldlloopback_pcm_prepare
mtk_uldlloopbackpcm_close
mtk_soc_uldlloopback_platform_exit
mediatek,mt_soc_pcm_uldlloopback
mtk_pcm_dl2_stop
mtk_pcm_dl2_prepare
mtk_pcm_dl2_open
mtk_pcm_dl2_copy_
mtk_pcm_dl2_copy
mtk_soc_dl2_probe
mtk_dl2_copy2buffer
mediatek,mt_soc_pcm_dl2
mtk_deep_buffer_dl_remove
mtk_deep_buffer_dl_probe
mtk_deep_buffer_dl_open
mediatek,mt_soc_pcm_deep_buffer_dl
mtk_mrgrx_pcm_page
mtk_pcm_mrgrx_silence
mtk_asoc_pcm_mrgrx_new
mtk_mrgrx_soc_platform_init
mtk_mrgrx_remove
mtk_mrgrx_probe
mtk_pcm_mrgrx_prepare
mtk_pcm_mrgrx_close
mtk_mrgrx_soc_platform_exit
mtk_pcm_mrgrx_start
mediatek,mt_soc_pcm_mrgrx
mtk_soc_mrgrx_awb_platform_exit
mtk_mrgrx_awb_probe
mtk_mrgrx_awb_pcm_copy
mtk_soc_mrgrx_awb_platform_init
mediatek,mt_soc_pcm_mrgrx_awb
mtk_fm_i2s_pcm_page
mtk_pcm_fm_i2s_silence
mtk_asoc_pcm_fm_i2s_new
mtk_fm_i2s_soc_platform_init
mtk_fm_i2s_remove
mtk_fm_i2s_probe
mtk_pcm_fm_i2s_prepare
mtk_pcm_fm_i2s_close
mtk_fm_i2s_soc_platform_exit
mtk_pcm_fm_i2s_start
mediatek,mt_soc_pcm_fm_i2s
mtk_soc_fm_i2s_awb_platform_exit
mtk_fm_i2s_awb_remove
mtk_fm_i2s_awb_probe
mtk_fm_i2s_awb_pcm_copy
mtk_soc_fm_i2s_awb_platform_init
mediatek,mt_soc_pcm_fm_i2s_awb
mtk_soc_dl1_awb_platform_exit
mtk_dl1_awb_probe
mtk_dl1_awb_pcm_copy
mtk_soc_dl1_awb_platform_init
mediatek,mt_soc_pcm_dl1_awb
mediatek,mt_soc_pcm_dl1_bt
mtk_soc_bt_dai_platform_exit
mtk_bt_dai_probe
mtk_bt_dai_pcm_copy
mtk_soc_bt_dai_platform_init
mediatek,mt_soc_pcm_bt_dai
mtk_dai_stub_exit
mtk_dai_stub_dev_remove
mtk_dai_stub_dev_probe
mtk_dai_stub_init
mediatek,mt_soc_dai_stub
mtk_routing_init
mtk_routing_dev_remove
mtk_routing_dev_probe
mtk_routing_exit
mediatek,mt_soc_dai_routing
mtk_dummy_codec_init
mtk_dummy_codec_dev_remove
mtk_dummy_codec_dev_probe
mtk_codec_dummy_exit
mediatek,mt_soc_codec_dummy
mtk_mt6350_codec_init
mtk_mt6350_codec_dev_remove
mtk_mt6350_codec_dev_probe
mtk_mt6350_codec_exit
mediatek,mt_soc_codec_63xx
mediatek,mt_soc_pcm_fmtx
mtk_capture_pcm_copy
mediatek,mt_soc_tdm_capture
mtk_soc_pcm_hp_impedance_close
mediatek,Mt_soc_pcm_hp_impedance
TMTK_M4U_isr
tMTK_M4U
tMTK_M4U_~
tMTK_M4U
tMTK_M4U_i
TMTKMALI_Du
TMTKMemR
TMTKMemR
TMTKMemR
TMTKMemR
tMTK_M4U_isr.p
tMTK_M4U_In
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/init/main.c
0machine_restart, arm_pm_restart(%p)
6CPU: %s [%08x] revision %d (ARMv%s), cr=%08lx
0Internal error: %s: %x [#%d] PREEMPT SMP ARM
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/arch/arm/kernel/suspend.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/arch/arm/kernel/devtree.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/arch/arm/kernel/hw_breakpoint.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/arch/arm/kernel/perf_regs.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/arch/arm/kernel/perf_event.c
&armpmu->reserve_mutex
armv7_cortex_a8
armv7_cortex_a9
armv7_cortex_a5
armv7_cortex_a15
armv7_cortex_a7
armv7_cortex_a12
armv7_cortex_a17
armv7_krait
perf/ARM: No irqs for PMU defined, sampling events not supported
3CPU PMU: unable to request IRQ%d for ARM PMU counters
arm,cortex-a15
arm,cortex-a17
arm,cortex-a12
arm,cortex-a53
arm,cortex-a7
arm,armv7-timer
arm,cpu-registers-not-fw-configured
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/arch/arm/mm/dma-mapping.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/arch/arm/mm/ioremap.c
4Only cachepolicy=%s supported on ARMv6 and later
2Please enable ARM_LPAE and ARM_PATCH_PHYS_VIRT support to use this
mediatek,mt7623
mediatek,mt8127
mediatek,mt6757
mediatek,MT6755
mediatek,mt6735
mediatek,MT6580
mediatek,MT6570
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/fork.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/iocontext.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/kref.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/cpu.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/exit.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/softirq.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/resource.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/capability.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/ptrace.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/signal.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/sched.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/thread_info.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/kmod.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/workqueue.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/pid.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/params.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/kthread.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/async.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/smpboot.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/sched/core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/sched/fair.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/sched/rt.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/sched/deadline.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/sched/idle.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/sched/cpudeadline.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/locking/rtmutex.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/locking/rtmutex.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/power/qos.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/power/process.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/printk/printk.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/irq/handle.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/irq/manage.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/irq/spurious.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/irq/chip.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/irq/devres.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/irq/irqdomain.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/irq/pm.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/rcu/srcu.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/rcu/tree.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/rcu/tree_plugin.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/stacktrace.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/time/timer.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/time/hrtimer.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/time/posix-timers.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/time/posix-cpu-timers.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/time/timekeeping.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/time/clocksource.c
alarmtimer
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/time/clockevents.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/time/tick-broadcast.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/time/sched_clock.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/time/tick-sched.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/futex.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/smp.c
__obsparm
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/cgroup.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/res_counter.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/stop_machine.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/auditfilter.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/auditsc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/audit_watch.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/seccomp.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/tracepoint.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/jump_label.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/trace/ring_buffer.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/trace/trace.c
mtk_events
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/trace/trace_output.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/trace/trace_seq.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/trace/trace_sched_switch.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/trace/trace_events.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/trace/trace.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/trace/trace_event_perf.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/trace/trace_events_filter.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/trace/trace_events_trigger.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/trace/events/power.h
mtk_nand
# android time:
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/irq_work.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/bpf/core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/events/core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/jump_label_ratelimit.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/kernel/events/callchain.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/filemap.c
4mtk_dump_gpu_memory_usage not support
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/page_alloc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/gfp.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/page-writeback.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/swap.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/truncate.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/shmem.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/backing-dev.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/percpu.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/percpu-vm.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/trace/events/kmem.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/slab_common.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/vmacache.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/list_lru.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/gup.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/memcontrol.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/mmap.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/rmap.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/vmalloc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/pgtable-generic.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/nobootmem.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/memblock.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/swapfile.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/dmapool.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/slub.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/mm/memcontrol.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/open.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/super.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/exec.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/namei.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/fcntl.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/dcache.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/inode.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/attr.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/namespace.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/fs-writeback.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/splice.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/sync.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/buffer.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/block_dev.c
android_fs
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/notify/fsnotify.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/notify/notification.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/notify/inotify/inotify_fsnotify.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/notify/inotify/inotify_user.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/aio.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/crypto/keyinfo.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/crypto/bio.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/locks.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/binfmt_elf.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/quotaops.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/quota/dquot.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/net/genetlink.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/proc/inode.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/proc/generic.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/proc/proc_sysctl.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/kernfs/dir.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/kernfs/file.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/sysfs/file.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/sysfs/dir.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/sysfs/group.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/configfs/configfs_internal.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/ext4/ext4.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/ext4/inode.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/ext4/page-io.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/ext4/namei.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/ext4/super.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/ext4/extents.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/ext4/ext4_jbd2.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/ext4/mballoc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/ext4/extents_status.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/jbd2/transaction.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/jbd2/checkpoint.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/jbd2/journal.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/fat/fatent.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/isofs/compress.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/sdcardfs/inode.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/sdcardfs/main.c
%s/Android/obb
.android_secure
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/sdcardfs/derived_perm.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/fuse/dev.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/fuse/file.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/tracefs/inode.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/fscrypt_supp.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/f2fs.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/file.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/inode.c
Warm DATA
Warm NODE
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/inline.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/segment.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/checkpoint.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/gc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/data.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/node.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/segment.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/recovery.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/extent_cache.c
  - WARM  data: %d, %d, %d
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/f2fs/xattr.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/fs/pstore/ram.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/security/keys/request_key.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/security/commoncap.c
wake_alarm
6SELinux:  Android master kernel running Android M policy in compatibility mode.
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/security/selinux/ss/services.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/crypto/algapi.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/crypto/ablkcipher.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/crypto/blkcipher.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/bio.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/bio.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/elevator.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/blk-core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/blk.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/blk-sysfs.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/blk-flush.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/blk-settings.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/blk-exec.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/blk-merge.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/blk-mq.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/blk-mq-tag.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/genhd.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/block/cfq-iosched.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/idr.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/kobject.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/kernfs.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/kobject_uevent.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/plist.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/radix-tree.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/timerqueue.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/vsprintf.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/scatterlist.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/percpu-refcount.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/devres.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/swiotlb.c
mediatek,mt-eic
mediatek,max_eint_num
mediatek,max_hw_deb_cnt
4[EIC] no mediatek,max_hw_deb_cnt specified
mediatek,mapping_table_entry
mediatek,mapping_table
mediatek,max_deint_cnt
mediatek,deint_possible_irq
mediatek,builtin_eint_hw_deb
mediatek,builtin_entry
mediatek,builtin_mapping
mediatek,debtime_setting_entry
mediatek,debtime_setting_array
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/irqchip/irq-mt-eic.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/pinctrl/core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/pinctrl/pinctrl-utils.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/pinctrl/pinmux.c
4mtk_pctrl_init++++++
mediatek,pctl-regmap
4mtk_pctrl_init------ ok
4mtk_pctrl_init------ fail
mtk-eint
4mt6580 pinctrl probe
mediatek-mt6580-pinctrl
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/gpio/devres.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/gpio/gpiolib.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/gpio/gpiolib-of.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/video/fbdev/core/fb_draw.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/amba/bus.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/regulator/core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/regulator/devres.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/tty/tty_io.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/tty/n_tty.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/tty/tty_ldisc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/tty/tty_buffer.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/tty/tty_port.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/tty/tty_mutex.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/tty/pty.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/tty/tty_audit.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/tty/serial/serial_core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/char/random.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/char/misc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/component.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/bus.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/dd.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/syscore.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/driver.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/class.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/devres.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/power/qos.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/power/wakeup.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/dma-mapping.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/firmware_class.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/regmap/regmap.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/regmap/regcache.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/base/regmap/regmap-debugfs.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/emi_mpu/mt6580/emi_mpu.c
mediatek,DEVAPC
mediatek,SLEEP
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/base/power/mt6580/mt_clkmgr.c
mediatek,APMIXED
mediatek,AUDIO
mediatek,G3D_CONFIG
mediatek,mmsys_config
mediatek,IMGSYS_CONFIG
MT_CG_ARM_EMICLK_WFI_GATING_DIS
MT_CG_ARMDCM_CLKOFF_EN
mediatek,rf_clock_buffer
mediatek,clkbuf-config
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/base/power/mt6580/mt_ptp.c
mediatek,PTP_FSM
5[Power/dcm] error: cannot find node mediatek,TOPCKGEN
5[Power/dcm] error: cannot iomap mediatek,TOPCKGEN
5[Power/dcm] error: cannot find node mediatek,MCUCFG
5[Power/dcm] error: cannot get phys addrmediatek,MCUCFG
5[Power/dcm] error: cannot iomap mediatek,MCUCFG
5[Power/dcm] error: cannot find node mediatek,DRAMC0
5[Power/dcm] error: cannot iomap mediatek,DRAMC0
5[Power/dcm] error: cannot find node mediatek,EMI
5[Power/dcm] error: cannot iomap mediatek,EMI
5[Power/dcm] error: cannot find node mediatek,INFRACFG_AO
5[Power/dcm] error: cannot iomap mediatek,INFRACFG_AO
5[Power/dcm] error: cannot find node mediatek,MCUCFG_BIU
5[Power/dcm] error: cannot iomap mediatek,MCUCFG_BIU
ARMCORE_DCM
mediatek,mt6580-smp
mediatek,I2C0
mediatek,I2C1
mediatek,I2C2
mediatek,DDRPHY
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/base/power/spm_v1/mt_spm.c
mediatek,mt6580-mcucfg
arm,cortex-a7-gic
mediatek,mt6580-keypad
mediatek,mt6580-consys
mediatek,mt6735-auxadc
mediatek,ap_ccif0
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/sched/sched_avg.c
mtk_sched
mtk_sched/affinity_status
mt6580-gpt
MTK UART
3mtk_vfifo_irq_handler: vfifo is NULL
3mtk_vfifo_irq_handler: dma is NULL
mtk-uart
3  [UART%d]:%c:%4d: mtk_uart_dma_start fails
mediatek,AP_UART0
mediatek,AP_UART1
mediatek,AP_UART2
mediatek,AP_UART3
mediatek,AP_DMA
mediatek,AP_DMA_UART0_TX
mediatek,AP_DMA_UART0_RX
mediatek,AP_DMA_UART1_TX
mediatek,AP_DMA_UART1_RX
mediatek,AP_DMA_UART2_TX
mediatek,AP_DMA_UART2_RX
mediatek,AP_DMA_UART3_TX
mediatek,AP_DMA_UART3_RX
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/irq/mt6580/irq.c
mediatek,mt6735-sys_cirq
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/cirq/mt_sys_cirq.c
mediatek,cirq_num
mediatek,spi_start_offset
mediatek,EFUSEC
mtk-adc-cali
mediatek,adc_channel
mediatek,temperature0
mediatek,temperature1
mediatek,adc_fdd_rf_params_dynamic_custom_ch
mediatek,hf_mic
mediatek,lcm_voltage
mediatek,battery_voltage
mediatek,charger_voltage
mediatek,utms
mediatek,ref_current
mediatek,board_id
mediatek,board_id_2
mediatek,board_id_3
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/m4u/mt6580/m4u_hw.c
3[M4U] MTK_M4U_isr(), Invalid irq number %d
mediatek,SMI_LARB0
mediatek,SMI_LARB1
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/m4u/2.0/m4u.c
3[M4U] MTK_M4U_T_POWER_ON,copy_from_user failed,%d
3[M4U] MTK_M4U_T_POWER_OFF,copy_from_user failed,%d
3[M4U] MTK_M4U_T_ALLOC_MVA,copy_from_user failed:%d
3[M4U] MTK_M4U_T_DEALLOC_MVA,copy_from_user failed:%d
3[M4U] MTK_M4U_T_DEALLOC_MVA, mva %d is invalid
3[M4U] MTK_M4U_Invalid_TLB_Range,copy_from_user failed,%d
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/m4u/2.0/m4u_pgtable.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/sensors-1.0/hwmon/sensor_attributes/sensor_attr.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/sensors-1.0/accelerometer/da218b/mir3da_cust.c
3ERROR,%d: Wait for DMA warm reset error
mediatek,ap_dma
mtk_vibrator
mediatek,vibrator
mediatek,VENC
mediatek,VDEC
5mtk_rtc_common: rtc_tasklet_handler start
5mtk_rtc_common: %s time is up
5mtk_rtc_common: There is Crystal
5mtk_rtc_common: There is no Crystal
5mtk_rtc_common: rtc_init
3mtk_rtc_common: register device failed (%d)
3mtk_rtc_common: register driver failed (%d)
5mtk_rtc_common: set al time = %04d/%02d/%02d %02d:%02d:%02d (%d)
5mtk_rtc_common: read al time = %04d/%02d/%02d %02d:%02d:%02d (%d)
3mtk_rtc_common: register rtc device failed (%ld)
3mtk_rtc_common: reset to default date %04d/%02d/%02d
5mtk_rtc_common: read tc time = %04d/%02d/%02d (%d) %02d:%02d:%02d
5mtk_rtc_common: rtc_ops_ioctl cmd=%d
5mtk_rtc_common: rtc_ops_ioctl cmd=RTC_AUTOBOOT_ON
5mtk_rtc_common: rtc_ops_ioctl cmd=RTC_AUTOBOOT_OFF
5mtk_rtc_common: rtc_gpio_enable_32k, user = %d
5mtk_rtc_common: rtc_gpio_disable_32k, user = %d
5mtk_rtc_common: set tc time = %04d/%02d/%02d %02d:%02d:%02d
5mtk_rtc_common: set_rtc_spare_fg_value, %d
5mtk_rtc_common: rtc_mark_recovery
5mtk_rtc_common: rtc_mark_fast
5mtk_rtc_common: mt_power_off
5mtk_rtc_common: Phone with charger
5mtk_rtc_common: power-on = %04d/%02d/%02d %02d:%02d:%02d (%d)(%d)
3mtk_rtc_hal_common: rtc_busy_wait too long: %lld(%lld:%lld), %x, %d
5mtk_rtc_hal_common: rtc_spare_reg[%d] = {%d, %d, %d}
5mtk_rtc_hal_common: mon = %d, day = %d, hour = %d
5mtk_rtc_hal_common: RTC_IRQ_EN = 0x%x, RTC_PDN1 = 0x%x
0mtk_rtc_hal_common: !!! 32K WAS STOPPED !!!
5mtk_rtc_hal: ABB 32k not support
5mtk_rtc_hal: RTC_GPIO 32k status(RTC_CON=0x%x)
5mtk_rtc_hal: RTC_GPIO user %d enable = %d 32k (0x%x)
5mtk_rtc_hal: hal_rtc_bbpu_pwdn (RTC_CON=0x%x)
5mtk_rtc_hal: pdn1 = 0x%4x
3[PMIC] mtk_regulator_list_voltage bugl(name=%s id=%d en_reg=%x vol_reg=%x)
mediatek,mt_pmic
3[PMIC] [PMIC]mtk_ldos[%d].config.init_data min_uv:%d max_uv:%d
mediatek,mt6350
3[PMIC] [store_pmic_dvt] no define MTK_PMIC_DVT_SUPPORT
mediatek, pmic-eint
mtk pwrkey_sw_workaround_init
3mtk_ta_increase() start
3mtk_ta_increase() on 1
3mtk_ta_increase() off 1
3mtk_ta_increase() on 2
3mtk_ta_increase() off 2
3mtk_ta_increase() on 3
3mtk_ta_increase() off 3
3mtk_ta_increase() on 4
3mtk_ta_increase() off 4
3mtk_ta_increase() on 5
3mtk_ta_increase() off 5
3mtk_ta_increase() on 6
3mtk_ta_increase() off 6
3mtk_ta_increase() end
3mtk_ta_decrease() start
3mtk_ta_decrease() on 1
3mtk_ta_decrease() off 1
3mtk_ta_decrease() on 2
3mtk_ta_decrease() off 2
3mtk_ta_decrease() on 3
3mtk_ta_decrease() off 3
3mtk_ta_decrease() on 4
3mtk_ta_decrease() off 4
3mtk_ta_decrease() on 5
3mtk_ta_decrease() off 5
3mtk_ta_decrease() on 6
3mtk_ta_decrease() off 6
3mtk_ta_decrease() end
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/pmic_wrap/mt_pmic_wrap.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/pmic_wrap/mt6580/pwrap_hal.c
mediatek,TOPRGU
mediatek,PWRAP
5[MUSB]%s %d: mtk_musb is NULL
5[MUSB]%s %d: !mtk_musb
mediatek,phy_tuning
mediatek,USB0
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/usb20/musb_gadget_ep0.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/usb20/musb_host.c
mediatek,IOCFG_L
mediatek,IOCFG_B
mediatek,IOCFG_R
mediatek,IOCFG_T
mediatek,MIPI_TX0
mediatek,MIPI_RX_ANA_CSI0
mediatek,MIPI_RX_ANA_CSI1
mtk-gpio
mediatek,cache-dump-memory
mtk_memcfg
3[%s]: mkdir /proc/mtk_memcfg failed
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/mem/mtk_memcfg.c
6/proc/mtk_memcfg not exist
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/mem/mtk_memcfg_reserve_info.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/cmdq/v2/cmdq_core.c
mtk_cmdq_task
mediatek,MMSYS_CONFIG
mtk_cmdq
mediatek,mm_mutex
mtk_cmdq_debug
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/cmdq/v2/cmdq_mdp_common.c
warm reset
mediatek,MSDC0
mediatek,mdp_rdma
mediatek,mdp_rsz0
mediatek,mdp_rsz1
mediatek,mdp_wdma
mediatek,mdp_wrot
mediatek,mdp_tdshp
MTK BOOT MODE :
ALARM BOOT
mediatek,chipid
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/chip/mt6580/mt_chip.c
mediatek,DEVAPC_AO
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/devinfo/v1/devinfo.c
mediatek,lcmbias
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/mt6580/primary_display.c
mtkfb_release_layer_fence session=0x%x, layerid=%d
mediatek, dsi_te-eint
mtk_disp_mgr_probe called!
mtk_disp_mgr
mtk_disp_mgr_probe was failed, ruturn %d
mtk_disp_mgr_ioctl, cmd=%s, arg=0x%lx
mtk_mira
DISP_HELPER_OPTION_OVL_WARM_RESET
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/mt6580/ddp_ovl.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/mt6580/ddp_rdma_ex.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/mt6580/ddp_dsi.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/mt6580/ddp_manager.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/mt6580/ddp_color_format.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/common/mtkfb_fence.c
3[DISP]mtkfb_update_buf_state return MVA=0x0 mtkfb_query_buf_mva layer_id %d !!!!!!(Warning)
3[DISP]mtkfb_update_buf_ticket,session_info is NULL
mtkfb_set_backlight_level:%d Start
mtkfb_set_backlight_level End
mtkfb_check_var, xres=%u, yres=%u, xres_virtual=%u, yres_virtual=%u,
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/common/mtkfb.c
4DISP/MTKFB [FB Driver] enter late_resume
4DISP/MTKFB [FB Driver] leave late_resume
mtkfb_set_par, fb_layer.src_fmt=%x
3[DISP]failed to mtkfb_check_var
3[DISP]failed to mtkfb_set_par
[MTKFB_VSYNC]:mtkfb has suspend, return directly
FB_ACTIVATE_NO_UPDATE flag found, ignore mtkfb_pan_display_impl
4DISP/MTKFB [FB Driver] mtkfb_shutdown()
4DISP/MTKFB mtkfb has been power off
4DISP/MTKFB [FB Driver] leave mtkfb_shutdown
[mtkfb] not found LCM driver, return NULL
MTK_FB_XRES=%d, MTKFB_YRES=%d, MTKFB_BPP=%d, MTK_FB_PAGES=%d, MTKFB_LINE=%d, MTKFB_SIZEV=%d
3[DISP]mtkfb_fbinfo_init fail, r = %d
3DISP/MTKFB failed to mtkfb_check_var
mtkfb_ioctl, info=%p, cmd nr=0x%08x, cmd size=0x%08x
4DISP/MTKFB [FB Driver] Still in MTKFB_POWEROFF!!!
4DISP/MTKFB [FB Driver] enter MTKFB_POWEROFF
4DISP/MTKFB [FB Driver] leave MTKFB_POWEROFF
[FB Driver] Still in MTKFB_POWERON!!!
4DISP/MTKFB [FB Driver] enter MTKFB_POWERON
4DISP/MTKFB [FB Driver] leave MTKFB_POWERON
3[DISP][FB]: MTKFB_GET_POWERSTATE failed!
MTKFB_SLT_AUTO_CAPTURE
3[DISP]MTKFB_SET_OVERLAY_LAYER, layer_id invalid=%d
[DDP] mtkfb_ioctl():MTKFB_ERROR_INDEX_UPDATE_TIMEOUT
3[DISP]MTKFB_SET_VIDEO_LAYERS, layer_id invalid=%d
[MTKFB EM]MTKFB_GET_DEFAULT_UPDATESPEED is %d
[MTKFB EM]MTKFB_GET_CURR_UPDATESPEED is %d
[MTKFB EM]MTKFB_CHANGE_UPDATESPEED is %d
MTKFB_META_SHOW_BOOTLOGO
mtkfb_ioctl Not support, info=%p, cmd=0x%08x, arg=0x%lx
3DISP/MTKFB failed to register mtkfb driver
mediatek,lcd-backlight
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/common/rdma10/ddp_rdma.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/video/common/wdma10/ddp_wdma.c
call mtk_get_custom_upbound_gpu_freq false
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/ged/src/ged_ge.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_osk_atomics.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_osk_wq.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_osk_wait_queue.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_osk_low_level_mem.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_osk_mali.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_osk_notification.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_osk_timers.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_osk_bitmap.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_session.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_os_alloc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_external.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_block_alloc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_swap_alloc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_pp_job.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_manager.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_virtual.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_util.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_cow.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_defer_bind.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_ukk_soft_job.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_ukk_timeline.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_kernel_core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_group.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_kernel_linux.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_session.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_l2_cache.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_kernel_sysfs.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_mmu.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_mmu_page_directory.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_mem_validation.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_hw_core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_gp.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_gp_job.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_pp.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_pp_job.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_gp_job.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_soft_job.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_scheduler.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_osk_list.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_timeline.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_executor.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_group.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_pp.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_dlbu.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_broadcast.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_pm.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_pm_domain.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_pmu.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_user_settings_db.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_kernel_utilization.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_l2_cache.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_timeline.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_spinlock_reentrant.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_timeline_fence_wait.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_timeline_sync_fence.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_spinlock_reentrant.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/common/mali_pm_domain.c
mtk_mali_pm
mtk_mali_pm2
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_osk_pm.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/platform/mt6580/platform.c
[MALI] mtk_perf_hal_callback() level=%d, boost ID=%d
[MALI] mtk_ged_hal_callback() level=%d, boost ID=%d
[MALI] mtk_gpu_power_limit_callback() set to freq id=%d
[MALI] mtk_gpu_input_boost_callback() set to freq id=%d
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_dma_buf.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_memory_secure.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/linux/mali_sync.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/gpu/gpu_mali/mali_utgard/mali/mali_r8p0-00dev0/platform/mt6580/arm_core_scaling.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/smi/smi_common.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/freqhopping/mt_freqhopping_drv.c
ARMCA7:0x%08x M:0x%08x MAIN:0x%08x MEM:0x%08x
mediatek,FHCTL
id=ARMCA7PLL=MAINPLL=WHPLL=MEMPLL
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/cameraisp/src/mt6580/camera_isp.c
mediatek,camera_hw
mediatek,CAMERA_MAIN_AF
mediatek,reserve-memory-ccci_md1
mediatek,reserve-memory-ccci_md2
mediatek,reserve-memory-ccci_md3_ccif
mediatek,reserve-memory-ccci_share
mediatek,ap2c2k_ccif
mediatek,ap_ccif1
mediatek,md_smem_size
mediatek,md%d-smem-size
mediatek,md1md3-smem-size
mediatek,version
mediatek,ccci_util_cfg
mediatek,mdcldma
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/ccci_util/ccci_util_lib_fo.c
[%d/util]load_image: check_header_v5, arm7_offset = 0x%08X, arm_size = 0x%08X
armv7_%s.bin
armv7_%d_%s_n.bin
[MTK_ECCCI_C2K]:1
LD_ERR_ASS_FIND_ARMV7_INF_FAIL
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/dual_ccci/ccci_hw.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/dual_ccci/ccci_logical.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/dual_ccci/ccci_md_main.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/dual_ccci/ccci_chrdev.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/netdevice.h
mediatek,gpio_usage_mapping
mediatek,MCUSYS_CFGREG_BASE
mediatek,AP_MD_DBGMODE_CFGREG
MT6580_S00
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/dual_ccci/mt6580/src/ccci_platform.c
MT6580E1
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/dual_ccci/mt6580/src/ccci_settings.c
mediatek,connectivity-combo
MTK-BTIF[I]%s:DO BTIF REMOVE
MTK-BTIF[I]%s:DO BTIF PROBE
MTK-BTIF[I]%s:++
MTK-BTIF[I]%s:--, mask:%d
MTK-BTIF[E]%s(%d):p_dma is NULL
MTK-BTIF[E]%s(%d):invalid parameter: p_btif(0x%p)
MTK-BTIF[W]%s:Null dev pointer!!!!
MTK-BTIF[E]%s(%d):BTIF vFIFO memory already allocated, do nothing
MTK-BTIF[E]%s(%d):alloc vFIFO memory for BTIF failed
MTK-BTIF[I]%s:alloc vFIFO for BTIF succeed in arch32,vir addr:0x%p,
MTK-BTIF[E]%s(%d):p_btif->rx_cb is NULL
MTK-BTIF[W]%s:p_btif:0x%p, both rx_notify and rx_cb are NULL
MTK-BTIF[D]%s:length:%d
MTK-BTIF[D]%s:p_btif:0x%p
MTK-BTIF[E]%s(%d):_btif_tx_dma_free failed, i_ret(%d)
MTK-BTIF[E]%s(%d):_btif_rx_dma_free failed, i_ret(%d)
MTK-BTIF[E]%s(%d):p_btif is NULL
MTK-BTIF[D]%s:schedule btif_rx_thread
MTK-BTIF[D]%s:schedule btif_rx_worker
MTK-BTIF[D]%s:schedule btif_rx_tasklet
MTK-BTIF[E]%s(%d):unsupported rx context type:%d
MTK-BTIF[D]%s:loopback function enabled
MTK-BTIF[D]%s:loopback function disabled
MTK-BTIF[D]%s:++, p_btif(0x%p)
MTK-BTIF[D]%s:--
MTK-BTIF[W]%s:max retry timer expired, timer_start.tv_sec:%d, timer_now.tv_sec:%d,
MTK-BTIF[D]%s:Tx DMA is not finished
MTK-BTIF[D]%s:BTIF Tx is not finished
MTK-BTIF[W]%s:failed, i_ret:%d
MTK-BTIF[I]%s:signaling btif rx thread to stop ...
MTK-BTIF[I]%s:btif_rx_worker cancelled
MTK-BTIF[I]%s:btif_rx_workqueue destroyed
MTK-BTIF[I]%s:rx_tasklet killed
MTK-BTIF[W]%s:%s is not supported
MTK-BTIF[I]%s:pid:%d
MTK-BTIF[D]%s:++
MTK-BTIF[I]%s:btif_rxd_time_stamp[%d]=%d.%d
MTK-BTIF[I]%s:time_gap[%d]=%d,counter:%d
MTK-BTIF[E]%s(%d):abnormal case now:%d < time_stamp[%d]:%d
MTK-BTIF[I]%s:tx pkt_count:%d is sync pkt
MTK-BTIF[E]%s(%d):there is no sync pkt in BTIF buffer
MTK-BTIF[E]%s(%d):there are %d sync pkt in BTIF buffer
MTK-BTIF[E]%s(%d):btif_rxd thread be blocked too long!
MTK-BTIF[E]%s(%d):mutex_lock_killable return failed
MTK-BTIF[W]%s:btif rx thread stoping ...
MTK-BTIF[I]%s:already in %s state
MTK-BTIF[D]%s:%s->%s request
MTK-BTIF[E]%s(%d):%s->%s is not allowed
MTK-BTIF[E]%s(%d):state change request is not allowed, this should never happen
MTK-BTIF[E]%s(%d):invalid state:%d, do nothing
MTK-BTIF[I]%s:%s UBS:0x%p
MTK-BTIF[W]%s:ava_len too long, size(%d)
MTK-BTIF[I]%s:--, i_ret:%d
MTK-BTIF[E]%s(%d):hal_btif_clk_ctrl failed, i_ret(%d)
MTK-BTIF[E]%s(%d):hal_btif_hw_init failed, i_ret(%d)
MTK-BTIF[E]%s(%d):_btif_irq_reg failed, i_ret(%d)
MTK-BTIF[D]%s:succeed
MTK-BTIF[E]%s(%d):_btif_controller_init failed, i_ret(%d)
MTK-BTIF[E]%s(%d):hal_btif_dma_clk_ctrl failed, i_ret(%d)
MTK-BTIF[E]%s(%d):hal_btif_dma_ctrl failed, i_ret(%d),
MTK-BTIF[E]%s(%d):_btif_tx_dma_setup failed,i_ret(%d),
MTK-BTIF[E]%s(%d):_btif_controller_tx_setup failed, i_ret(%d)
MTK-BTIF[E]%s(%d):hal_btif_dma_clk_ctrl failed, i_ret(%d),
MTK-BTIF[E]%s(%d):_btif_tx_dma_setup failed, i_ret(%d),
MTK-BTIF[I]%s:invalid state change:%d->
MTK-BTIF[W]%s:operation is not allowed, current state:%d
MTK-BTIF[E]%s(%d):input handling fail!
MTK-BTIF[I]%s:buffer = %s, count = %zd
MTK-BTIF[I]%s:x = 0x%08x
MTK-BTIF[I]%s:y = 0x%08x
MTK-BTIF[I]%s:x(0x%08x), y(0x%08x), z(0x%08x)
MTK-BTIF[E]%s(%d):mtk_btif_dbg_lvl set to %d
MTK-BTIF[I]%s:g_max_pkg_len is set to %d
MTK-BTIF[I]%s:g_max_pding_data_size is set to %d
MTK-BTIF[W]%s:not supported.
MTK-BTIF[E]%s(%d):BTIF in ON state,
MTK-BTIF[I]%s:failed
MTK-BTIF[I]%s:succeed
MTK-BTIF[D]%s:--, i_ret:%d
MTK-BTIF[I]%s:BTIF HW IRQ restore succeed
MTK-BTIF[I]%s:BTIF HW IRQ restore failed, i_ret:%d
MTK-BTIF[I]%s:BTIF Tx DMA IRQ restore succeed
MTK-BTIF[I]%s:BTIF Tx DMA IRQ restore failed, i_ret:%d
MTK-BTIF[I]%s:BTIF Rx DMA IRQ restore succeed
MTK-BTIF[I]%s:BTIF Rx DMA IRQ restore failed, i_ret:%d
MTK-BTIF[E]%s(%d):!!!-----------------!BTIF is not closed before IPOH shutdown!!!---------------!
MTK-BTIF[I]%s:--
MTK-BTIF[I]%s:BTIF state: %s before resume, do nothing
MTK-BTIF[W]%s:there is not enough data for parser,need(%d),have(%d)
MTK-BTIF[I]%s:data count in bbs buffer:%d,wr_idx(%d),rd_idx(%d)
MTK-BTIF[W]%s:vmalloc memory fail
MTK-BTIF[I]%s:tail_Len(%d)
MTK-BTIF[I]%s:sub_str_len:%d
MTK-BTIF[D]%s:i:%d
MTK-BTIF[I]%s:0x%2x
MTK-BTIF[I]%s:find sub str index:%d
MTK-BTIF[W]%s:rx cb already exist, rewrite from (0x%p) to (0x%p)
MTK-BTIF[E]%s(%d):BTIF in OFF state,
MTK-BTIF[E]%s(%d):BTIF's original state is %s, not B_S_ON
MTK-BTIF[E]%s(%d):!!!!---<<<This should never happen in normal mode>>>---!!!
MTK-BTIF[E]%s(%d):switch to B_S_ON failed
MTK-BTIF[I]%s:BTIF Tx in PIO mode,no need to dump Tx DMA's register
MTK-BTIF[I]%s:BTIF Rx in PIO mode,no need to dump Rx DMA's register
MTK-BTIF[E]%s(%d):invalid parameter, p_log_que(0x%x), buf(0x%x),
MTK-BTIF[E]%s(%d):no empty space left for write, (%d)ava_len, (%d)to write
MTK-BTIF[E]%s(%d):BTIF overrun, (%d)empty, (%d)needed
MTK-BTIF[W]%s:buf_len too long, (%d)ava_len, (%d)to write
MTK-BTIF[W]%s:Rx buf_len too long, size(%d)
MTK-BTIF[E]%s(%d):wait for tx allowed timeout
MTK-BTIF[D]%s:lent sent:%d, total sent:%d
MTK-BTIF[I]%s:exceed retry times limit :%d
MTK-BTIF[E]%s(%d):invalid tx mode:%d
MTK-BTIF[D]%s:schedule btif_tx_worker
MTK-BTIF[E]%s(%d):fifo in failed, target len(%d),in len(%d),
MTK-BTIF[E]%s(%d):invalid btif tx context:%d
MTK-BTIF[W]%s:_btif_send_data return 0, retry
MTK-BTIF[W]%s:btif send data fail,reset tx fifo, i_ret(%d)
MTK-BTIF[I]%s:btif %s log buffer size:%d
MTK-BTIF[I]%s:dir:%s, pkt_count:%d, %d.%ds len:%d
MTK-BTIF[I]%s:enable %s log function
MTK-BTIF[I]%s:disable %s log function
MTK-BTIF[I]%s:%s log rt output enabled
MTK-BTIF[I]%s:%s log rt output disabled
MTK-BTIF[D]%s:reset %s log buffer
MTK-BTIF[D]%s:BTIF's Tx Mode:%d, Rx Mode(%d)
MTK-BTIF[D]%s:cmd (%u), arg (0x%lx)
MTK-BTIF[E]%s(%d):btif_open failed, error code:%d
MTK-BTIF[I]%s:btif_open succeed
MTK-BTIF[E]%s(%d):btif_close failed, error code:%d
MTK-BTIF[I]%s:btif_close succeed
MTK-BTIF[I]%s:unknown cmd(%d)
MTK-BTIF[D]%s:tx_log.p_queue:0x%p
MTK-BTIF[D]%s:rx_log.p_queue:0x%p
MTK-BTIF[E]%s(%d):BTIF platform driver registered failed, ret(%d)
MTK-BTIF[E]%s(%d):BTIF pdriver_create_file failed, ret(%d)
MTK-BTIF[E]%s(%d):p_btif_buffer kmalloc memory fail
MTK-BTIF[I]%s:p_btif_buffer get memory 0x%p
MTK-BTIF[E]%s(%d):p_tx_queue kmalloc memory fail
MTK-BTIF[I]%s:p_tx_queue get memory 0x%p
MTK-BTIF[E]%s(%d):p_rx_queue kmalloc memory fail
MTK-BTIF[I]%s:p_rx_queue get memory 0x%p
MTK-BTIF[E]%s(%d):BTIF Tx vFIFO allocation failed
MTK-BTIF[E]%s(%d):BTIF Rx vFIFO allocation failed
MTK-BTIF[E]%s(%d):kthread_create fail
MTK-BTIF[I]%s:btif_rxd start to work!
MTK-BTIF[E]%s(%d):create_singlethread_workqueue fail
MTK-BTIF[I]%s:btif_rx_worker init succeed
MTK-BTIF[I]%s:btif_rx_tasklet init succeed
MTK-BTIF[I]%s:rx_spin_lock init succeed
MTK-BTIF[E]%s(%d):BTIF Rx btm init failed
MTK-BTIF[E]%s(%d):create_singlethread_workqueue for tx thread fail
MTK-BTIF[I]%s:btif_tx_worker init succeed
MTK-BTIF[E]%s(%d):kzalloc for p_btif->p_tx_fifo failed
MTK-BTIF[E]%s(%d):kfifo_alloc failed, errno(%d)
MTK-BTIF[I]%s:nothing is done when btif tx in user's thread
MTK-BTIF[E]%s(%d):unsupported tx context type:%d
MTK-BTIF[I]%s:btif_tx_workqueue destroyed
MTK-BTIF[E]%s(%d):BTIF Tx context init failed
MTK-BTIF[E]%s(%d):devuce number allocation failed, i_ret:%d
MTK-BTIF[I]%s:devuce number allocation succeed
MTK-BTIF[E]%s(%d):error add btif dev to kernel, error code:%d
MTK-BTIF[I]%s:add btif dev to kernel succeed
MTK-BTIF[E]%s(%d):error happened when doing class_create
MTK-BTIF[I]%s:create class for btif succeed
MTK-BTIF[E]%s(%d):error happened when doing device_create
MTK-BTIF[I]%s:create device for btif succeed
mtk_btif
MTK-BTIF-EXP[D]%s:++
MTK-BTIF-EXP[D]%s:p_btif(0x%p)
MTK-BTIF-EXP[E]%s(%d):mutex_lock_killable return failed
MTK-BTIF-EXP[E]%s(%d):parameter invalid, p_owner(0x%p), p_id(0x%p)
MTK-BTIF-EXP[E]%s(%d):BTIF's user list is not empty
MTK-BTIF-EXP[I]%s:BTIF's user id(0x%lx), name(%s)
MTK-BTIF-EXP[D]%s:owner name:%s, recorded name:%s
MTK-BTIF-EXP[E]%s(%d):btif_open failed, i_ret(%d)
MTK-BTIF-EXP[I]%s:btif_open succeed
MTK-BTIF-EXP[E]%s(%d):allocate memory for mtk_btif_user failed
MTK-BTIF-EXP[D]%s:--
MTK-BTIF-EXP[D]%s:BTIF's user id(0x%p), p_btif(0x%p)
MTK-BTIF-EXP[I]%s:no btif structure found for BTIF's user id(0x%lx)
MTK-BTIF-EXP[I]%s:user who's id is 0x%lx deleted from user list
MTK-BTIF-EXP[W]%s:BTIF close failed
MTK-BTIF-EXP[E]%s(%d):invalid p_buf (0x%p)
MTK-BTIF-EXP[E]%s(%d):invalid buffer length(%d)
MTK-BTIF-EXP[D]%s:--, i_ret:%d
MTK-BTIF-EXP[I]%s:disable btif log function for both Tx and Rx
MTK-BTIF-EXP[I]%s:enable btif log function for both Tx and Rx
MTK-BTIF-EXP[I]%s:dump btif log for both Tx and Rx
MTK-BTIF-EXP[I]%s:clear btif log for both Tx and Rx
MTK-BTIF-EXP[I]%s:enable btif real time log for both Tx and Rx
MTK-BTIF-EXP[I]%s:disable btif real time log for both Tx and Rx
MTK-BTIF-EXP[I]%s:not supported flag:%d
MTK-BTIF-EXP[I]%s:parser wmt evt %s
MTK-BTIF-EXP[E]%s(%d):btif_close failed, i_ret(%d)
MTK-BTIF-EXP[I]%s:btif_close succeed
MTK-BTIF-EXP[I]%s:mtk_wcn_btif_open failed
MTK-BTIF-EXP[I]%s:mtk_wcn_btif_open succeed
MTK-BTIF-EXP[I]%s:mtk_wcn_btif_close failed
MTK-BTIF-EXP[I]%s:mtk_wcn_btif_close succeed
MTK-BTIF-EXP[E]%s(%d):btif tester kmalloc failed
MTK-BTIF-EXP[I]%s:mtk_wcn_btif_loopback_ctrl returned %d
MTK-BTIF-EXP[I]%s:mtk_wcn_btif_write left loop:%d, i_ret:%d
MTK-BTIF-EXP[I]%s:mtk_wcn_btif_write failed, target len %d, sent len: %d
MTK-BTIF-DMA[E]%s(%d):BTIF's DMA in stop state, omit flush operation
MTK-BTIF-DMA[D]%s:flush tx dma
MTK-BTIF-DMA<%s> <%d>
MTK-BTIF-DMA[E]%s(%d):invalid DMA dma dir (%d)
mediatek,btif_rx
MTK-BTIF-DMA[I]%s:get rx_dma irq(%d),register base(0x%lx)
MTK-BTIF-DMA[E]%s(%d):get rx_dma device node fail
MTK-BTIF-DMA[E]%s(%d):get interrupt flag from DTS fail
MTK-BTIF-DMA[I]%s:get interrupt flag(0x%x)
MTK-BTIF-DMA[E]%s(%d):get register phy base from DTS fail,dma_dir(%d)
MTK-BTIF-DMA[I]%s:get register phy base dma_dir(%d)(0x%x)
mediatek,btif_tx
MTK-BTIF-DMA[I]%s:get tx_dma irq(%d),register base(0x%lx)
MTK-BTIF-DMA[E]%s(%d):get tx_dma device node fail
MTK-BTIF-DMA[E]%s(%d):invalid DMA dir (%d)
MTK-BTIF-DMA[W]%s:enable_clock for MTK_BTIF_APDMA_CLK_CG failed, ret:%d
MTK-BTIF-DMA[W]%s:disable_clock for MTK_BTIF_APDMA_CLK_CG failed, ret:%d
MTK-BTIF-DMA[E]%s(%d):invalid  clock ctrl flag (%d)
MTK-BTIF-DMA[D]%s:dma clock %s
MTK-BTIF-DMA[E]%s(%d):%s dma clock failed, ret(%d)
MTK-BTIF-DMA[D]%s:DMA's clock is %s
MTK-BTIF-DMA[D]%s:BTIF Rx DMA disabled,EN(0x%x),STOP(0x%x)
MTK-BTIF-DMA[D]%s:BTIF Rx DMA enabled
MTK-BTIF-DMA[E]%s(%d):invalid DMA ctrl_id (%d)
MTK-BTIF-DMA[D]%s:BTIF Tx DMA disabled,EN(0x%x),STOP(0x%x)
MTK-BTIF-DMA[D]%s:BTIF Tx DMA enabled
MTK-BTIF-DMA[E]%s(%d):invalid dma ctrl id (%d)
MTK-BTIF-DMA[D]%s:rx_cb already registered, replace (0x%p) with (0x%p)
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/btif/common/btif_dma_plat.c
MTK-BTIF-DMA[E]%s(%d):%s: clock is off before irq status clear done!!!
MTK-BTIF-DMA[E]%s(%d):**********************ERROR, ERROR, ERROR**************************
MTK-BTIF-DMA[E]%s(%d):BTIF Tx IRQ happened %d times (continiously), between %d.%d and %d.%d
MTK-BTIF-DMA[D]%s:superious IRQ occurs, vff_len(%d), valid_size(%d), left_len(%d)
MTK-BTIF-DMA[D]%s:DMA tx finished.
MTK-BTIF-DMA[D]%s:DMA tx is in process. vfifo valid size(%d), dma internal size (%d), tx_done(%d)
MTK-BTIF-DMA[D]%s:DMA tx ava room (%d).
MTK-BTIF-DMA[I]%s:DMA tx vfifo is full.
MTK-BTIF-DMA[W]%s:btif tx dma is not allowed
MTK-BTIF-DMA[E]%s(%d):invalid parameters, p_buf:0x%p, buf_len:%d
MTK-BTIF-DMA[E]%s(%d):length to send:(%d) < length available(%d), abnormal!!!---!!!
MTK-BTIF-DMA[E]%s(%d):Tx DMA flush operation is in process, this case should never happen,
MTK-BTIF-DMA[E]%s(%d):%s: clock is off before irq handle done!!!
MTK-BTIF-DMA[D]%s:rx interrupt, no data available in Rx DMA, wpt(0x%08x), rpt(0x%08x)
MTK-BTIF-DMA[E]%s(%d):no rx_cb found, please check your init process
MTK-BTIF-DMA[E]%s(%d):%s: clock is off, this should never happen!!!
MTK-BTIF-DMA[I]%s:DMA's clock is on
MTK-BTIF-DMA[I]%s:Tx DMA's base address: 0x%lx
MTK-BTIF-DMA[I]%s:TX_EN(:0x%x
MTK-BTIF-DMA[I]%s:INT_FLAG:0x%x
MTK-BTIF-DMA[I]%s:TX_STOP:0x%x
MTK-BTIF-DMA[I]%s:TX_FLUSH:0x%x
MTK-BTIF-DMA[I]%s:TX_WPT:0x%x
MTK-BTIF-DMA[I]%s:TX_RPT:0x%x
MTK-BTIF-DMA[I]%s:INT_BUF_SIZE:0x%x
MTK-BTIF-DMA[I]%s:VALID_SIZE:0x%x
MTK-BTIF-DMA[I]%s:INT_EN:0x%x
MTK-BTIF-DMA[I]%s:TX_RST:0x%x
MTK-BTIF-DMA[I]%s:VFF_ADDR:0x%x
MTK-BTIF-DMA[I]%s:VFF_LEN:0x%x
MTK-BTIF-DMA[I]%s:TX_THRE:0x%x
MTK-BTIF-DMA[I]%s:W_INT_BUF_SIZE:0x%x
MTK-BTIF-DMA[I]%s:LEFT_SIZE:0x%x
MTK-BTIF-DMA[I]%s:DBG_STATUS:0x%x
MTK-BTIF-DMA[W]%s:unknown flag:%d
MTK-BTIF-DMA[I]%s:tx dma %s
MTK-BTIF-DMA[I]%s:data in tx dma is %s sent by HW
MTK-BTIF-DMA[I]%s:dump DMA status register
MTK-BTIF-DMA[I]%s:Rx DMA's base address: 0x%lx
MTK-BTIF-DMA[I]%s:RX_EN(:0x%x
MTK-BTIF-DMA[I]%s:RX_STOP:0x%x
MTK-BTIF-DMA[I]%s:RX_FLUSH:0x%x
MTK-BTIF-DMA[I]%s:RX_WPT:0x%x
MTK-BTIF-DMA[I]%s:RX_RPT:0x%x
MTK-BTIF-DMA[I]%s:RX_RST:0x%x
MTK-BTIF-DMA[I]%s:RX_THRE:0x%x
MTK-BTIF-DMA[I]%s:RX_FLOW_CTRL_THRE:0x%x
MTK-BTIF-DMA[I]%s:rx dma %s
MTK-BTIF-DMA[I]%s:data in rx dma is %s by driver
MTK-BTIF-DMA[W]%s:unknown dir:%d
MTK-BTIF-DMA[I]%s:op id: %d
mtk btif rx dma irq
mtk btif tx dma irq
MTK-BTIF[W]%s:p_btif_info->p_tx_fifo is already init p_btif_info->p_tx_fifo(0x%p)
MTK-BTIF[I]%s:_btif_tx_fifo_init succeed
MTK-BTIF[E]%s(%d):_btif_tx_fifo_init failed, i_ret:%d
mediatek,btif
MTK-BTIF[I]%s:get btif irq(%d),register base(0x%lx)
MTK-BTIF[E]%s(%d):get btif device node fail
MTK-BTIF[E]%s(%d):get interrupt flag from DTS fail
MTK-BTIF[I]%s:get interrupt flag(0x%x)
MTK-BTIF[E]%s(%d):get register phy base from DTS fail
MTK-BTIF[I]%s:get register phy base(0x%x)
MTK-BTIF[W]%s:enable_clock for MTK_BTIF_CG_BIT failed, ret:%d
MTK-BTIF[W]%s:disable_clock for MTK_BTIF_CG_BIT failed, ret:%d
MTK-BTIF[E]%s(%d):invalid
MTK-BTIF[D]%s:btif clock %s
MTK-BTIF[E]%s(%d):%s btif clock failed, ret(%d)
MTK-BTIF[D]%s:BTIF's clock is %s
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/btif/common/btif_plat.c
MTK-BTIF[E]%s(%d):%s: clock is off before irq handle done!!!
MTK-BTIF[D]%s:BTIF tx size %d done, left:%d
MTK-BTIF[D]%s:BTIF tx FIFO is empty
MTK-BTIF[D]%s:rx_cb already registered, replace (0x%p) with (0x%p)
MTK-BTIF[D]%s:tx kfifo:0x%p, available room:%d
MTK-BTIF[E]%s(%d):target tx len:%d, len sent:%d
MTK-BTIF[D]%s:enqueue len:%d
MTK-BTIF[E]%s(%d):%s: clock is off before send wakeup signal!!!
MTK-BTIF[E]%s(%d):%s: clock is off, this should never happen!!!
MTK-BTIF[I]%s:BTIF's clock is on
MTK-BTIF[I]%s:base address: 0x%lx
MTK-BTIF[I]%s:Tx DMA %s
MTK-BTIF[I]%s:Rx DMA %s
MTK-BTIF[I]%s:Rx data is %s
MTK-BTIF[I]%s:Tx data is %s
MTK-BTIF[D]%s:BTIF flag, tx_empty:%d, rx_dr:%d, tx_irq_disable:%d
MTK-BTIF[D]%s:BTIF tx FIFO is not empty
MTK-BTIF[W]%s:BTIF tx FIFO is full
MTK-BTIF[D]%s:op id: %d
mtk btif irq
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/performance/perf_ioctl/perf_ioctl.c
mtkcooler
mtktscpu
mtktsabb
mtktspmic
mtktsbattery2
mtktsbattery
mtktstdpa
mtktswmt
mtktsbuck
mtktspcb1
mtktspcb2
mtktsskin
mtktsxtal
mtktsbtsmdpa
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/mtk_cooler_shutdown.c
mtk-cl-shutdown%02d
mtk-cl-backlight%02d
mtk-cl-kshutdown%02d
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/mtk_cooler_cam.c
mtk-cl-cam%02d
mtk-cl-cam-urgent
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/mtk_cooler_vrt.c
mtk-cl-vrt%02d
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/mtk_thermal_platform.c
3THERMAL/PLATFORM[mtk_thermal_validation_wr] bad argument
3THERMAL/PLATFORM[mtk_thermal_platform_init] Can not create /proc/driver/tm_validation
[mtktsbattery_read] trip_0_temp=%d,trip_1_temp=%d,trip_2_temp=%d,trip_3_temp=%d,
mtktsbattery_write
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/thermal_zones/mtk_ts_battery.c
mtktsbattery-sysrst
[mtkts_bts_read] trip_0_temp=%d,trip_1_temp=%d,trip_2_temp=%d,trip_3_temp=%d,trip_4_temp=%d
mtkts_bts_write
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/thermal_zones/mtk_ts_bts.c
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_get_temp CPU bank%d T%d=%d
7[name:mtk_ts_cpu&][CPU_Thermal]mtk_gpufreq_register
7[name:mtk_ts_cpu&][CPU_Thermal][%d].gpufreq_khz=%u, .gpufreq_power=%u
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_unregister_thermal
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_exit
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_register_thermal
7[name:mtk_ts_cpu&][CPU_Thermal]%s CPU T=%d
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_unbind unbinding OK
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_bind binding OK, %d
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write_Tj_out lv_Tj_out_flag=%d
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write_Tj_out bad argument
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_talking_flag_write talking_flag=%d
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_talking_flag_write bad argument
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_set_temperature_write
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_set_temperature_write temperature_switch=%d
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write_fastpoll input %d %d
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write_fastpoll applied %d %d
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write_fastpoll out of range
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write_fastpoll bad argument
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write tscpu_unregister_thermal
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/thermal_zones/mtk_ts_cpu.c
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write bad argument
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write TTJ0=%d, TTJ1=%d, TTJ2=%d
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write g_THERMAL_TRIP_0=%d,g_THERMAL_TRIP_1=%d,g_THERMAL_TRIP_2=%d,
7[name:mtk_ts_cpu&][CPU_Thermal]g_THERMAL_TRIP_3=%d,g_THERMAL_TRIP_4=%d,g_THERMAL_TRIP_5=%d,g_THERMAL_TRIP_6=%d,
7[name:mtk_ts_cpu&][CPU_Thermal]g_THERMAL_TRIP_7=%d,g_THERMAL_TRIP_8=%d,g_THERMAL_TRIP_9=%d,
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write cooldev0=%s,cooldev1=%s,cooldev2=%s,cooldev3=%s,cooldev4=%s,
7[name:mtk_ts_cpu&][CPU_Thermal]cooldev5=%s,cooldev6=%s,cooldev7=%s,cooldev8=%s,cooldev9=%s
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write trip_0_temp=%d,trip_1_temp=%d,trip_2_temp=%d,trip_3_temp=%d,trip_4_temp=%d,
7[name:mtk_ts_cpu&][CPU_Thermal]trip_5_temp=%d,trip_6_temp=%d,trip_7_temp=%d,trip_8_temp=%d,trip_9_temp=%d,
7[name:mtk_ts_cpu&][CPU_Thermal]time_ms=%d, num_trip=%d
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_write tscpu_register_thermal
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_init
7[name:mtk_ts_cpu&][CPU_Thermal][%s]: mkdir /proc/driver/thermal failed
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_thermal_suspend
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_thermal_suspend no talking
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_thermal_resume
7[name:mtk_ts_cpu&][CPU_Thermal]%s adc %x, order %d
7[name:mtk_ts_cpu&][CPU_Thermal]tscpu_get_temp %s, %d
7[name:mtk_ts_cpu&][CPU_Thermal]%d
7[name:mtk_ts_cpu&][CPU_Thermal]
7[name:mtk_ts_cpu&][CPU_Thermal]talking_flag=%d
7[name:mtk_ts_cpu&][CPU_Thermal]Error at %s
7[name:mtk_ts_cpu&][CPU_Thermal]thermal_prob
7[name:mtk_ts_cpu&]THAHBST0 = 0x%x,cnt=%d, %d
mtk-thermal
7[name:mtk_ts_cpu&]find node failed
7[name:mtk_ts_cpu&]DEV: VA(%s): 0x%lx
[ mtktspa_read] trip_0_temp=%d,trip_1_temp=%d,trip_2_temp=%d,trip_3_temp=%d,trip_4_temp=%d,
mtktspa_write
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/thermal_zones/mtk_ts_pa.c
mtktspa-sysrst
mtktspmic_read_log = %d
[ mtktspmic_read] trip_0_temp=%d,trip_1_temp=%d,trip_2_temp=%d,trip_3_temp=%d,
mtktspmic_write
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/thermal_zones/mtk_ts_pmic.c
mtktspmic-sysrst
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/thermal_zones/mtk_ts_wmt.c
mtktswmt-sysrst
mtktswmt-pa1
mtktswmt-pa2
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/thermal_zones/mtk_ts1.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/thermal_zones/mtk_ts2.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/thermal_zones/mtk_ts3.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/thermal_zones/mtk_ts4.c
mtk-cl-3gmutt%02d %u %u %x, state %lu
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/coolers/mtk_cooler_3Gmutt.c
mtk-cl-3gmutt%02d
mtk-cl-bcct%02d %d mA, state %d
mtk-cl-bcct%02d
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/thermal/common/coolers/mtk_cooler_atm.c
mtktscpu-sysrst
mtktsbuck-sysrst
mtktsAP-sysrst
mediatek,THERM_CTRL
mtk_ram_console not enabled.
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/aee/aed/aed-main.c
current-ke-android_system
current-ke-android_radio
current-ke-android_main
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/aee/aed/aed-debug.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/misc/mediatek/aee/aed/monitor_hang.c
mediatek,audio_bt_cvsd
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/dma-buf/dma-buf.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/dma-buf/fence.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/scsi/scsi_error.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/scsi/scsi_lib.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/scsi/scsi_scan.c
DACARMRB
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/mtd/mtd_blkdevs.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/spi/spi.c
mediatek,spi-padmacro
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/net/tun.c
only USB3 hub support warm reset
got a wrong device descriptor, warm reset device
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/core/hcd.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/core/urb.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/usb.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/core/port.c
ums_karma
Rio Karma/Bulk
ums-karma
Rio Karma
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/phy/phy.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/gadget/composite.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/gadget/configfs.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/gadget/function/u_serial.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/gadget/function/f_mass_storage.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/gadget/function/f_fs.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/gadget/u_f.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/gadget/function/f_accessory.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/gadget/function/u_ether.c
android_usb
android0
3%s: failed to create android device %d
5android_work, !cdev
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/usb/gadget/android.c
3android_usb: already %s
3android_usb: Cannot enable '%s' (%d)
3android_usb: Cannot enable ffs (%d)
g_android
Android Accessory Interface
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/input/input.c
mediatek, hall_1-eint
mediatek,kpd-key-debounce
mediatek,kpd-sw-pwrkey
mediatek,kpd-hw-pwrkey
mediatek,kpd-sw-rstkey
mediatek,kpd-hw-rstkey
mediatek,kpd-use-extend-type
mediatek,kpd-pwrkey-eint-gpio
mediatek,kpd-pwrkey-gpio-din
mediatek,kpd-hw-dl-key1
mediatek,kpd-hw-dl-key2
mediatek,kpd-hw-dl-key3
mediatek,kpd-hw-recovery-key
mediatek,kpd-hw-factory-key
mediatek,kpd-hw-map-num
mediatek,kpd-hw-init-map
6mtk-tpd: touch driver exist
6mtk-tpd: unable to register touch panel driver.
6mtk-tpd: MediaTek touch panel driver exit
6mtk-tpd: fb_notify(blank=%d)
6mtk-tpd: LCD ON Notify
6mtk-tpd: start touch_resume_workqueue failed
6mtk-tpd: LCD OFF Notify
6mtk-tpd: cancel touch_resume_workqueue err = %d
6mtk-tpd: enter %s, %d
3mtk_tpd: tpd_misc_device register failed
6mtk-tpd: [mtk-tpd]tpd_probe, tpd_driver_name=%s
6mtk-tpd: [mtk-tpd]Generic touch panel driver
6mtk-tpd: [mtk-tpd]cap touch and Generic touch both are not loaded!!
6mtk-tpd: register fb_notifier fail!
6mtk-tpd: Cap touch panel driver
6mtk-tpd: input_register_device failed.(tpd)
mtk-tpd-kpd
6mtk-tpd: input_register_device failed.(kpd)
virtualkeys.mtk-tpd
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/rtc/hctosys.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/rtc/class.c
0alarm: %d/%d/%d, %d:%d:%d (%lld)
alarm rollover not handled
invalid alarm value: %d-%d-%d %d:%d:%d
alarm_IRQ
failed to create alarm attribute, %d
wakealarm
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/i2c/i2c-core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/power/power_supply_core.c
mediatek,bat_meter
 androidboot.mode=charger
mtk_battery_cmd
3[%s]: mkdir /proc/mtk_battery_cmd failed
3******** mtk_battery_cmd!! ********
mtk charger_hv_detect_sw_workaround
mediatek,battery
mtk_temperature_recharge_support
mtk_jeita_standard_support
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/thermal/of-thermal.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/watchdog/mediatek/wdk/wd_common_drv.c
3ARCH_RESET cannot register mtk_restart_handler!!!!
1ARCH_RESET register mtk_restart_handler  ok!!!!
3****[mtk_wdt_driver] Unable to register driver (%d)
1mtk_wdt_init ok
3fwq mtk_wdt_isr
3******** MTK WDT driver probe!! ********
3mtk_wdt_probe : failed to request irq (%d)
1MTK_WDT_MODE:0x%x
1MTK_WDT_LENGTH:0x%x
1MTK_WDT_RESTART:0x%x
1MTK_WDT_STATUS:0x%x
1MTK_WDT_INTERVAL:0x%x
1MTK_WDT_SWRST:0x%x
1MTK_WDT_NONRST_REG:0x%x
1MTK_WDT_NONRST_REG2:0x%x
1MTK_WDT_REQ_MODE:0x%x
1MTK_WDT_REQ_IRQ_EN:0x%x
1MTK_WDT_DRAMC_CTL:0x%x
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/md/dm.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/md/dm-io.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/md/dm-stats.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/cpufreq/cpufreq.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/cpufreq/cpufreq_stats.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/cpufreq/cpufreq_interactive.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/cpufreq/cpufreq_governor.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/cpuidle/cpuidle.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/cpuidle/driver.c
mt6580_cpuidle
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/mmc/core/core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/mmc/core/host.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/mmc/core/mmc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/mmc/core/sd.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/mmc/core/sdio.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/mmc/core/sdio_ops.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/mmc/core/sdio_irq.c
3[sd]mtk-msdc: Can't register driver
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/mmc/host/mediatek/mt6580/sd.c
mediatek,GPIO
mediatek,INFRACFG
mediatek,mt_pmic_regulator_supply
mtk-msdc
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/mmc/host/mediatek/mt6580/mt_dump.c
TimeAlarmTimer
AudibleAlarmControl
SMBAlarmWarning
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/hid/hid-core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/hid/hid-input.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/hid/hid-samsung.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/hid/usbhid/hid-core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/hid/usbhid/hid-quirks.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/of/base.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/of/platform.c
arm,primecell
arm,primecell-periphid
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/of/irq.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/staging/android/ion/ion.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/staging/android/ion/ion_page_pool.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/staging/android/binder.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/staging/android/binder_alloc.c
6lowmemorykiller: mtk_dump_gpu_memory_usage not support
5alarm_dev: alarm %d set %ld.%09ld
5alarm_dev: set rtc %ld %ld - rtc %02d:%02d:%02d %02d/%02d/%04d
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/drivers/staging/android/sync.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/core/jack.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/core/memalloc.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/core/seq/seq_clientmgr.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/core/seq/seq_queue.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/core/seq/seq_fifo.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/core/seq/seq_ports.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/core/seq/oss/seq_oss_synth.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/core/seq/oss/seq_oss_midi.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/usb/endpoint.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/usb/pcm.c
ac97-warm-reset
Can't find pinctrl state ac97-warm-reset
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/soc/soc-core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/soc/soc-dapm.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/soc/soc-cache.c
mediatek,mt_soc_pcm_routing
4mtk_asoc_capture_pcm_new
4mtk_capture_probe
4mtk_capture_alsa_start
4mtk_capture_alsa_stop
4mtk_capture_pcm_hw_free
4mtk_capture_pcm_open use sram
4mtk_capture_pcm_open use dram
3mtk_capture_pcm_close
4mtk_afe_capture_probe
4mtk_capture_pcm_hw_params snd_pcm_lib_malloc_pages
4mtk_pcm_dl1_hardware.buffer_bytes_max = %zu mPlaybackSramState = %d
4SNDRV_PCM_STREAM_PLAYBACK mtkalsa_dl1playback_constraints
4SNDRV_PCM_STREAM_CAPTURE mtkalsa_dl1playback_constraints
3ret < 0 mtk_soc_pcm_dl1_close
4mtk_alsa_prepare
4mtk_afe_dummy_probe
4mtk_dummy_probe
4mtk_pcm_open
4mtk_pcm_open runtime rate = %d channels = %d
4SNDRV_PCM_STREAM_PLAYBACK mtkalsa_playback_constraints
3mtk_dummypcm_close
4mtk_pcm_open return
4mtk_routing_pcm_silence
4mtk_afe_routing_probe
4mtk_routing_pcm_open
4mtk_routing_pcm_open runtime rate = %d channels = %d
4mtk_routing_pcm_close
4mtk_routing_pcm_open return
4mtk_afe_routing_platform_probe
4mtk_capture2_pcm_prepare substream->rate = %d  substream->channels = %d
4mtk_asoc_capture2_pcm_new
4mtk_capture2_probe
4mtk_capture2_pcm_trigger cmd = %d
4mtk_capture2_alsa_start
4mtk_capture2_alsa_stop
4mtk_capture2_pcm_hw_free
4mtk_capture2_pcm_open runtime rate = %d channels = %d
4SNDRV_PCM_STREAM_CAPTURE mtkalsa_capture_constraints
4mtk_capture2_pcm_close
4mtk_capture2_pcm_open return
4mtk_afe_capture2_probe
4mtk_capture2_pcm_hw_params
4mtk_capture2_pcm_hw_params Capture_dma_buf->area
4mtk_capture2_pcm_hw_params snd_pcm_lib_malloc_pages
4mtk_capture2_pcm_hw_params dma_bytes = %zu dma_area = %p dma_addr = 0x%lx
4mtk_voice_pcm_silence
4mtk_voice_trigger cmd = %d
6mtk_voice_probe
4mtk_voice_pcm_open runtime rate = %d channels = %d
4mtk_voice_close
6mtk_voice_platform_probe
4mtk_voice_pm_ops_suspend, b_modem1_speech_on=%d, b_modem2_speech_on=%d, speech_md_usage_control=%d
4mtk_voice_md2_pcm_silence
4mtk_voice_md2_trigger cmd = %d
4mtk_pcm_hw_params
4mtk_voice_md2_platform_probe
4mtk_voice_md2_probe
4mtk_voice1_ext_prepare rate = %d  channels = %d period_size = %lu
4mtk_voice_md2_close
4mtk_voice_md2_pcm_open
4mtk_voice_md2_pcm_open runtime rate = %d channels = %d
3mtk_voice_md2_close
4mtk_voice_md2_pcm_open return
4mtk_voice_bt_pcm_silence
4mtk_voice_bt_trigger cmd = %d
4mtk_voice_bt_platform_probe
4mtk_voice_bt_probe
4mtk_alsa_prepare rate = %d  channels = %d period_size = %lu
4mtk_voice_bt_close
4mtk_voice_bt_pcm_open
4mtk_voice_bt_pcm_open runtime rate = %d channels = %d
4SNDRV_PCM_STREAM_PLAYBACK mtkalsa_voice_bt_constraints
4mtk_voice_bt_pcm_open return
4mtk_voice_md2_bt_pcm_silence
4mtk_voice_md2_bt_trigger cmd = %d
4mtk_voice_md2_bt_platform_probe
4mtk_voice_md2_bt_probe
4mtk_voice_md2_bt_close
4mtk_voice_md2_bt_pcm_open
4mtk_voice_md2_bt_pcm_open runtime rate = %d channels = %d
4SNDRV_PCM_STREAM_PLAYBACK mtkalsa_voice_md2_bt_constraints
3mtk_voice_md2_bt_close
4mtk_voice_md2_bt_pcm_open return
4mtk_pcm_hdmi_stop
4mtk_pcm_i2s0_trigger cmd = %d
4mtk_pcm_i2s0_stop
4mtk_pcm_i2s0_open
4mtk_pcm_i2s0_open runtime rate = %d channels = %d substream->pcm->device = %d
4SNDRV_PCM_STREAM_PLAYBACK mtkalsa_i2s0_playback_constraints
3mtk_pcm_i2s0_close
4mtk_pcm_i2s0_open return
4mtk_afe_i2s0_probe
4mtk_I2S0dl1_hardware.buffer_bytes_max = %zu mPlaybackSramState = %d
3ret < 0 mtk_pcm_I2S0dl1_close
4mtk_afe_I2S0dl1_probe
4mtk_i2s0_awb_pcm_prepare substream->rate = %d  substream->channels = %d
4mtk_asoc_i2s0_awb_pcm_new
4mtk_i2s0_awb_probe
4mtk_i2s0_awb_pcm_copy u4DataRemained=%x > u4BufferSize=%x
4mtk_i2s0_awb_pcm_trigger cmd = %d
4mtk_i2s0_awb_alsa_start
4mtk_i2s0_awb_alsa_stop
4mtk_i2s0_capture_pcm_hw_free
4mtk_i2s0_awb_pcm_open
4mtk_i2s0_awb_pcm_open runtime rate = %d channels = %d
3mtk_i2s0_awb_pcm_close
4mtk_i2s0_awb_pcm_open return
4mtk_i2s0_dl1_awb_probe
4mtk_i2s0_awb_pcm_hw_params
4mtk_i2s0_awb_pcm_hw_params Awb_Capture_dma_buf->area
4mtk_i2s0_awb_pcm_hw_params snd_pcm_lib_malloc_pages
4mtk_i2s0_awb_pcm_hw_params dma_bytes = %zu dma_area = %p dma_addr = 0x%lx
4mtk_afe_uldlloopback_probe
4mtk_uldlloopback_probe
3%s  with mtk_uldlloopback_pcm_prepare
4mtk_uldlloopback_open runtime rate = %d channels = %d
4SNDRV_PCM_STREAM_PLAYBACK mtkalsa_voice_constraints
3mtk_uldlloopbackpcm_close
4mtk_uldlloopback_open return
mtk_pcm_dl2_stop - dl2 underflow
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/sound/soc/mediatek/mt6580/mt_soc_pcm_dl2.c
4mtk_pcm_dl2_hardware.buffer_bytes_max = %zu mPlaybackSramState = %d
3ret < 0 mtk_soc_pcm_dl2_close
mtk_pcm_dl2_copy - dl2 underflow
4mtk_pcm_mrgrx_hw_params
4mtk_pcm_mrgrx_hw_free
4mtk_pcm_mrgrx_open
4mtk_pcm_mrgrx_open runtime rate = %d channels = %d substream->pcm->device = %d
4SNDRV_PCM_STREAM_PLAYBACK mtkalsa_mrgrx_playback_constraints
4mtk_pcm_mrgrx_close
4mtk_pcm_mrgrx_open return
4mtk_afe_mrgrx_probe
4mtk_pcm_mrgrx_trigger cmd = %d
4mtk_pcm_mrgrx_stop
4mtk_mrgrx_awb_pcm_prepare substream->rate = %d  substream->channels = %d
4mtk_asoc_mrgrx_awb_pcm_new
4mtk_mrgrx_awb_probe
4mtk_capture_mrgrx_pcm_trigger cmd = %d
4mtk_mrgrx_awb_alsa_start
4mtk_mrgrx_awb_alsa_stop
4mtk_mrgrx_capture_pcm_hw_free
4mtk_mrgrx_awb_pcm_open
4mtk_mrgrx_awb_pcm_open runtime rate = %d channels = %d
3mtk_mrgrx_awb_pcm_close
4mtk_mrgrx_awb_pcm_open return
4mtk_afe_mrgrx_awb_probe
4mtk_mgrrx_awb_pcm_hw_params
4mtk_mgrrx_awb_pcm_hw_params Awb_Capture_dma_buf->area
4mtk_mgrrx_awb_pcm_hw_params snd_pcm_lib_malloc_pages
4mtk_mgrrx_awb_pcm_hw_params dma_bytes = %zu dma_area = %p dma_addr = 0x%lx
4mtk_pcm_fm_i2s_hw_params
4mtk_pcm_fm_i2s_hw_free
4mtk_pcm_fm_i2s_open
4mtk_pcm_fm_i2s_open runtime rate = %d channels = %d substream->pcm->device = %d
4SNDRV_PCM_STREAM_PLAYBACK mtkalsa_fm_i2s_playback_constraints
3mtk_pcm_fm_i2s_close
4mtk_pcm_fm_i2s_open return
4mtk_afe_fm_i2s_probe
4mtk_pcm_fm_i2s_trigger cmd = %d
4mtk_pcm_fm_i2s_stop
4mtk_fm_i2s_awb_pcm_prepare substream->rate = %d  substream->channels = %d
4mtk_asoc_fm_i2s_awb_pcm_new
4mtk_fm_i2s_awb_probe
4mtk_capture_fm_i2s_pcm_trigger cmd = %d
4mtk_fm_i2s_awb_alsa_start
4mtk_fm_i2s_awb_alsa_stop
4mtk_fm_i2s_capture_pcm_hw_free
4mtk_fm_i2s_awb_pcm_open
4mtk_fm_i2s_awb_pcm_open runtime rate = %d channels = %d
3mtk_fm_i2s_awb_pcm_close
4mtk_fm_i2s_awb_pcm_open return
4mtk_afe_fm_i2s_awb_probe
4mtk_mgrrx_awb_pcm_hw_params dma_bytes = %zu dma_area = %p dma_addr = 0x%x
4mtk_dl1_awb_pcm_prepare substream->rate = %d  substream->channels = %d
4mtk_asoc_dl1_awb_pcm_new
4mtk_dl1_awb_probe
4mtk_dl1_awb_pcm_copy u4DataRemained=%x > u4BufferSize=%x
4mtk_dl1_awb_pcm_trigger cmd = %d
4mtk_dl1_awb_alsa_start
4mtk_dl1_awb_alsa_stop
4mtk_dl1_capture_pcm_hw_free
4mtk_dl1_awb_pcm_open
4mtk_dl1_awb_pcm_open runtime rate = %d channels = %d
4mtk_dl1_awb_pcm_close
4mtk_dl1_awb_pcm_open return
4mtk_afe_dl1_awb_probe
4mtk_dl1_awb_pcm_hw_params
4mtk_dl1_awb_pcm_hw_params Awb_Capture_dma_buf->area
4mtk_dl1_awb_pcm_hw_params snd_pcm_lib_malloc_pages
4mtk_dl1_awb_pcm_hw_params dma_bytes = %zu dma_area = %p dma_addr = 0x%lx
4mtk_bt_dai_pcm_prepare substream->rate = %d  substream->channels = %d
4mtk_asoc_bt_dai_pcm_new
4mtk_bt_dai_probe
4mtk_bt_dai_pcm_trigger cmd = %d
4mtk_bt_dai_alsa_start
4mtk_bt_dai_alsa_stop
4mtk_bt_dai_capture_pcm_hw_free
4mtk_bt_dai_pcm_open
4mtk_bt_dai_pcm_open runtime rate = %d channels = %d
4mtk_bt_dai_pcm_close
4mtk_bt_dai_pcm_open return
4mtk_asoc_bt_dai_probe
4mtk_bt_dai_pcm_hw_params
4mtk_bt_dai_pcm_hw_params Bt_Dai_Capture_dma_buf->area
4mtk_bt_dai_pcm_hw_params snd_pcm_lib_malloc_pages
4mtk_bt_dai_pcm_hw_params dma_bytes = %zu dma_area = %p dma_addr = 0x%lx
4mtk_dai_stub_dev_probe  name %s
4mtk_routing_dev_probe  name %s
4[mtk_pcm_fmtx_copy] 1ptr invalid data_w_ptr=%p, size_1=%d
4[mtk_pcm_fmtx_copy] u4BufferSize=%d, u4DataRemained=%d
4mtk_pcm_fmtx_trigger cmd = %d
4mtk_fmtx_hardware.buffer_bytes_max = %zu mPlaybackSramState = %d
4SNDRV_PCM_STREAM_PLAYBACK mtkalsa_fmtx_playback_constraints
4SNDRV_PCM_STREAM_CAPTURE mtkalsa_fmtx_playback_constraints
3ret < 0 mtkalsa_fmtx_playback close
4mtk_pcm_hp_impedance_prepare
4mtk_pcm_hp_impedance_params dma_bytes = %zu dma_area = %p dma_addr = 0x%lx
mtksocaudio
mtksocanaaudio
6[name:socket&][mtk_net][socket]sock_release: fasync list not empty!
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/sock.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/request_sock.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/skbuff.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/linux/skbuff.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/datagram.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/stream.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/gen_estimator.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/dev.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/ethtool.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/dev_addr_lists.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/dst.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/neighbour.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/rtnetlink.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/dev_ioctl.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/net-sysfs.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/core/fib_rules.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/llc/llc_core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/sched/sch_generic.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/net/sch_generic.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/sched/sch_api.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/sched/act_api.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/sched/sch_htb.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/sched/cls_u32.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/sched/cls_flow.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/netlink/af_netlink.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/netlink/genetlink.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/netfilter/nf_queue.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/netfilter/nfnetlink_log.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/netfilter/nf_conntrack_seqadj.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/netfilter/nf_nat_core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/netfilter/xt_TPROXY.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/route.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/ip_fragment.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/inet_hashtables.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/inet_timewait_sock.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/inet_connection_sock.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/net/request_sock.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/tcp.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/tcp_input.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/tcp_output.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/tcp_timer.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/tcp_ipv4.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/tcp_cong.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/tcp_fastopen.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/include/net/sock.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/devinet.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/af_inet.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/igmp.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/fib_semantics.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/fib_trie.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/inet_fragment.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/ip_tunnel.c
ParmProbs
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv4/inet_diag.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/xfrm/xfrm_policy.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/xfrm/xfrm_state.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/xfrm/xfrm_user.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/xfrm/xfrm_ipcomp.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/unix/af_unix.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/af_inet6.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/anycast.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/ip6_output.c
6IPv6: [mtk_net] %s can not enable stable iid[%d]
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/addrconf.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/addrlabel.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/route.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/ip6_fib.c
6ICMPv6: [mtk_net]RA: %s, rt %p, clean route expires since lifetime %d infinite
6ICMPv6: [mtk_net]RA: %s, rt %p, set route expires since lifetime %d finite
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/mcast.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/reassembly.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/tcp_ipv6.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/inet6_connection_sock.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/xfrm6_policy.c
ParmProblems
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/mip6.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/netfilter/nf_conntrack_reasm.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/sit.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/addrconf_core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/ip6_offload.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/ipv6/inet6_hashtables.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/packet/af_packet.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/key/af_key.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/bridge/br_fdb.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/bridge/br_if.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/bridge/br_stp_if.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/bridge/br_netlink.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/bridge/br_multicast.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/8021q/vlan_core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/8021q/vlan.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/core.h
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/util.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/reg.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/scan.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/nl80211.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/mlme.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/ibss.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/sme.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/chan.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/net/wireless/wext-core.c
/home/jjx/work/mt6580_2/mt6580_go_2/alps/kernel-3.18/lib/klist.c
android_fs_datawrite_end
android_fs_datawrite_start
android_fs_dataread_end
android_fs_dataread_start
arm_elf_read_implies_exec
arm_check_condition
arm_clear_user
arm_copy_to_user
arm_copy_from_user
arm_delay_ops
arm_coherent_dma_ops
arm_dma_ops
__arm_iounmap
__arm_ioremap
__arm_ioremap_pfn
crypto_sha256_arm_finup
crypto_sha256_arm_update
alarm_forward_now
alarm_forward
alarm_cancel
alarm_try_to_cancel
alarm_restart
alarm_start_relative
alarm_start
alarm_init
alarm_expires_remaining
alarmtimer_get_rtcdev
__tracepoint_android_fs_dataread_end
__tracepoint_android_fs_dataread_start
__tracepoint_android_fs_datawrite_end
__tracepoint_android_fs_datawrite_start
mtk_uart_update_sysclk
mtk_uart_freeze_enable
mtk_i2c_master_recv
mtk_i2c_master_send
mtkfb_is_suspend
mtkfb_get_fb_size
mtkfb_get_fb_base
mtkfb_waitVsync
mtkfb_get_backlight_pwm
mtkfb_set_backlight_pwm
mtkfb_set_backlight_mode
mtkfb_set_backlight_level
mtk_get_gpu_pmu_swapnreset
mtk_get_gpu_pmu_swapnreset_fp
mtk_get_gpu_pmu_init
mtk_get_gpu_pmu_init_fp
mtk_get_vsync_offset_debug_status
mtk_get_vsync_offset_debug_status_fp
mtk_get_vsync_offset_event_status
mtk_get_vsync_offset_event_status_fp
mtk_get_gpu_custom_upbound_freq
mtk_get_gpu_custom_upbound_freq_fp
mtk_get_gpu_custom_boost_freq
mtk_get_gpu_custom_boost_freq_fp
mtk_get_gpu_bottom_freq
mtk_get_gpu_bottom_freq_fp
mtk_get_gpu_sub_loading
mtk_get_gpu_sub_loading_fp
mtk_get_vsync_based_target_freq
mtk_get_vsync_based_target_freq_fp
mtk_get_3D_fences_count
mtk_get_gpu_dvfs_from
mtk_get_gpu_dvfs_from_fp
mtk_gpu_dvfs_clock_switch
mtk_gpu_dvfs_clock_switch_fp
mtk_get_gpu_power_state
mtk_get_gpu_power_state_fp
mtk_dump_gpu_memory_usage
mtk_dump_gpu_memory_usage_fp
mtk_gpu_dvfs_set_mode
mtk_gpu_dvfs_set_mode_fp
mtk_get_gpu_fence_done
mtk_get_gpu_fence_done_fp
mtk_get_sw_vsync_time
mtk_get_sw_vsync_time_fp
mtk_get_sw_vsync_phase
mtk_get_sw_vsync_phase_fp
mtk_gpu_sodi_exit
mtk_gpu_sodi_exit_fp
mtk_gpu_sodi_entry
mtk_gpu_sodi_entry_fp
mtk_do_gpu_dvfs
mtk_do_gpu_dvfs_fp
mtk_get_custom_upbound_gpu_freq
mtk_get_custom_upbound_gpu_freq_fp
mtk_get_custom_boost_gpu_freq
mtk_get_custom_boost_gpu_freq_fp
mtk_custom_upbound_gpu_freq
mtk_custom_upbound_gpu_freq_fp
mtk_custom_boost_gpu_freq
mtk_custom_boost_gpu_freq_fp
mtk_custom_get_gpu_freq_level_count
mtk_custom_get_gpu_freq_level_count_fp
mtk_get_bottom_gpu_freq
mtk_get_bottom_gpu_freq_fp
mtk_set_bottom_gpu_freq
mtk_set_bottom_gpu_freq_fp
mtk_boost_gpu_freq
mtk_boost_gpu_freq_fp
mtk_enable_gpu_dvfs_timer
mtk_enable_gpu_dvfs_timer_fp
mtk_get_gpu_power_loading
mtk_get_gpu_power_loading_fp
mtk_get_gpu_PP_loading
mtk_get_gpu_PP_loading_fp
mtk_get_gpu_GP_loading
mtk_get_gpu_GP_loading_fp
mtk_get_gpu_freq
mtk_get_gpu_freq_fp
mtk_get_gpu_idle
mtk_get_gpu_idle_fp
mtk_get_gpu_block
mtk_get_gpu_block_fp
mtk_get_gpu_loading
mtk_get_gpu_loading_fp
mtk_get_gpu_page_cache
mtk_get_gpu_page_cache_fp
mtk_get_gpu_memory_usage
mtk_get_gpu_memory_usage_fp
mt_dfs_armpll
wmt_export_mtk_wcn_cmb_sdio_disable_eirq
wmt_export_mtk_wcn_sdio_irq_flag_set
mtk_wcn_cmb_sdio_pm_data
mtk_wcn_cmb_sdio_pm_cb
mtk_btif_rxd_be_blocked_flag_get
mtk_wcn_btif_parser_wmt_evt
mtk_wcn_btif_dbg_ctrl
mtk_wcn_btif_loopback_ctrl
mtk_wcn_btif_wakeup_consys
mtk_wcn_btif_rx_cb_register
mtk_wcn_btif_dpidle_ctrl
mtk_wcn_btif_write
mtk_wcn_btif_close
mtk_wcn_btif_open
mtk_thermal_get_proc_drv_therm_dir_entry
mtk_thermal_get_temp
mtk_thermal_zone_bind_trigger_trip
mtk_thermal_cooling_device_unregister_wrapper
mtk_thermal_cooling_device_add_exit_point
mtk_thermal_cooling_device_register_wrapper_extra
mtk_thermal_cooling_device_register_wrapper
mtk_thermal_zone_bind_cooling_device_wrapper
mtk_thermal_zone_device_unregister_wrapper
mtk_thermal_zone_device_register_wrapper
mtk_thermal_clear_user_scenarios
mtk_thermal_set_user_scenarios
mtk_thermal_force_get_batt_temp
mtk_thermal_get_gpu_info
mtk_thermal_get_cpu_info
mtk_thermal_get_gpu_loading_fp
mtk_gpufreq_register
mtk_mdm_set_md2_signal_period
mtk_mdm_set_md1_signal_period
mtk_mdm_set_signal_period
mtk_mdm_stop_query
mtk_mdm_start_query
mtk_mdm_set_mdinfoex_threshold
mtk_mdm_get_mdinfoex
mtk_mdm_get_md_info
mtk_mdm_get_rf_temp
mtk_mdm_get_tx_power
mtk_thermal_get_tpcb_target
rtc_alarm_irq_enable
rtc_initialize_alarm
rtc_set_alarm_poweron
rtc_set_alarm
rtc_read_alarm
mtk_wdt_cpu_callback
mtk_wdt_swsysret_config
mtk_msdc_host
neigh_parms_release
neigh_parms_alloc
androidboot.boot_trace
arm,armv7-timer-mem
arm,armv7-timer
arm,armv8-timer
mediatek,reserve-memory-ccci_share
mediatek,reserve-memory-ccci_md3_ccif
mediatek,reserve-memory-ccci_md2
mediatek,reserve-memory-ccci_md1
mediatek,consys-reserve-memory
mediatek,ram_console
mediatek,minirdump
mediatek,APXGPT
arm,armv7-timer-mem
arm,armv8-timer
arm,armv7-timer
arm,cortex-a7-gic
arm,cortex-a17-pmu
arm,cortex-a15-pmu
arm,cortex-a12-pmu
arm,cortex-a9-pmu
arm,cortex-a8-pmu
arm,cortex-a7-pmu
arm,cortex-a5-pmu
arm,arm11mpcore-pmu
arm,arm1176-pmu
arm,arm1136-pmu
armv6-pmu
armv7-pmu
mediatek,mt6580-pinctrl
/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/proinfo
mediatek,mt6735-accdet
mediatek,mt6755-accdet
mediatek,mt6757-accdet
mediatek,mt6570-accdet
mediatek,mt6580-accdet
mediatek,mt8173-accdet
mediatek,mt8163-accdet
mediatek,mt8127-accdet
mediatek,mt6797-accdet
mediatek,elbrus-accdet
        echo [ACTION]... > /d/mtkfb
        mtkfblog:[on|off]
             enable/disable [MTKFB] log
        mtkfb_vsynclog:[on|off]
mediatek,mt6580-flashlight
mtktscpu-sysrst
mtktspa-sysrst
mtktswmt-pa1
mtktswmt-pa2
mtktswmt-pa3
mtktswmt-sysrst
mediatek,mt6570-touch
mediatek,mt6735-touch
mediatek,mt6580-touch
mediatek,mt8173-touch
mediatek,mt6755-touch
mediatek,mt6757-touch
mediatek,mt6797-touch
mediatek,mt8163-touch
mediatek,mt8127-touch
mediatek,mt2701-touch
mediatek,mt7623-touch
mtk_governor
.ARM.exidx
.ARM.attributes

C:\Users\User\Downloads\MT6580S24\MT6580S24>
