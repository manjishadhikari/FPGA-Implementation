// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:microblaze_mcs:3.0
// IP Revision: 1

(* X_CORE_INFO = "bd_fc5c_0,Vivado 2016.2" *)
(* CHECK_LICENSE_TYPE = "microblaze_mcs_0,bd_fc5c_0,{}" *)
(* CORE_GENERATION_INFO = "microblaze_mcs_0,bd_fc5c_0,{x_ipProduct=Vivado 2016.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=microblaze_mcs,x_ipVersion=3.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module microblaze_mcs_0 (
  Clk,
  Reset,
  IO_addr_strobe,
  IO_address,
  IO_byte_enable,
  IO_read_data,
  IO_read_strobe,
  IO_ready,
  IO_write_data,
  IO_write_strobe,
  UART_rxd,
  UART_txd
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.Clk CLK" *)
input wire Clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.Reset RST" *)
input wire Reset;
(* X_INTERFACE_INFO = "xilinx.com:interface:mcsio_bus:1.0 IO ADDR_STROBE" *)
output wire IO_addr_strobe;
(* X_INTERFACE_INFO = "xilinx.com:interface:mcsio_bus:1.0 IO ADDRESS" *)
output wire [31 : 0] IO_address;
(* X_INTERFACE_INFO = "xilinx.com:interface:mcsio_bus:1.0 IO BYTE_ENABLE" *)
output wire [3 : 0] IO_byte_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:mcsio_bus:1.0 IO READ_DATA" *)
input wire [31 : 0] IO_read_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:mcsio_bus:1.0 IO READ_STROBE" *)
output wire IO_read_strobe;
(* X_INTERFACE_INFO = "xilinx.com:interface:mcsio_bus:1.0 IO READY" *)
input wire IO_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:mcsio_bus:1.0 IO WRITE_DATA" *)
output wire [31 : 0] IO_write_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:mcsio_bus:1.0 IO WRITE_STROBE" *)
output wire IO_write_strobe;
(* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 UART RxD" *)
input wire UART_rxd;
(* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 UART TxD" *)
output wire UART_txd;

  bd_fc5c_0 inst (
    .Clk(Clk),
    .Reset(Reset),
    .IO_addr_strobe(IO_addr_strobe),
    .IO_address(IO_address),
    .IO_byte_enable(IO_byte_enable),
    .IO_read_data(IO_read_data),
    .IO_read_strobe(IO_read_strobe),
    .IO_ready(IO_ready),
    .IO_write_data(IO_write_data),
    .IO_write_strobe(IO_write_strobe),
    .UART_rxd(UART_rxd),
    .UART_txd(UART_txd)
  );
endmodule