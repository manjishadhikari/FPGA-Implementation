vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/microblaze_v9_6_1
vlib msim/lib_cdc_v1_0_2
vlib msim/proc_sys_reset_v5_0_9
vlib msim/lmb_v10_v3_0_8
vlib msim/lmb_bram_if_cntlr_v4_0_9
vlib msim/blk_mem_gen_v8_3_3
vlib msim/iomodule_v3_0_5

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap microblaze_v9_6_1 msim/microblaze_v9_6_1
vmap lib_cdc_v1_0_2 msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_9 msim/proc_sys_reset_v5_0_9
vmap lmb_v10_v3_0_8 msim/lmb_v10_v3_0_8
vmap lmb_bram_if_cntlr_v4_0_9 msim/lmb_bram_if_cntlr_v4_0_9
vmap blk_mem_gen_v8_3_3 msim/blk_mem_gen_v8_3_3
vmap iomodule_v3_0_5 msim/iomodule_v3_0_5

vlog -work xil_defaultlib -64 -sv \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -64 \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v9_6_1 -64 \
"../../../ipstatic/microblaze_v9_6_1/hdl/microblaze_v9_6_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 \
"../../../../project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_0/sim/bd_fc5c_0_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -64 \
"../../../ipstatic/lib_cdc_v1_0_2/hdl/src/vhdl/cdc_sync.vhd" \

vcom -work proc_sys_reset_v5_0_9 -64 \
"../../../ipstatic/proc_sys_reset_v5_0_9/hdl/src/vhdl/upcnt_n.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0_9/hdl/src/vhdl/sequence_psr.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0_9/hdl/src/vhdl/lpf.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0_9/hdl/src/vhdl/proc_sys_reset.vhd" \

vcom -work xil_defaultlib -64 \
"../../../../project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_1/sim/bd_fc5c_0_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_8 -64 \
"../../../ipstatic/lmb_v10_v3_0_8/hdl/vhdl/lmb_v10.vhd" \

vcom -work xil_defaultlib -64 \
"../../../../project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_2/sim/bd_fc5c_0_ilmb_0.vhd" \
"../../../../project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_3/sim/bd_fc5c_0_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_9 -64 \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/lmb_bram_if_funcs.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/lmb_bram_if_primitives.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/xor18.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/parity.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/parityenable.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/checkbit_handler.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/correct_one_bit.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/pselect_mask.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/axi_interface.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/lmb_mux.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0_9/hdl/vhdl/lmb_bram_if_cntlr.vhd" \

vcom -work xil_defaultlib -64 \
"../../../../project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_4/sim/bd_fc5c_0_dlmb_cntlr_0.vhd" \
"../../../../project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_5/sim/bd_fc5c_0_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_3_3 -64 \
"../../../ipstatic/blk_mem_gen_v8_3_3/simulation/blk_mem_gen_v8_3.v" \

vlog -work xil_defaultlib -64 \
"../../../../project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_6/sim/bd_fc5c_0_lmb_bram_I_0.v" \

vcom -work iomodule_v3_0_5 -64 \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/xilinx_primitives.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/divide_part.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/fit_module.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/gpi_module.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/gpo_module.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/intr_ctrl.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/pit_module.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/uart_control_status.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/uart_receive.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/uart_transmit.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/iomodule_core.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/pselect_mask.vhd" \
"../../../ipstatic/iomodule_v3_0_5/hdl/vhdl/iomodule.vhd" \

vcom -work xil_defaultlib -64 \
"../../../../project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_7/sim/bd_fc5c_0_iomodule_0_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../../project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/hdl/bd_fc5c_0.v" \
"../../../../project_dft.srcs/sources_1/ip/microblaze_mcs_0/sim/microblaze_mcs_0.v" \

vlog -work xil_defaultlib "glbl.v"

