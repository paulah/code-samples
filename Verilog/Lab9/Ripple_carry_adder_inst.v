`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:49 11/03/2013 
// Design Name: 
// Module Name:    Ripple_carry_adder_inst 
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
module Ripple_carry_adder_inst(
    input wire clr,
    input wire clk,
    input wire a1,
    input wire a2,
    input wire a3,
    input wire a4,
	 input wire b1,
	 input wire b2,
	 input wire b3,
	 input wire b4,
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
	  wire s1;
	  wire s2;
	  wire s3;
	  wire s4;
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
     mux(.A({a4,a3,a2,a1}),
    .B({b4,b3,b2,b1}),
   .C({s4,s3,s2,s1}),
   .D({0,0,0,cout}),
    .Select(mult_sig),
    .Y(out)
    ); 
     
	ripple_carry_REAL
	ripple(.a1(a1),
	.a2(a2),
	.a3(a3),
	.a4(a4),
	.b1(b1),
	.b2(b2),
	.b3(b3),
	.b4(b4),
	.s1(s1),
	.s2(s2),
	.s3(s3),
	.s4(s4),
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
