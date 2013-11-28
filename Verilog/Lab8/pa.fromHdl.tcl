
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab8 -dir "F:/Lab8/planAhead_run_1" -part xc3s500efg320-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "test_mod.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {halfadder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {fulladder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rippleAdder4bit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {lookaheadAdder4bit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {counter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ClockConverter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {test_mod.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top test_mod $srcset
add_files [list {test_mod.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-5
