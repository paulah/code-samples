`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:33 11/02/2013 
// Design Name: 
// Module Name:    fulladder 
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
module fulladder(
	input A, B, Cin,
	output s, Cout
   );

wire s1,c1,c2;

halfadder HA1(.s(s1), .c(c1), .A(A), .B(B));
halfadder HA2(.s(s), .c(c2) , .A(s1), .B(Cin));
or or_gate(Cout,c1,c2);

endmodule
