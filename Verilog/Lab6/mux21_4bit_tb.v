`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:40:17 10/18/2013
// Design Name:   mux21_4bit
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab6/mux21_4bit_tb.v
// Project Name:  Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux21_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux21_4bit_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg s;

	// Outputs
	wire [3:0] y;

	// Instantiate the Unit Under Test (UUT)
	mux21_4bit uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.y(y)
	);

	integer i=0, j=0;
	initial begin
	a = 0;
	b = 0;
	#10 $display("Starting test");
	
	for(i=0; i<16; i=i+1)
		begin
			for(j=0; j<16; j=j+1)
			begin
			
			a = i;
			b = j;
			
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
	end 
endmodule

