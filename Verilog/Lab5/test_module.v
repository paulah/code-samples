`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:21 10/14/2013 
// Design Name: 
// Module Name:    test_module 
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
module test_module(
    input clk,
    input rst,
    output cout,
    output sum,
	 output [3:0] c1
    );

counter theCounter(.clk(clk), .reset(rst), .count(c1));
fulladder theAdder(.Cin(c1[0]), .A(c1[1]), .B(c1[2]), .Cout(cout), .S(sum)); 

endmodule
