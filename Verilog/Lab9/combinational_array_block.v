`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:28 11/10/2013 
// Design Name: 
// Module Name:    combinational_array_block 
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
module combinational_array_block(
    input X,
    input Y,
	 input SumIn,
    input Cin,
    output SumOut,
    output Cout
    );


wire inter, sum, c;

assign inter = X&Y;
full_adder f1(SumIn, inter, Cin, sum, c);
assign SumOut = sum;
assign Cout = c; 


endmodule
