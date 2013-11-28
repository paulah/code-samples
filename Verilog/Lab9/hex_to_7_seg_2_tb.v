`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:25:34 10/27/2013
// Design Name:   hex_to_7_seg_2
// Module Name:   C:/Users/epalasik/Xilinx/SysGen/14.5/lab7/hex_to_7_seg_2_tb.v
// Project Name:  lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hex_to_7_seg_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hex_to_7_seg_2_tb;

	// Inputs
	reg [3:0] x;

	// Outputs
	wire [6:0] abcdefg;

	// Instantiate the Unit Under Test (UUT)
	hex_to_7_seg_2 uut (
		.x(x), 
		.abcdefg(abcdefg)
	);

	initial begin
		x = 4'b0000;
		#50;
		x = 4'b0001;
		#50;
		x = 4'b0010;
		#50;
		x = 4'b0011;
		#50;
		x = 4'b0100;
		#50;
		x = 4'b0101;
		#50;
		x = 4'b0110;
		#50;
		x = 4'b0111;
		#50;
		x = 4'b1000;
		#50;
		x = 4'b1001;
		#50;
		x = 4'b1010;
		#50;
		x = 4'b1011;
		#50;
		x = 4'b1100;
		#50;
		x = 4'b1101;
		#50;
		x = 4'b1110;
		#50;
		x = 4'b1111;
		#50;

	end
      
endmodule

