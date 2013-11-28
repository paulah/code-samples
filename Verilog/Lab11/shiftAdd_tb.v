`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:48:12 11/25/2013
// Design Name:   shiftAdd
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab11/shiftAdd_tb.v
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

module shiftAdd_tb;

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

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#100 reset = 0;
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		 A = 15;
		 B = 10;
		 
		#100 $display("A is %d, B is %d, Product is %d", A, B, P);
		// Add stimulus here
		
		A = 9;
		B = 6;
		#100 $display("A is %d, B is %d, Product is %d", A, B, P);
		
		A = 0;
		B = 8;
		#100 $display("A is %d, B is %d, Product is %d", A, B, P);
		
		A = 14;
		B = 0;
		#100 $display("A is %d, B is %d, Product is %d", A, B, P);
		
		

	end
	
	always begin
		#10;
		clk = ~clk;
	end
      
endmodule

