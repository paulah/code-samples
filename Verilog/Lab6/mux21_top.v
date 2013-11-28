`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:56:39 10/21/2013 
// Design Name: 
// Module Name:    mux21_top 
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
module mux21_top(
    input a,
    input b,
	 input s,
	 output reg y
    );

always @(*)
	if(s == 0)
		y = a;
	else
		y = b;
endmodule
