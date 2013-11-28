`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:48 11/04/2013 
// Design Name: 
// Module Name:    lookahead_inst 
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
module lookahead_inst(
    input wire clr,
    input wire clk,
    input wire a1,
    input wire a2,
    input wire a3,
    input wire a0,
	 input wire b1,
	 input wire b2,
	 input wire b3,
	 input wire b0,
	 input wire c0,
    output wire a,
    output wire b,
    output wire c,
    output wire d,
    output wire e,
    output wire f,
    output wire g,
	 inout wire [14:0] clock,
     output wire [3:0] anode_sig
    );
     
     wire [3:0] out;
     wire [1:0] mult_sig;
	  wire s0;
	  wire s1;
	  wire s2;
	  wire s3;
	  wire cout;
     
     counter#(
     .N(15))
     count(.clr(clr),
    .clk(clk),
    .slowclk(clock)
    );
     
     Anode_Driver
     anode(.clock(clock[14]),
    .reset(clr),
    .anode_selection_signal(anode_sig),
    .mux_selection_signal(mult_sig)
    );
	 
	  Multiplexer
     mux(.A({a3,a2,a1,a0}),
    .B({b3,b2,b1,b0}),
   .C({s3,s2,s1,s0}),
   .D({0,0,0,cout}),
    .Select(mult_sig),
    .Y(out)
    ); 
     
	lookahead_adder
	lookahead(.c0(c0),
	.a0(a0),
	.a1(a1),
	.a2(a2),
	.a3(a3),
	.b0(b0),
	.b1(b1),
	.b2(b2),
	.b3(b3),
	.s0(s0),
	.s1(s1),
	.s2(s2),
	.s3(s3),
	.cout(cout)
	);
	
     
     hex_to_7_seg_1
     decod(.x(out),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g)
    );


endmodule
