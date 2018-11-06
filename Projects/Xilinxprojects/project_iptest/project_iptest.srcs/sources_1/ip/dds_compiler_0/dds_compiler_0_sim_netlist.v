// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Sun Feb 26 19:40:59 2017
// Host        : 2002-16 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               h:/Xilinxprojects/project_iptest/project_iptest.srcs/sources_1/ip/dds_compiler_0/dds_compiler_0_sim_netlist.v
// Design      : dds_compiler_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_compiler_0,dds_compiler_v6_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_12,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module dds_compiler_0
   (aclk,
    m_axis_data_tvalid,
    m_axis_data_tdata,
    m_axis_phase_tvalid,
    m_axis_phase_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [15:0]m_axis_data_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_PHASE TVALID" *) output m_axis_phase_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_PHASE TDATA" *) output [31:0]m_axis_phase_tdata;

  wire aclk;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [31:0]m_axis_phase_tdata;
  wire m_axis_phase_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [2:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [25:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [25:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [25:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

  (* C_ACCUMULATOR_WIDTH = "26" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "5" *) 
  (* C_CHAN_WIDTH = "3" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "1" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "1" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "32" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "2" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "8" *) 
  (* C_PHASE_ANGLE_WIDTH = "8" *) 
  (* C_PHASE_INCREMENT = "2" *) 
  (* C_PHASE_INCREMENT_VALUE = "10000011000100100,11000100100110111,100000110001001001,101000111101011100,1010001111010111000010,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dds_compiler_0_dds_compiler_v6_0_12 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[2:0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[25:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[25:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[25:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_U0_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(m_axis_phase_tdata),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(m_axis_phase_tvalid),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(1'b0),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(1'b0));
endmodule

(* C_ACCUMULATOR_WIDTH = "26" *) (* C_AMPLITUDE = "0" *) (* C_CHANNELS = "5" *) 
(* C_CHAN_WIDTH = "3" *) (* C_DEBUG_INTERFACE = "0" *) (* C_HAS_ACLKEN = "0" *) 
(* C_HAS_ARESETN = "0" *) (* C_HAS_M_DATA = "1" *) (* C_HAS_M_PHASE = "1" *) 
(* C_HAS_PHASEGEN = "1" *) (* C_HAS_PHASE_OUT = "1" *) (* C_HAS_SINCOS = "1" *) 
(* C_HAS_S_CONFIG = "0" *) (* C_HAS_S_PHASE = "0" *) (* C_HAS_TLAST = "0" *) 
(* C_HAS_TREADY = "0" *) (* C_LATENCY = "3" *) (* C_MEM_TYPE = "1" *) 
(* C_MODE_OF_OPERATION = "0" *) (* C_MODULUS = "9" *) (* C_M_DATA_HAS_TUSER = "0" *) 
(* C_M_DATA_TDATA_WIDTH = "16" *) (* C_M_DATA_TUSER_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TDATA_WIDTH = "32" *) (* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "0" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_OUTPUTS_REQUIRED = "2" *) (* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "8" *) 
(* C_PHASE_ANGLE_WIDTH = "8" *) (* C_PHASE_INCREMENT = "2" *) (* C_PHASE_INCREMENT_VALUE = "10000011000100100,11000100100110111,100000110001001001,101000111101011100,1010001111010111000010,0,0,0,0,0,0,0,0,0,0,0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_POR_MODE = "0" *) 
(* C_RESYNC = "0" *) (* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TDATA_WIDTH = "1" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) 
(* C_USE_DSP48 = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "dds_compiler_v6_0_12" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module dds_compiler_0_dds_compiler_v6_0_12
   (aclk,
    aclken,
    aresetn,
    s_axis_phase_tvalid,
    s_axis_phase_tready,
    s_axis_phase_tdata,
    s_axis_phase_tlast,
    s_axis_phase_tuser,
    s_axis_config_tvalid,
    s_axis_config_tready,
    s_axis_config_tdata,
    s_axis_config_tlast,
    m_axis_data_tvalid,
    m_axis_data_tready,
    m_axis_data_tdata,
    m_axis_data_tlast,
    m_axis_data_tuser,
    m_axis_phase_tvalid,
    m_axis_phase_tready,
    m_axis_phase_tdata,
    m_axis_phase_tlast,
    m_axis_phase_tuser,
    event_pinc_invalid,
    event_poff_invalid,
    event_phase_in_invalid,
    event_s_phase_tlast_missing,
    event_s_phase_tlast_unexpected,
    event_s_phase_chanid_incorrect,
    event_s_config_tlast_missing,
    event_s_config_tlast_unexpected,
    debug_axi_pinc_in,
    debug_axi_poff_in,
    debug_axi_resync_in,
    debug_axi_chan_in,
    debug_core_nd,
    debug_phase,
    debug_phase_nd);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_phase_tvalid;
  output s_axis_phase_tready;
  input [0:0]s_axis_phase_tdata;
  input s_axis_phase_tlast;
  input [0:0]s_axis_phase_tuser;
  input s_axis_config_tvalid;
  output s_axis_config_tready;
  input [0:0]s_axis_config_tdata;
  input s_axis_config_tlast;
  output m_axis_data_tvalid;
  input m_axis_data_tready;
  output [15:0]m_axis_data_tdata;
  output m_axis_data_tlast;
  output [0:0]m_axis_data_tuser;
  output m_axis_phase_tvalid;
  input m_axis_phase_tready;
  output [31:0]m_axis_phase_tdata;
  output m_axis_phase_tlast;
  output [0:0]m_axis_phase_tuser;
  output event_pinc_invalid;
  output event_poff_invalid;
  output event_phase_in_invalid;
  output event_s_phase_tlast_missing;
  output event_s_phase_tlast_unexpected;
  output event_s_phase_chanid_incorrect;
  output event_s_config_tlast_missing;
  output event_s_config_tlast_unexpected;
  output [25:0]debug_axi_pinc_in;
  output [25:0]debug_axi_poff_in;
  output debug_axi_resync_in;
  output [2:0]debug_axi_chan_in;
  output debug_core_nd;
  output [25:0]debug_phase;
  output debug_phase_nd;

  wire \<const0> ;
  wire aclk;
  wire aclken;
  wire aresetn;
  wire [2:0]debug_axi_chan_in;
  wire [25:0]debug_axi_pinc_in;
  wire [25:0]debug_axi_poff_in;
  wire debug_core_nd;
  wire [25:0]debug_phase;
  wire debug_phase_nd;
  wire event_phase_in_invalid;
  wire event_pinc_invalid;
  wire event_poff_invalid;
  wire event_s_config_tlast_missing;
  wire event_s_config_tlast_unexpected;
  wire event_s_phase_chanid_incorrect;
  wire event_s_phase_tlast_missing;
  wire event_s_phase_tlast_unexpected;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tlast;
  wire m_axis_data_tready;
  wire [0:0]m_axis_data_tuser;
  wire m_axis_data_tvalid;
  wire [31:0]m_axis_phase_tdata;
  wire m_axis_phase_tlast;
  wire m_axis_phase_tready;
  wire [0:0]m_axis_phase_tuser;
  wire m_axis_phase_tvalid;
  wire [0:0]s_axis_config_tdata;
  wire s_axis_config_tlast;
  wire s_axis_config_tready;
  wire s_axis_config_tvalid;
  wire [0:0]s_axis_phase_tdata;
  wire s_axis_phase_tlast;
  wire s_axis_phase_tready;
  wire [0:0]s_axis_phase_tuser;
  wire s_axis_phase_tvalid;
  wire NLW_i_synth_debug_axi_resync_in_UNCONNECTED;

  assign debug_axi_resync_in = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ACCUMULATOR_WIDTH = "26" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "5" *) 
  (* C_CHAN_WIDTH = "3" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "1" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "1" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "32" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "2" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "8" *) 
  (* C_PHASE_ANGLE_WIDTH = "8" *) 
  (* C_PHASE_INCREMENT = "2" *) 
  (* C_PHASE_INCREMENT_VALUE = "10000011000100100,11000100100110111,100000110001001001,101000111101011100,1010001111010111000010,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dds_compiler_0_dds_compiler_v6_0_12_viv i_synth
       (.aclk(aclk),
        .aclken(aclken),
        .aresetn(aresetn),
        .debug_axi_chan_in(debug_axi_chan_in),
        .debug_axi_pinc_in(debug_axi_pinc_in),
        .debug_axi_poff_in(debug_axi_poff_in),
        .debug_axi_resync_in(NLW_i_synth_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(debug_core_nd),
        .debug_phase(debug_phase),
        .debug_phase_nd(debug_phase_nd),
        .event_phase_in_invalid(event_phase_in_invalid),
        .event_pinc_invalid(event_pinc_invalid),
        .event_poff_invalid(event_poff_invalid),
        .event_s_config_tlast_missing(event_s_config_tlast_missing),
        .event_s_config_tlast_unexpected(event_s_config_tlast_unexpected),
        .event_s_phase_chanid_incorrect(event_s_phase_chanid_incorrect),
        .event_s_phase_tlast_missing(event_s_phase_tlast_missing),
        .event_s_phase_tlast_unexpected(event_s_phase_tlast_unexpected),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(m_axis_data_tlast),
        .m_axis_data_tready(m_axis_data_tready),
        .m_axis_data_tuser(m_axis_data_tuser),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(m_axis_phase_tdata),
        .m_axis_phase_tlast(m_axis_phase_tlast),
        .m_axis_phase_tready(m_axis_phase_tready),
        .m_axis_phase_tuser(m_axis_phase_tuser),
        .m_axis_phase_tvalid(m_axis_phase_tvalid),
        .s_axis_config_tdata(s_axis_config_tdata),
        .s_axis_config_tlast(s_axis_config_tlast),
        .s_axis_config_tready(s_axis_config_tready),
        .s_axis_config_tvalid(s_axis_config_tvalid),
        .s_axis_phase_tdata(s_axis_phase_tdata),
        .s_axis_phase_tlast(s_axis_phase_tlast),
        .s_axis_phase_tready(s_axis_phase_tready),
        .s_axis_phase_tuser(s_axis_phase_tuser),
        .s_axis_phase_tvalid(s_axis_phase_tvalid));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
BeDk6slWwyJ7dkKWyaZdmI5S1xnQWnB2oiiYkvyYe3ILPohOGwb55RsmeeSbX1QjJu01hxqQuKng
/gQKr+nekw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ASzYKVAZmSO0SmC0FWgRspy8UM6oxvcf3jSUzSQ5aTbQcdQEmkCnyOPWPw5rhfBxgGmpUIes9+yb
Y1HX9gskfNW1iUc9hvj0/7i23Dl3Awuv9PwzU2qkFTur1xa+VTaDhjRdBkmelm1XEmzy0fVWfN3E
JrqrAgqGTQHZ2JkK6Bo=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oJBoHreUf2ZGu1uujJJM+r+7FZbqExapJJyyvy1o9iddxQis4QmRw6/bE0DAY0iOm9OEPedgUYiN
HJiQO008872laIEmtmT/BZsMbhdVL80RK/NlqxNSooHOOtA7Q2ooOW5Qroi6pqh15Of2uGz4EX8r
QzKai9gyZ1nNfMdTAvc=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gXcd8sTNtxVLLLKC4rAjsRNsfX1NVlxv5NlbcoCN3RLErB2fm8TB5dri0TbIQGAb+HGHGVOVAHgx
uVooaR3J4n0jcKalCdHupCpw5tdmXAARWsN3+yNMWjktBvDZlREeBk2BplNU4DXuIjpyRlcW28oq
fXURF5uCQelaIUMgDwAyoK4ndypdafocPYsPsbB7ZcLdDX4H5Le9tBCnXO/3QcalHHXgUWKcLkyn
o62h+Ts9twP03kQwoK/zsw/Mj8ubV//CFoyYXoAsGg33zvV6pCpWjHcIR6qmaj3YFStAb9Gwjq47
yV9Y3uGyv5WU5KKhj3xqBA2tQXCqQY863nIZnQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZCOLBlM+DOBMBQ8zvcBqrtqtygwYjI0iydlVEAyokc0UPDasfRQj4taurJsghnxG4bETs5xI8oYV
0HnNJr9QlLNdd6mcJgJqN/c90+zI7I0/hnO/qlv0Pup/OiWbYiiAzYaGPmKRDqi7WYyqSO7I4TS2
AG2Q/zR6LKL+UR1LQcmMcJ4RgLFqPmMasX9iUCz5I9lsv9KntADfsOLwcJl5QoT1i4VZKbohe5Qm
MESQHJetAMfbworTVW5vJr8gNUaDSSpP+4845B0JGNCebeUUC8/1KVkOL2aPgIiLRFtWjAGp0OdP
Hgc1IPHx2d0B9ihxkm+YRP31ignQS302EQYvBw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NrFXeDUSk0IEdKSAJNgkeyX3IOnuNIcPQAo5W4y9LavsF2f6Nt+rduqEQbagw39p3ash8XtbR/w2
nbOm3koCj/8C0OoRET7PqvN4QJy3y4VTXAZe0/S0IrLxQsNhhv6J/qZfD8QvZ356rQBjqyRt3tes
FKIyW/uL9wD45Iy27+yn385eZ31TEAWa3qUWjlZ4QirRNAT1OkORBDIQDHOOlrRwhcFvBqpmP+bt
dB3NdDgt5niwoonBSPDFf2StNdLHNsQCxz9zmE4Hap77op41g4Avc9CdLgPyKBKRlvYKlsU5dB+X
7VzJf8Jl3UhqXRVBX0i7dzEKJTZE1Bhvb5jelg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
PvO8cdBEDIMEg0ou7AmnQLfSr4lD3wCtVsMx3fHvy7vFqoorOqmhgsIlVMLre8tQ53YjL0lNm0jB
3isYlcm99p5AhJutX3OJxRTXkEqEsEtchHs/cT3zfyLTNFa6nKZXKI09KjJedtYoejzpdniS44Ah
sgnon5OUjDDa1ywb/pDH3HLXIsTSXsLXaUpux6DYYcNtRnjy2XxGul77C9ropu3CJvNWuCB3QSQT
0w5PnmzDzY3m9G0cozSEqrslLjA/CLbwpbjTTU+To0cBAiGV+91xUD0D6YM09JcnKz2X1f3tz0Eu
cVi17R9fNTUHcXnmnJRbhr4uyK1i9AFw6R+rKA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
a0CvBHFxOCtJqSJbkCW9TawedJ1RnsDRAOoKRuSSLMGOcWgt+cWsr7Tq8sgWBv6AyBhJ5Ea1g75p
Fbh+B3uq+8xgHSJuYemsOF3iDVsmKFbdfQ3Nod4+GTr9pmp2F3vBq7YYIN0YXuUAGwNidXZfRmJB
gEihcUxfTSZoCKz+VGEQbhAkI0TRKHZMCiIoHDpkxKNy/LRmSG3Dp0mp+4RF2nm9HIJurEK6tcq+
HjsQlAPj8ghuoQWzBLAJXvMsjQRNeYnDd9/whS3iQuE6z+9NtoHzlDqH5NekUEmnYGHbnEnH7uvi
bagjnQizDLT5UaiK/hAzwZtLl2KAzWI0aYM9qQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 69872)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
