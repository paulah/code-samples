`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:52:11 10/19/2013 
// Design Name: 
// Module Name:    Nbit21mux 
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
module Nbit21mux
	#(parameter N = 4)
	(input wire [N-1:0] a,
	 input wire [N-1:0] b,
	 input wire s,
	 output reg [N-1:0] y
	);

	always @(*)
		if(s==0)
			y=a;
		else
			y=b;

endmodule
