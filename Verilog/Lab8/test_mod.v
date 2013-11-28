`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:39 11/04/2013 
// Design Name: 
// Module Name:    test_mod 
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
module test_mod(
    input clock50,
	 input reset,
	 output [3:0] A,
    output [3:0] B,
    output Cin,
    output [3:0] sum_1,
    output Cout_1,
	 output [3:0] sum_r,
    output Cout_r,
	 output clk
	 );
	 wire [8:0] counterOutput;
	 
lookaheadAdder4bit lookaheadAdder(A, B, Cin, sum_1, Cout_1);
rippleAdder4bit rippleAdder(A, B, Cin, sum_r, Cout_r);
counter #(.N(9)) myCounter(reset, clk, counterOutput);

ClockConverter theClock(.clk(clock50), .reset(reset), .newclock(clk));


assign A = {counterOutput[3],counterOutput[2], counterOutput[1], counterOutput[0]};
assign B = {counterOutput[7],counterOutput[6],counterOutput[5],counterOutput[4]};
assign Cin = counterOutput[8];
endmodule
