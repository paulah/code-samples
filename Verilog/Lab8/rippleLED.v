`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:08 11/03/2013 
// Design Name: 
// Module Name:    rippleLED 
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
module rippleLED(
    input clock50,
	 input reset,
	 input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] sum,
    output Cout,
	 
	 output [6:0] data_lines,
	 output [3:0] anode_select
	 );
	 
	 wire [3:0] muxA;
	 wire [3:0] muxB;
	 wire [3:0] muxC;
	 wire [3:0] muxD;
	 
rippleAdder4bit rippleAdder(A, B, Cin, sum, Cout);
AnodeDriverClock(clock50, reset, muxA, muxB, muxC, muxD, data_lines, anode_select);

assign muxA = A;
assign muxB = B;
assign muxC = sum;
assign muxD = Cout;


endmodule
