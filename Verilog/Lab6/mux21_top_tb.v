`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:35:14 10/18/2013
// Design Name:   mux21_top
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab6/mux21_top_tb.v
// Project Name:  Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux21_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux21_top_tb;

	// Inputs
	reg a;
	reg b;
	reg s;
	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	mux21_top uut (
		.a(a), 
		.b(b),
		.s(s),
		.y(y)
	);

	integer i=0;
	initial begin
	a = 0;
	b = 0;
	#10 $display("Starting test");
	
	for(i=0; i<4; i=i+1)
		begin
			{a,b} = i; //set the inputs
			s = 0;
			#10 $display("A B=%b%b, s=%b, y=%b", a,b,s,y);
			if(y != a)
				$display("Error, y should be %b, is $b", a, y);
			s = 1;
			#10 $display("A B=%b%b, s=%b, y=%b", a,b,s,y);
			if(y != b)
				$display("Error, y should be %b, is $b", b, y);
		end
	end
endmodule

