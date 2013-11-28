`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:18 10/21/2013 
// Design Name: 
// Module Name:    mux41_4bit_counter 
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
module mux41_4bit_counter(
	 input clk,
	 input reset,
	 input [1:0] s,
	 output [3:0] y,
    output wire [3:0] counter);

counter #(.N(16))
	counter4 (.count(counter), .clk(clk), .reset(reset));
	
mux41_4bit1 mux1 (.s0(s[0]), .s1(s[1]), .a(counter[0]), .b(counter[1]), .c(counter[2]), .d(counter[3]), .y(y));
endmodule
