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
	input [3:0] A,
	input [3:0] B,
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
	output [7:0] P,
	output [3:0] Aout,
	output [3:0] Bout,
	output clk_out
    );

	wire anodeClock;
	wire [3:0] out;
	wire [1:0] mult_sig;
	wire [15:0] counter;
	
	assign Aout = {counter[15],counter[14],counter[13],counter[12]};
	assign Bout = {counter[11],counter[10],counter[9],counter[8]};

	counter#(.N(16)) count(.clr(reset), .clk(clk), .slowclk(counter));

	Anode_Driver anode(.clock(counter[14]), .reset(reset), .anode_selection_signal(anodes), .mux_selection_signal(mult_sig));
	
	assign clk_out = counter[6];
	
	shiftAdd sa (
		.clk(clk_out), 
		.reset(reset), 
		.A({counter[15],counter[14],counter[13],counter[12]}), 
		.B({counter[11],counter[10],counter[9],counter[8]}), 
		.P(P)
	);
	
	Multiplexer mux(.A(Aout),
		.B(Bout),
		.C(P[7:4]),
		.D(P[3:0]),
		.Select(mult_sig), .Y(out));
	
	hex_to_7_seg_1 decod(.x(out), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));

endmodule
