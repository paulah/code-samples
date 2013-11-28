`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:54 10/27/2013 
// Design Name: 
// Module Name:    hex_to_7_seg_2 
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
module hex_to_7_seg_2(
    input [3:0] x,
    output reg [6:0] abcdefg
    );

always @(x)
	case (x)
	4'b0000: abcdefg = 7'b0000001;
	4'b0001: abcdefg = 7'b1001111;
	4'b0010: abcdefg = 7'b0010010;
	4'b0011: abcdefg = 7'b0000110;
	4'b0100: abcdefg = 7'b1001100;
	4'b0101: abcdefg = 7'b0100100;
	4'b0110: abcdefg = 7'b0100000;
	4'b0111: abcdefg = 7'b0001111;
	4'b1000: abcdefg = 7'b0000000;
	4'b1001: abcdefg = 7'b0000100;
	4'b1010: abcdefg = 7'b0001000;
	4'b1011: abcdefg = 7'b1100000;
	4'b1100: abcdefg = 7'b0110001;
	4'b1101: abcdefg = 7'b1000010;
	4'b1110: abcdefg = 7'b0110000;
	4'b1111: abcdefg = 7'b0111000;	
	default: abcdefg = 7'b0000001;
	endcase
	
endmodule
