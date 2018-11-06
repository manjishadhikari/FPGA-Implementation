// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed May 03 13:33:52 2017
// Host        : 2002-13 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0_stub.v
// Design      : microblaze_mcs_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_fc5c_0,Vivado 2016.2" *)
module microblaze_mcs_0(Clk, Reset, IO_addr_strobe, IO_address, IO_byte_enable, IO_read_data, IO_read_strobe, IO_ready, IO_write_data, IO_write_strobe, UART_rxd, UART_txd)
/* synthesis syn_black_box black_box_pad_pin="Clk,Reset,IO_addr_strobe,IO_address[31:0],IO_byte_enable[3:0],IO_read_data[31:0],IO_read_strobe,IO_ready,IO_write_data[31:0],IO_write_strobe,UART_rxd,UART_txd" */;
  input Clk;
  input Reset;
  output IO_addr_strobe;
  output [31:0]IO_address;
  output [3:0]IO_byte_enable;
  input [31:0]IO_read_data;
  output IO_read_strobe;
  input IO_ready;
  output [31:0]IO_write_data;
  output IO_write_strobe;
  input UART_rxd;
  output UART_txd;
endmodule
