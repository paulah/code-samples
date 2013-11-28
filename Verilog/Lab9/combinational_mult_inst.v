`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:25 11/11/2013 
// Design Name: 
// Module Name:    combinational_mult_inst 
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
module combinational_mult_inst(
    input wire clr,
    input wire clk,
    input wire A1,
    input wire A2,
    input wire A3,
    input wire A0,
	 input wire B1,
	 input wire B2,
	 input wire B3,
	 input wire B0,
	 output wire S0,
	 output wire S1,
	 output wire S2,
	 output wire S3,
	 output wire S4,
	 output wire S5,
	 output wire S6,
	 output wire S7,
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
     mux(.A({A3,A2,A1,A0}),
    .B({B3,B2,B1,B0}),
   .C({S7,S6,S5,S4}),
   .D({S3,S2,S1,S0}),
    .Select(mult_sig),
    .Y(out)
    ); 
     
combinational_array_mult 
combo(clock[14], clock[13], clock[12], clock[11], clock[10], clock[9], clock[8], clock[7], S0, S1, S2, S3, S4, S5, S6, S7);
     
	
     
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
