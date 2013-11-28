`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:05:29 11/02/2013 
// Design Name: 
// Module Name:    lookaheadAdder4bit 
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
module lookaheadAdder4bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] sum,
    output Cout
    );
	 
	 wire g0, g1, g2, g3, c1, c2, c3;
	 wire p0, p1, p2, p3;
	 
halfadder HA1(.s(p0), .c(g0), .A(A[0]), .B(B[0]));
halfadder HA2(.s(p1), .c(g1), .A(A[1]), .B(B[1]));
halfadder HA3(.s(p2), .c(g2), .A(A[2]), .B(B[2]));
halfadder HA4(.s(p3), .c(g3), .A(A[3]), .B(B[3]));
xor xor1(sum[0], Cin, p0);
xor xor2(sum[1], c1, p1);
xor xor3(sum[2], c2, p2);
xor xor4(sum[3], c3, p3);
assign c1 = g0 + (p0 & Cin);
assign c2 = g1 + (p1 & g0) + (p1 & p0 & Cin);
assign c3 = g2 + (p2 & p1 & g0) + (p2 & p1 & p0 & Cin);
assign Cout = g3 + (p3 & g2) + (p3 & p2 & g1) + (p3 & p2 & p1 & g0) + (p3 & p2 & p1 & p0 & Cin);
endmodule
