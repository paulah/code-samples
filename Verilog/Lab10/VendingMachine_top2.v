`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:58 11/17/2013 
// Design Name: 
// Module Name:    VendingMachine_top2 
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
module VendingMachine_top2(
	 input clk50, 
	 input reset,
	 input [3:0] productSelect,
	 input [2:0] coin,
	 output clk,
	 output wire dispense,
	 output wire [11:0] moneyBCD,
	 output wire [11:0] changeBCD,
	 output wire a,
    output wire b,
    output wire c,
    output wire d,
    output wire e,
    output wire f,
    output wire g,
	 output wire [3:0] anode_sig,
	 inout wire [14:0] counter
	 );
	 
wire anodeClock;
wire [3:0] out;
wire [1:0] mult_sig;
wire [5:0] product;

counter#(.N(15)) count(.clr(reset), .clk(clk50), .slowclk(counter));

ClockConverter clk1khz (clk50, reset, anodeClock);

Anode_Driver anode(.clock(anodeClock), .reset(reset), .anode_selection_signal(anode_sig), .mux_selection_signal(mult_sig));

VendingMachine_top vmtop(clk50, reset, productSelect, coin, clk, dispense, moneyBCD, changeBCD, product);

Multiplexer mux(.A({2'b0, product[5], product[4]}),
	.B({product[3], product[2], product[1], product[0]}),
	.C(4'b0),
   .D(4'b0),
   .Select(mult_sig), .Y(out));
	
hex_to_7_seg_1 decod(.x(out), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));

endmodule
