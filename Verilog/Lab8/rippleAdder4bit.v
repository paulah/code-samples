`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:06 11/02/2013 
// Design Name: 
// Module Name:    rippleAdder4bit 
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
module rippleAdder4bit(
    input [3:0] A,
	 input [3:0] B,
	 input Cin,
	 output [3:0] sum,
	 output Cout
	 );

wire carry1, carry2, carry3;

fulladder F1(.A(A[0]), .B(B[0]), .Cin(Cin), .Cout(carry1), .s(sum[0]));
fulladder F2(.A(A[1]), .B(B[1]), .Cin(carry1), .Cout(carry2), .s(sum[1]));
fulladder F3(.A(A[2]), .B(B[2]), .Cin(carry2), .Cout(carry3), .s(sum[2]));
fulladder F4(.A(A[3]), .B(B[3]), .Cin(carry3), .Cout(Cout), .s(sum[3]));

endmodule
