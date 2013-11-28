`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:57 10/19/2013 
// Design Name: 
// Module Name:    Mux4bit 
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
module Mux4bit(
    input wire [3:0] a,
    input wire [3:0] b,
    input s,
    output [3:0] y
    );
	Nbit21mux #(
	.N(4))
		M4 (.a(a),
		.b(b),
		.s(s),
		.y(y)
	);	

endmodule
