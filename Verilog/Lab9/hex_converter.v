`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:36 10/28/2013 
// Design Name: 
// Module Name:    hex_converter 
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
module hex_converter(
    input wire clr,
    input wire clk,
    input wire [3:0] input1,
    input wire [3:0] input2,
    input wire [3:0] input3,
    input wire [3:0] input4,
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
     mux(.A(input1),
    .B(input2),
   .C(input3),
   .D(input4),
    .Select(mult_sig),
    .Y(out)
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
