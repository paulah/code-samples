`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:17:35 11/16/2013
// Design Name:   Clock1Hz
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab10/Clock_tb.v
// Project Name:  Lab10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Clock1Hz
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Clock_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire newclk;

	// Instantiate the Unit Under Test (UUT)
	Clock1Hz uut (
		.clk50(clk), 
		.reset(reset), 
		.clk(newclk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#30;
		reset = 0;
		
		#10 $display("newclock=%b", newclk);
		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here

	end
   
	always begin
		#10 clk = ~clk;
	end
endmodule

