`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:25:21 10/28/2013
// Design Name:   hex_converter
// Module Name:   F:/lab7prelab/test_bench.v
// Project Name:  lab7prelab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hex_converter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench;

	// Inputs
	reg clr;
	reg clk;
	reg [3:0] input1;
	reg [3:0] input2;
	reg [3:0] input3;
	reg [3:0] input4;

	// Outputs
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;
	wire [3:0] anode_sig;

	// Instantiate the Unit Under Test (UUT)
	hex_converter uut (
		.clr(clr), 
		.clk(clk), 
		.input1(input1), 
		.input2(input2), 
		.input3(input3), 
		.input4(input4), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.anode_sig(anode_sig)
	);

	initial begin
		// Initialize Inputs
		clr = 0;
		clk = 0;
		input1 = 0;
		input2 = 0;
		input3 = 0;
		input4 = 0;
		#50;
      
		// Add stimulus here

	end
      
endmodule

