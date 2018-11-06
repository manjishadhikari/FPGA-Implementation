set_property PACKAGE_PIN E3 [get_ports clk]
set_property PACKAGE_PIN U9 [get_ports enable]
set_property PACKAGE_PIN T8 [get_ports ended]
set_property PACKAGE_PIN P4 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports enable]
set_property IOSTANDARD LVCMOS33 [get_ports ended]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports {count[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count[0]}]
set_property OFFCHIP_TERM NONE [get_ports count[0]]
set_property OFFCHIP_TERM NONE [get_ports count[10]]
set_property OFFCHIP_TERM NONE [get_ports count[11]]
set_property OFFCHIP_TERM NONE [get_ports count[12]]
set_property OFFCHIP_TERM NONE [get_ports count[13]]
set_property OFFCHIP_TERM NONE [get_ports count[14]]
set_property OFFCHIP_TERM NONE [get_ports count[15]]
set_property OFFCHIP_TERM NONE [get_ports count[16]]
set_property OFFCHIP_TERM NONE [get_ports count[17]]
set_property OFFCHIP_TERM NONE [get_ports count[18]]
set_property OFFCHIP_TERM NONE [get_ports count[19]]
set_property OFFCHIP_TERM NONE [get_ports count[1]]
set_property OFFCHIP_TERM NONE [get_ports count[20]]
set_property OFFCHIP_TERM NONE [get_ports count[21]]
set_property OFFCHIP_TERM NONE [get_ports count[22]]
set_property OFFCHIP_TERM NONE [get_ports count[23]]
set_property OFFCHIP_TERM NONE [get_ports count[2]]
set_property OFFCHIP_TERM NONE [get_ports count[3]]
set_property OFFCHIP_TERM NONE [get_ports count[4]]
set_property OFFCHIP_TERM NONE [get_ports count[5]]
set_property OFFCHIP_TERM NONE [get_ports count[6]]
set_property OFFCHIP_TERM NONE [get_ports count[7]]
set_property OFFCHIP_TERM NONE [get_ports count[8]]
set_property OFFCHIP_TERM NONE [get_ports count[9]]