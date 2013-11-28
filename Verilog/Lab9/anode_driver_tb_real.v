`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:37:18 10/27/2013
// Design Name:   Anode_Driver
// Module Name:   C:/Users/epalasik/Xilinx/SysGen/14.5/lab7/anode_driver_tb_real.v
// Project Name:  lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Anode_Driver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module anode_driver_tb_real;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [3:0] anode_selection_signal;
	wire [1:0] mux_selection_signal;

	// Instantiate the Unit Under Test (UUT)
	Anode_Driver uut (
		.clock(clock), 
		.reset(reset), 
		.anode_selection_signal(anode_selection_signal), 
		.mux_selection_signal(mux_selection_signal)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		#100;
		reset = 1;
		
		clock = 1;
		#100;
		clock = 0;
		#100;
		clock = 1;
		#100;
		clock = 0;
		#100;
		clock = 1;
		#100;
		clock = 0;
		#100;
		clock = 1;
		#100;
		clock = 0;
		#100;
		clock = 1;
		#100;
		clock = 0;
		#100;
		clock = 1;
		#100;


        
		// Add stimulus here

	end
      
endmodule

