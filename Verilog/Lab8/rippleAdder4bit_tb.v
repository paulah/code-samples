`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:10:45 11/02/2013
// Design Name:   rippleAdder4bit
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab8/rippleAdder4bit_tb.v
// Project Name:  Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rippleAdder4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rippleAdder4bit_tb;
	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg Cin;

	// Outputs
	wire [3:0] sum;
	wire Cout;

	rippleAdder4bit uut ( .A(A), .B(B), .Cin(Cin), .sum(sum), .Cout(Cout) );

	initial begin
		A = 0;
		B = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;

		#30 $display("Starting test");
		A = 4'b1010;
		B = 4'b1100;
		Cin = 1'b0;
		#10 $display("A is %b, B is %b, output sum is %b, output carry is %b", A, B, sum, Cout);
		
		#30 A = 4'b0101;
		B = 4'b0101;
		#10 $display("A is %b, B is %b, output sum is %b, output carry is %b", A, B, sum, Cout);

		#30 A = 4'b0001;
		B = 4'b0001;
		#10 $display("A is %b, B is %b, output sum is %b, output carry is %b", A, B, sum, Cout);
	end
endmodule

