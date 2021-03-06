# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {V:/EECS 700-FPGA/project_1/project_1.cache/wt} [current_project]
set_property parent.project_path {V:/EECS 700-FPGA/project_1/project_1.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_ip {{V:/EECS 700-FPGA/project_1/project_1.srcs/sources_1/ip/dsp48e1_prim/dsp48e1_prim.xci}}
set_property is_locked true [get_files {{V:/EECS 700-FPGA/project_1/project_1.srcs/sources_1/ip/dsp48e1_prim/dsp48e1_prim.xci}}]

read_vhdl -library xil_defaultlib {
  {V:/EECS 700-FPGA/project_1/project_1.srcs/sources_1/new/addrcounter.vhd}
  {V:/EECS 700-FPGA/project_1/project_1.srcs/sources_1/new/counter4.vhd}
  {V:/EECS 700-FPGA/project_1/project_1.srcs/sources_1/new/addrcounterreal.vhd}
  {V:/EECS 700-FPGA/project_1/project_1.srcs/sources_1/new/knightrider.vhd}
}
read_xdc {{V:/EECS 700-FPGA/project_1/project_1.srcs/constrs_1/new/constr.xdc}}
set_property used_in_implementation false [get_files {{V:/EECS 700-FPGA/project_1/project_1.srcs/constrs_1/new/constr.xdc}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top knightrider -part xc7a100tcsg324-1
write_checkpoint -noxdef knightrider.dcp
catch { report_utilization -file knightrider_utilization_synth.rpt -pb knightrider_utilization_synth.pb }
