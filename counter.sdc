###############################################################################
# Created by write_sdc
###############################################################################
current_design counter
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period $::env(CLOCK_PERIOD) [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2000 clk
set IO_DELAY [expr $::env(CLOCK_PERIOD)/4]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {delta*}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {up_dn}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {pl_data[0]}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {pl_data[1]}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {pl_data[2]}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {pl_data[3]}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {pl_data[4]}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {pl_data[5]}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {pl_data[6]}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {pl_data[7]}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {preload}]
set_input_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_output_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {qout[0]}]
set_output_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {qout[1]}]
set_output_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {qout[2]}]
set_output_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {qout[3]}]
set_output_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {qout[4]}]
set_output_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {qout[5]}]
set_output_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {qout[6]}]
set_output_delay $IO_DELAY -clock [get_clocks {clk}] -add_delay [get_ports {qout[7]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {qout[7]}]
set_load -pin_load 0.0334 [get_ports {qout[6]}]
set_load -pin_load 0.0334 [get_ports {qout[5]}]
set_load -pin_load 0.0334 [get_ports {qout[4]}]
set_load -pin_load 0.0334 [get_ports {qout[3]}]
set_load -pin_load 0.0334 [get_ports {qout[2]}]
set_load -pin_load 0.0334 [get_ports {qout[1]}]
set_load -pin_load 0.0334 [get_ports {qout[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {preload}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {up_dn}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {delta*}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {pl_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {pl_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {pl_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {pl_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {pl_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {pl_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {pl_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {pl_data[0]}]
###############################################################################
# Design Rules
###############################################################################
set_max_transition $::env(MAX_TRANSITION_CONSTRAINT) [current_design]
set_max_capacitance 0.2000 [current_design]
set_max_fanout $::env(MAX_FANOUT_CONSTRAINT) [current_design]
set_false_path -from [get_ports {reset}] -to [get_clocks {clk}]
