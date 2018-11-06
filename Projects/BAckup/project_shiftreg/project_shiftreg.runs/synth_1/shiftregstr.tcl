# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {V:/EECS 700-FPGA/New folder/project_shiftreg/project_shiftreg.cache/wt} [current_project]
set_property parent.project_path {V:/EECS 700-FPGA/New folder/project_shiftreg/project_shiftreg.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib {{V:/EECS 700-FPGA/New folder/project_shiftreg/project_shiftreg.srcs/sources_1/imports/new/shiftreg.vhd}}
synth_design -top shiftregstr -part xc7a100tcsg324-1
write_checkpoint -noxdef shiftregstr.dcp
catch { report_utilization -file shiftregstr_utilization_synth.rpt -pb shiftregstr_utilization_synth.pb }
