`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:42:36 11/03/2013
// Design Name:   ripple_carry_REAL
// Module Name:   F:/lab7prelab/real_ripple_tb.v
// Project Name:  lab7prelab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple_carry_REAL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module real_ripple_tb;

	// Inputs
	reg a1;
	reg a2;
	reg a3;
	reg a4;
	reg b1;
	reg b2;
	reg b3;
	reg b4;

	// Outputs
	wire s1;
	wire s2;
	wire s3;
	wire s4;

	// Instantiate the Unit Under Test (UUT)
	ripple_carry_REAL uut (
		.a1(a1), 
		.a2(a2), 
		.a3(a3), 
		.a4(a4), 
		.b1(b1), 
		.b2(b2), 
		.b3(b3), 
		.b4(b4), 
		.s1(s1),
		.s2(s2),
		.s3(s3),
		.s4(s4)
	);

	initial begin
		// Initialize Inputs
		a1 = 0;
		a2 = 0;
		a3 = 0;
		a4 = 0;
		b1 = 0;
		b2 = 0;
		b3 = 0;
		b4 = 0;
		#100;
      a1 = 1;
		a2 = 1;
		a3 = 1;
		a4 = 1;
		b1 = 1;
		b2 = 1;
		b3 = 1;
		b4 = 1;
		#100;
        
		// Add stimulus here

	end
      
endmodule

