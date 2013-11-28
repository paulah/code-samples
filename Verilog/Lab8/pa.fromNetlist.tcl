
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Lab8 -dir "F:/Lab8/planAhead_run_4" -part xc3s500efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "F:/Lab8/test_mod.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {F:/Lab8} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "lookaheadLED.ucf" [current_fileset -constrset]
add_files [list {lookaheadLED.ucf}] -fileset [get_property constrset [current_run]]
link_design
