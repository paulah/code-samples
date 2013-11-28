`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:32 10/18/2013 
// Design Name: 
// Module Name:    mux21n 
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
module mux21n
#(parameter N=4)
(
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire s,
    output reg [N-1:0] y
);

always @(*)
    if(s == 0)
        y = a;
    else
        y = b;

endmodule
