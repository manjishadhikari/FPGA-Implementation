proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config  -ruleid {1}  -id {[BD 41-1306]}  -suppress 
set_msg_config  -ruleid {2}  -id {[BD 41-1271]}  -suppress 

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir H:/project_dft/project_dft.cache/wt [current_project]
  set_property parent.project_path H:/project_dft/project_dft.xpr [current_project]
  set_property ip_repo_paths h:/project_dft/project_dft.cache/ip [current_project]
  set_property ip_output_repo h:/project_dft/project_dft.cache/ip [current_project]
  set_property XPM_LIBRARIES XPM_MEMORY [current_project]
  add_files -quiet H:/project_dft/project_dft.runs/synth_1/mcs_top.dcp
  add_files -quiet h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_0/bd_fc5c_0_microblaze_I_0.dcp
  set_property netlist_only true [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_0/bd_fc5c_0_microblaze_I_0.dcp]
  add_files -quiet h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_1/bd_fc5c_0_rst_0_0.dcp
  set_property netlist_only true [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_1/bd_fc5c_0_rst_0_0.dcp]
  add_files -quiet h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_2/bd_fc5c_0_ilmb_0.dcp
  set_property netlist_only true [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_2/bd_fc5c_0_ilmb_0.dcp]
  add_files -quiet h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_3/bd_fc5c_0_dlmb_0.dcp
  set_property netlist_only true [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_3/bd_fc5c_0_dlmb_0.dcp]
  add_files -quiet h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_4/bd_fc5c_0_dlmb_cntlr_0.dcp
  set_property netlist_only true [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_4/bd_fc5c_0_dlmb_cntlr_0.dcp]
  add_files -quiet h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_5/bd_fc5c_0_ilmb_cntlr_0.dcp
  set_property netlist_only true [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_5/bd_fc5c_0_ilmb_cntlr_0.dcp]
  add_files -quiet h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_6/bd_fc5c_0_lmb_bram_I_0.dcp
  set_property netlist_only true [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_6/bd_fc5c_0_lmb_bram_I_0.dcp]
  add_files -quiet h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_7/bd_fc5c_0_iomodule_0_0.dcp
  set_property netlist_only true [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_7/bd_fc5c_0_iomodule_0_0.dcp]
  add_files -quiet h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0.dcp
  set_property netlist_only true [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0.dcp]
  add_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/bd_fc5c_0.bmm
  set_property SCOPED_TO_REF bd_fc5c_0 [get_files -all h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/bd_fc5c_0.bmm]
  add_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_0/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF microblaze_mcs_0 [get_files -all h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_0/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS inst/microblaze_I [get_files -all h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_0/data/mb_bootloop_le.elf]
  read_xdc -mode out_of_context -ref microblaze_mcs_0 -cells inst h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0_ooc.xdc
  set_property processing_order EARLY [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0_ooc.xdc]
  read_xdc -ref bd_fc5c_0_microblaze_I_0 -cells U0 h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_0/bd_fc5c_0_microblaze_I_0.xdc
  set_property processing_order EARLY [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_0/bd_fc5c_0_microblaze_I_0.xdc]
  read_xdc -prop_thru_buffers -ref bd_fc5c_0_rst_0_0 -cells U0 h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_1/bd_fc5c_0_rst_0_0_board.xdc
  set_property processing_order EARLY [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_1/bd_fc5c_0_rst_0_0_board.xdc]
  read_xdc -ref bd_fc5c_0_rst_0_0 -cells U0 h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_1/bd_fc5c_0_rst_0_0.xdc
  set_property processing_order EARLY [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_1/bd_fc5c_0_rst_0_0.xdc]
  read_xdc -ref bd_fc5c_0_ilmb_0 -cells U0 h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_2/bd_fc5c_0_ilmb_0.xdc
  set_property processing_order EARLY [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_2/bd_fc5c_0_ilmb_0.xdc]
  read_xdc -ref bd_fc5c_0_dlmb_0 -cells U0 h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_3/bd_fc5c_0_dlmb_0.xdc
  set_property processing_order EARLY [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_3/bd_fc5c_0_dlmb_0.xdc]
  read_xdc -prop_thru_buffers -ref bd_fc5c_0_iomodule_0_0 -cells U0 h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_7/bd_fc5c_0_iomodule_0_0_board.xdc
  set_property processing_order EARLY [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/bd_0/ip/ip_7/bd_fc5c_0_iomodule_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref microblaze_mcs_0 -cells inst h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0_board.xdc
  set_property processing_order EARLY [get_files h:/project_dft/project_dft.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0_board.xdc]
  read_xdc H:/project_dft/project_dft.srcs/constrs_1/new/constt.xdc
  link_design -top mcs_top -part xc7a100tcsg324-1
  write_hwdef -file mcs_top.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force mcs_top_opt.dcp
  report_drc -file mcs_top_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force mcs_top_placed.dcp
  report_io -file mcs_top_io_placed.rpt
  report_utilization -file mcs_top_utilization_placed.rpt -pb mcs_top_utilization_placed.pb
  report_control_sets -verbose -file mcs_top_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force mcs_top_routed.dcp
  report_drc -file mcs_top_drc_routed.rpt -pb mcs_top_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file mcs_top_timing_summary_routed.rpt -rpx mcs_top_timing_summary_routed.rpx
  report_power -file mcs_top_power_routed.rpt -pb mcs_top_power_summary_routed.pb -rpx mcs_top_power_routed.rpx
  report_route_status -file mcs_top_route_status.rpt -pb mcs_top_route_status.pb
  report_clock_utilization -file mcs_top_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force mcs_top.mmi }
  catch { write_bmm -force mcs_top_bd.bmm }
  write_bitstream -force mcs_top.bit 
  catch { write_sysdef -hwdef mcs_top.hwdef -bitfile mcs_top.bit -meminfo mcs_top.mmi -file mcs_top.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

