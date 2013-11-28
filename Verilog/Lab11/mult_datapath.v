`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:22:51 11/24/2013 
// Design Name: 
// Module Name:    mult_datapath 
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
module mult_datapath #(parameter N = 4)(
	input clk,
	input reset,
	input enable_a, //enable turns on the datapath
	input ld_shift_a, //shift at the next clock cycle
	input enable_b,
	input ld_shift_b,
	input LdP,
	input psel, //selects whether zero or the multiplicand should be added to partial product
	input [N-1:0] A,
	input [N-1:0] B,
	output [2*N-1:0] R,
	output zero, //zero flag to say multiplier is zero
	output lsb_b //least significant bit of b
	);

wire [2*N-1:0] outA;
wire [2*N-1:0] partialP;

registerA regA(.reset(reset), .enable(enable_a), .ld_shift(ld_shift_a), .clk(clk),
.D(A), .Q(outA));

registerB regB(.reset(reset), .enable(enable_b), .ld_shift(ld_shift_b), .clk(clk),
.D(B), .zero(zero), .lsb_b(psel));

add_mux add_mux0 (.A(outA), .B(R), .sel(psel), .Y(partialP));

registerP regP(.reset(reset), .clk(clk), .ldP(LdP), .D(partialP), .P(R));

endmodule
