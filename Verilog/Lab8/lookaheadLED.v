`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:25 11/03/2013 
// Design Name: 
// Module Name:    lookaheadLED 
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
module lookaheadLED(
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
	 
lookaheadAdder4bit lookaheadAdder(A, B, Cin, sum, Cout);
AnodeDriverClock ledOutput(clock50, reset, muxA, muxB, muxC, muxD, data_lines, anode_select);

assign muxA = A;
assign muxB = B;
assign muxD = sum;
assign muxC = Cout;

endmodule
