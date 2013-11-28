`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:08:16 10/27/2013
// Design Name:   ClockConverter
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab7/ClockConverter_tb.v
// Project Name:  Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ClockConverter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ClockConverter_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire newclock;

	// Instantiate the Unit Under Test (UUT)
	ClockConverter uut (
		.clk(clk), 
		.reset(reset), 
		.newclock(newclock)
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

