`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:47 11/18/2013 
// Design Name: 
// Module Name:    product_top 
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
module product_top(
	input [2:0] coins,
	input [3:0] switches,
	input clk,
	input reset,
	output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g,
	output [3:0] anodes,
	output dispense
    );

	wire anodeClock;
	wire [3:0] out;
	wire [1:0] mult_sig;
	wire [15:0] counter;
	wire [6:0] product;
	wire [11:0] BCDproduct;
	wire [11:0] BCDmoney;
	wire [6:0] money;
	wire [6:0] change;

	productCost pc(switches, product);
	get_balance gb(switches, product, clk, reset, coins, money, dispense); 
	
	counter#(.N(15)) count(.clr(reset), .clk(clk), .slowclk(counter));

	Anode_Driver anode(.clock(counter[14]), .reset(reset), .anode_selection_signal(anodes), .mux_selection_signal(mult_sig));
	
	HexToBCD p1(clk, reset, {1'b0, product}, BCDproduct);
	HexToBCD p2(clk, reset, {1'b0, money}, BCDmoney);
	
	Multiplexer mux(.A({BCDproduct[7], BCDproduct[6], BCDproduct[5], BCDproduct[4]}),
	.B({BCDproduct[3], BCDproduct[2], BCDproduct[1], BCDproduct[0]}),
	.C({BCDmoney[7], BCDmoney[6], BCDmoney[5], BCDmoney[4]}),
   .D({BCDmoney[3], BCDmoney[2], BCDmoney[1], BCDmoney[0]}),
   .Select(mult_sig), .Y(out));
	
	hex_to_7_seg_1 decod(.x(out), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));

endmodule
