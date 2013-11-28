`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:08:24 10/13/2013
// Design Name:   halfadder
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab5/testhalfadder.v
// Project Name:  Lab5
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

module testhalfadder;

	// Inputs
	reg A;
	reg B;

	// Outputs
	wire Cout;
	wire S;

	// Instantiate the Unit Under Test (UUT)
	halfadder uut (
		.A(A), 
		.B(B), 
		.Cout(Cout), 
		.S(S)
	);

		// Initialize Inputs
		integer i=0;
		initial begin
		A = 0;
		B = 0;
		#10 $display("Starting test");

		for(i=0; i<4; i=i+1)
		begin
			{A,B} = i; //set the inputs
			#10 $display("A B =%b%b, {Cout,S}=%b%b", A,B,Cout,S);
			if({Cout,S}!=(A+B))
			$display("Error, {Cout,S} should be %b, is $b", (A+B), {Cout,S});
		end
	end 
endmodule

