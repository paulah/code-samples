`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:40:59 11/02/2013
// Design Name:   halfadder
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab8/halfadder_tb.v
// Project Name:  Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: halfadder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module halfadder_tb;

	// Inputs
	reg A;
	reg B;

	// Outputs
	wire s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	halfadder uut (
		.A(A), 
		.B(B), 
		.s(s), 
		.c(c)
	);

	integer i=0;
		initial begin
		A = 0;
		B = 0;
		#10 $display("Starting test");

		for(i=0; i<4; i=i+1)
		begin
			{A,B} = i; //set the inputs
			#10 $display("A B =%b%b, {Cout,S}=%b%b", A,B,c,s);
			if({c,s}!=(A+B))
			$display("Error, {Cout,S} should be %b, is $b", (A+B), {c,s});
		end
	end 
      
endmodule

