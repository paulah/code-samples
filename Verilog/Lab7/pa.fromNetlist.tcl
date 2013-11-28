
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Lab7 -dir "C:/Users/Paula/Google Drive/Xilinx/Lab7 post/planAhead_run_4" -part xc3s500efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Paula/Google Drive/Xilinx/Lab7 post/AnodeDriverClock.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Paula/Google Drive/Xilinx/Lab7 post} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "AnodeDriverClock.ucf" [current_fileset -constrset]
add_files [list {AnodeDriverClock.ucf}] -fileset [get_property constrset [current_run]]
link_design
