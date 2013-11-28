`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:30:19 11/10/2013 
// Design Name: 
// Module Name:    booth_mult 
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
module booth_mult(
    input [3:0] x,
	 input [3:0] y,
	 output [7:0] product
	 );

wire [7:0] p1;
wire [7:0] p2;
wire [7:0] p3;

booth_encoder be({y[1], y[0], 1'b0}, x, p1);
booth_encoder be2({y[3], y[2], y[1]}, x, p2);
booth_encoder be3({2'b00, y[3]}, x, p3);

assign product = p1 + (p2<<2) + (p3<<4);

endmodule
