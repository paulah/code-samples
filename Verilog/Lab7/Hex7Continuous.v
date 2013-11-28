`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:01 10/26/2013 
// Design Name: 
// Module Name:    Hex7Continuous 
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
module Hex7Continuous(
    input wire [3:0] x,
    output wire [6:0] y
    );

assign y[0] = ~x[3] & ~x[2] & ~x[1] & x[0] | ~x[3] & x[2] & ~x[1] & ~x[0] | x[3] & x[2] & ~x[1] & x[0] | x[3] & ~x[2] & x[1] & x[0];
assign y[1] = x[3] & x[2] & ~x[1] & ~x[0] | ~x[3] & x[2] & ~x[1] & x[0] | x[3] & x[1] & x[0] | x[2] & x[1] & ~x[0];
assign y[2] = x[3] & x[2] & ~x[1] & ~x[0] | ~x[3] & ~x[2] & x[1] & ~x[0] | x[3] & x[2] & x[1];
assign y[3] = ~x[3] & x[2] & ~x[1] & ~x[0] | ~x[3] & ~x[2] & ~x[1] & x[0] | x[3] & ~x[2] & x[1] & ~x[0] | x[2] & x[1] & x[0];
assign y[4] = ~x[3] & x[0] | ~x[3] & x[2] & ~x[1] | ~x[2] & ~x[1] & x[0];
assign y[5] = ~x[3] & ~x[2] & x[0] | ~x[3] & ~x[2] & x[1] | x[3] & x[2] & ~x[1] & x[0] | ~x[3] & x[1] & x[0];
assign y[6] = ~x[3] & ~x[2] & ~x[1] | ~x[3] & x[2] & x[1] & x[0] | x[3] & x[2] & ~x[1] & ~x[0];

endmodule
