`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:34 11/17/2013 
// Design Name: 
// Module Name:    coinValue 
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
module coinValue(
    input [2:0] coin,
	 output reg [6:0] coinValue
	 );

always @(coin) begin
	case(coin)
		3'b000: coinValue = 0;
		3'b001: coinValue = 5;
		3'b010: coinValue = 10;
		3'b100: coinValue = 25;
		default: $display("error in coinvalue");
	endcase
end

endmodule
