
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab5 -dir "F:/Lab5/planAhead_run_1" -part xc3s500efg320-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "test_module.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {halfadder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {fulladder.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {counter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {test_module.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top test_module $srcset
add_files [list {test_module.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-5
