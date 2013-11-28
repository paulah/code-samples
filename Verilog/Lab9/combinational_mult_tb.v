`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:34 11/10/2013
// Design Name:   combinational_mult
// Module Name:   F:/postlab8/prelab8/combinational_mult_tb.v
// Project Name:  prelab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: combinational_mult
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module combinational_mult_tb;

	// Inputs
	reg A3;
	reg A2;
	reg A1;
	reg A0;
	reg B3;
	reg B2;
	reg B1;
	reg B0;

	// Outputs
	wire S0;
	wire S1;
	wire S2;
	wire S3;
	wire S4;
	wire S5;
	wire S6;
	wire S7;

	// Instantiate the Unit Under Test (UUT)
	combinational_mult uut (
		.A3(A3), 
		.A2(A2), 
		.A1(A1), 
		.A0(A0), 
		.B3(B3), 
		.B2(B2), 
		.B1(B1), 
		.B0(B0), 
		.S0(S0), 
		.S1(S1), 
		.S2(S2), 
		.S3(S3), 
		.S4(S4), 
		.S5(S5), 
		.S6(S6), 
		.S7(S7)
	);

	initial begin
		// Initialize Inputs
		A3 = 0;
		A2 = 0;
		A1 = 0;
		A0 = 0;
		B3 = 0;
		B2 = 0;
		B1 = 0;
		B0 = 0;
		#50;
      A3 = 0;
		A2 = 0;
		A1 = 1;
		A0 = 0;
		B3 = 0;
		B2 = 0;
		B1 = 0;
		B0 = 1;
		#50;
      A3 = 0;
		A2 = 0;
		A1 = 1;
		A0 = 0;
		B3 = 0;
		B2 = 0;
		B1 = 1;
		B0 = 0;
		#50;
      A3 = 1;
		A2 = 1;
		A1 = 0;
		A0 = 1;
		B3 = 1;
		B2 = 0;
		B1 = 1;
		B0 = 1;
		#50;
      A3 = 1;
		A2 = 0;
		A1 = 0;
		A0 = 1;
		B3 = 0;
		B2 = 0;
		B1 = 1;
		B0 = 1;
		#50;
      A3 = 0;
		A2 = 0;
		A1 = 0;
		A0 = 0;
		B3 = 0;
		B2 = 0;
		B1 = 0;
		B0 = 1;
		#50;
              
  
		// Add stimulus here

	end
      
endmodule

