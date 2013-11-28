`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:19 10/26/2013 
// Design Name: 
// Module Name:    Hex7Case 
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
module Hex7Case(
    input wire [3:0] x,
    output reg [6:0] y
    );

always @(*)
	case(x)
		0: y = 1;
		1: y = 7'b1001111;
		2: y = 7'b0010010;
		3: y = 7'b0000110;
		4: y = 7'b1001100;
		5: y = 7'b0100100;
		6: y = 7'b0100000;
		7: y = 7'b0001111;
		8: y = 7'b0000000;
		9: y = 7'b0000100;
		10: y = 7'b0001000;
		11: y = 7'b1100000;
		12: y = 7'b0110001;
		13: y = 7'b1000010;
		14: y = 7'b0110000;
		15: y = 7'b0111000;
	endcase
endmodule
