`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:23:05 11/18/2013
// Design Name:   HexToBCD
// Module Name:   F:/Lab10/bcd_tb.v
// Project Name:  Lab10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HexToBCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bcd_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] hex;

	// Outputs
	wire [11:0] bcd;

	// Instantiate the Unit Under Test (UUT)
	HexToBCD uut (
		.clk(clk), 
		.rst(rst), 
		.hex(hex), 
		.bcd(bcd)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		hex = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 1;
		
		#500;
		rst = 0;
		hex = 16;
		
		#100;
		hex = 10;
		
		#100;
		hex = 5;
		
		
        
		// Add stimulus here

	end
   always begin
		#5 clk = ~clk;
	end  
endmodule

