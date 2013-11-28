`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:41:01 10/20/2013 
// Design Name: 
// Module Name:    mux41c_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux41c_tb;

    // Inputs
	reg [3:0] c;
	reg [1:0] s;
	wire y;
	 
	mux41c uut (
		.c(c), 
		.s(s),
		.y(y)
	);
	
	integer i=0;
	initial begin
	c = 0;
	s = 0;
	#10 $display("Starting test");
	
	for(i=0; i<4; i=i+1)
		begin
			s = i;
			#10 $display("s=%b, c=%b, y=%b", s,c,y);
			if(c[i] != y)
				$display("Error, y should be %b, is $b", c[i], y);
		end
	end
endmodule
