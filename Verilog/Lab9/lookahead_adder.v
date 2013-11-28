`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:55:34 11/03/2013 
// Design Name: 
// Module Name:    lookahead_adder 
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
module lookahead_adder(
	 input c0,
    input a0,
    input a1,
    input a2,
    input a3,
    input b0,
    input b1,
    input b2,
    input b3,
    output s0,
    output s1,
    output s2,
    output s3,
	 output cout
    );
	 
	 wire p0;
	 wire p1;
	 wire p2;
	 wire p3;
	 wire g0;
	 wire g1;
	 wire g2;
	 wire g3;
	 wire c1;
	 wire c2;
	 wire c3;


	 assign p0 = a0^b0;
	 assign g0 = a0&b0;
	 assign p1 = a1^b1;
	 assign g1 = a1&b1;
	 assign p2 = a2^b2;
	 assign g2 = a2&b2;
	 assign p3 = a3^b3;
	 assign g3 = a3&b3;
	 
	 assign c1 = g0 | p0&c0;
	 assign c2 = g1 | p1&g0 | p1&p0&c0;
	 assign c3 = g2 | p2&g1 | p2&p1&g0 | p2&p1&p0&c0;
	 assign cout = g3 | p3&g2 | p3&p2&g1 | p3&p2&p1&g0 | p3&p2&p1&p0&c0;
	 
	 
	 assign s0 = p0^c0;
	 assign s1 = p1^c1;
	 assign s2 = p2^c2;
	 assign s3 = p3^c3;
 
endmodule
