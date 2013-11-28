`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:35:29 11/02/2013
// Design Name:   fulladder
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab8/fulladder_tb.v
// Project Name:  Lab8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fulladder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fulladder_tb;

	// Inputs
	reg A;
	reg B;
	reg Cin;

	// Outputs
	wire s;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	fulladder uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.s(s), 
		.Cout(Cout)
	);

	integer i=0;
		initial begin
		A = 0;
		B = 0;
		Cin=0;
		#10 $display("Starting test");

		for(i=0; i<8; i=i+1)
		begin
			{Cin,A,B} = i; //set the inputs
			#10 $display("Cin A B =%b%b%b, {Cout,S}=%b%b", Cin,A,B,Cout,s);
			if({Cout,s}!=(Cin+A+B))
			$display("Error, {Cout,S} should be %b, is $b", (A+B+Cin), {Cout,s});
		end
	end 
      
endmodule

