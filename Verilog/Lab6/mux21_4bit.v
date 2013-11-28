`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:44 10/18/2013 
// Design Name: 
// Module Name:    mux21_4bit 
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
module mux21_4bit(
    input wire [3:0] a,
    input wire [3:0] b,
    input s,
    output [3:0] y
    );

mux21n #(.N(8))
	M8 (.a(a), .b(b), .s(s), .y(y) );

endmodule
