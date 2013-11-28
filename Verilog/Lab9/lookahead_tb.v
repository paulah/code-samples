`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:04:43 11/03/2013
// Design Name:   lookahead_adder
// Module Name:   F:/lab7prelab/lookahead_tb.v
// Project Name:  lab7prelab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lookahead_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lookahead_tb;

	// Inputs
	reg c0;
	reg a0;
	reg a1;
	reg a2;
	reg a3;
	reg b0;
	reg b1;
	reg b2;
	reg b3;

	// Outputs
	wire s0;
	wire s1;
	wire s2;
	wire s3;

	// Instantiate the Unit Under Test (UUT)
	lookahead_adder uut (
		.c0(c0), 
		.a0(a0), 
		.a1(a1), 
		.a2(a2), 
		.a3(a3), 
		.b0(b0), 
		.b1(b1), 
		.b2(b2), 
		.b3(b3), 
		.s0(s0), 
		.s1(s1), 
		.s2(s2), 
		.s3(s3)
	);

	initial begin
		// Initialize Inputs
		c0 = 0;
		a0 = 0;
		a1 = 0;
		a2 = 0;
		a3 = 0;
		b0 = 0;
		b1 = 0;
		b2 = 0;
		b3 = 0;
		#50;
      c0 = 0;
		a0 = 1;
		a1 = 1;
		a2 = 1;
		a3 = 1;
		b0 = 1;
		b1 = 1;
		b2 = 1;
		b3 = 1;
		#50;
      c0 = 0;
		a0 = 0;
		a1 = 0;
		a2 = 0;
		a3 = 1;
		b0 = 0;
		b1 = 0;
		b2 = 0;
		b3 = 1;
		#50;
      c0 = 0;
		a0 = 1;
		a1 = 1;
		a2 = 0;
		a3 = 1;
		b0 = 0;
		b1 = 0;
		b2 = 1;
		b3 = 0;
		#50;
      c0 = 1;
		a0 = 1;
		a1 = 0;
		a2 = 0;
		a3 = 1;
		b0 = 0;
		b1 = 1;
		b2 = 0;
		b3 = 1;
		#50;
      c0 = 1;
		a0 = 1;
		a1 = 1;
		a2 = 1;
		a3 = 1;
		b0 = 0;
		b1 = 0;
		b2 = 0;
		b3 = 0;
		#50;
      c0 = 1;
		a0 = 0;
		a1 = 0;
		a2 = 0;
		a3 = 0;
		b0 = 1;
		b1 = 1;
		b2 = 1;
		b3 = 0;
		#50;
      c0 = 0;
		a0 = 0;
		a1 = 0;
		a2 = 0;
		a3 = 0;
		b0 = 0;
		b1 = 0;
		b2 = 0;
		b3 = 0;
		#50;
        

	end
      
endmodule

