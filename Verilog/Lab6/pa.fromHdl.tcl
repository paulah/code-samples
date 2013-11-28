
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab6 -dir "C:/Users/ntwombly/Desktop/Lab6/planAhead_run_3" -part xc3s500efg320-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "mux21_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {mux21n.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {mux21_4bit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {theCounter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {mux41_4bit1.vf}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {mux41_4bit_counter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top mux41_4bit_counter $srcset
add_files [list {mux21_top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-5
