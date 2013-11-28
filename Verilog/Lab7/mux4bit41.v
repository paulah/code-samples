`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:40 10/19/2013 
// Design Name: 
// Module Name:    mux4bit41 
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
module mux4bit41(
	input wire [3:0] a,
	input wire [3:0] b,
	input wire [3:0] c,
	input wire [3:0] d,
	input wire s1,
	input wire s2,
	output wire [3:0] y
    );
	wire [3:0] ab;
	wire [3:0] cd;
	
	Mux4bit AB(
	.a(a),
	.b(b),
	.s(s1),
	.y(ab)
	);
	
	Mux4bit CD(
	.a(c),
	.b(d),
	.s(s1),
	.y(cd)
	);
	
	Mux4bit Out(
	.a(ab),
	.b(cd),
	.s(s2),
	.y(y)
	);

endmodule
