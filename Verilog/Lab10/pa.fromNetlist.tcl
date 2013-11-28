
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Lab10 -dir "F:/Lab10/planAhead_run_2" -part xc3s500efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "F:/Lab10/product_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {F:/Lab10} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "VendingMachine_top2.ucf" [current_fileset -constrset]
add_files [list {VendingMachine_top2.ucf}] -fileset [get_property constrset [current_run]]
link_design
