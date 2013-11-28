`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:43:04 10/27/2013 
// Design Name: 
// Module Name:    Multiplexer 
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
module Multiplexer(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire [3:0] C,
    input wire [3:0] D,
    input wire [1:0] Select,
    output reg [3:0] Y
    );
always @(*)
	case(Select)
	0: Y = A;
	1: Y = B;
	2: Y = C;
	3: Y = D;
	default: Y = A;
	endcase


endmodule
