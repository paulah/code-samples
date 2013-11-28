`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:25:32 11/25/2013
// Design Name:   shiftAdd
// Module Name:   F:/Lab11/top_tb.v
// Project Name:  Lab11
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shiftAdd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire [7:0] P;

	// Instantiate the Unit Under Test (UUT)
	shiftAdd uut (
		.clk(clk), 
		.reset(reset), 
		.A(A), 
		.B(B), 
		.P(P)
	);

	integer a, b;
	
	always begin
		#1 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100 reset = 0;
        
		// Add stimulus here
		for (a = 0; a < 16; a = a + 1) begin
			for (b = 0; b < 16; b = b + 1) begin
				A = a; B = b;
				#100 $display("%d x %d = %d (%d)", A, B, P, (A*B));
			end
		end

	end
      
endmodule

