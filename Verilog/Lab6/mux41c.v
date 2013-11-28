`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:38:26 10/20/2013 
// Design Name: 
// Module Name:    mux41c 
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
module mux41c(
    input wire [3:0] c,
	 input wire [1:0] s,
	 output reg y
);

always @(*)
	case(s)
		0: y = c[0];
		1: y = c[1];
		2: y = c[2];
		3: y = c[3];
		default: y = c[0];
	endcase

endmodule
