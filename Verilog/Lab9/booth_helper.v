`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:19 11/11/2013 
// Design Name: 
// Module Name:    booth_helper 
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
module booth_helper(
    input [2:0] in,
    input [3:0] multiplicand,
    output [7:0] out
    );

wire [7:0] inter;
assign inter = multiplicand;

always @(*)
begin
case(in)
        3'b000: inter = inter*0;
		  3'b001: inter = inter;
		  3'b010: inter = inter;
		  3'b011: inter = inter*2;
		  3'b100: inter = inter*(-2);
		  3'b101: inter = inter*(-1);
		  3'b110: inter = inter*(-1);
		  3'b111: inter = inter*0;
		  default: inter = inter;
endcase

assign out = inter;
end
endmodule
