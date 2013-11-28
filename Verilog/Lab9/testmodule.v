`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:21 11/04/2013 
// Design Name: 
// Module Name:    testmodule 
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
module testmodule(input clr,
	 input clk,
	 output [3:0] rs,
	 output rc,
	 output [3:0] ls,
	 output lc,
	 output [15:0] clock
    );
	 


counter#(
     .N(15))
     count(.clr(clr),
    .clk(clk),
    .slowclk(clock)
    );

ripple_carry_REAL
ripple(.a1(clock[8]),
	.a2(clock[9]),
	.a3(clock[10]),
	.a4(clock[11]),
	.b1(clock[12]),
	.b2(clock[13]),
	.b3(clock[14]),
	.b4(clock[15]),
	.s1(rs[0]),
	.s2(rs[1]),
	.s3(rs[2]),
	.s4(rs[3]),
	.cout(rc)
	);
	
	lookahead_adder
	lookahead(.c0(clock[7]),
	.a0(clock[8]),
	.a1(clock[9]),
	.a2(clock[10]),
	.a3(clock[11]),
	.b0(clock[12]),
	.b1(clock[13]),
	.b2(clock[14]),
	.b3(clock[15]),
	.s0(ls[0]),
	.s1(ls[1]),
	.s2(ls[2]),
	.s3(ls[3]),
	.cout(lc)
	);

endmodule
