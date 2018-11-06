// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Tue May 02 13:02:34 2017
// Host        : AQ-327NI08 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub {v:/EECS 700-FPGA/New
//               folder/project_1/project_1.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0_stub.v}
// Design      : microblaze_mcs_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "microblaze_mcs,Vivado 2015.2" *)
module microblaze_mcs_0(Clk, Reset, UART_Rx, UART_Tx)
/* synthesis syn_black_box black_box_pad_pin="Clk,Reset,UART_Rx,UART_Tx" */;
  input Clk;
  input Reset;
  input UART_Rx;
  output UART_Tx;
endmodule
