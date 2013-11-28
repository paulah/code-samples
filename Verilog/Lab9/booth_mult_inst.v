`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:52 11/11/2013 
// Design Name: 
// Module Name:    booth_mult_inst 
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
module booth_mult_inst(
    input wire clr,
    input wire clk,
    input wire [3:0] A,
    input wire [3:0] B,
    output wire [7:0] S,
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
     mux(.A(A),
    .B(B),
   .C({S[7],S[6],S[5],S[4]}),
   .D({S[3],S[2],S[1],S[0]}),
    .Select(mult_sig),
    .Y(out)
    ); 
     
	  booth_mult
	  booth(A, B, S);
     
	
     
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