
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab11 -dir "F:/Lab11/planAhead_run_3" -part xc3s500efg320-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "product_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {shiftAdd.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Multiplexer.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {hex_to_7_seg_1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {counter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Anode_Driver.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {product_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top product_top $srcset
add_files [list {product_top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-5
