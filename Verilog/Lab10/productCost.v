`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:09 11/17/2013 
// Design Name: 
// Module Name:    productCost 
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
module productCost(
    input [3:0] select,
	 output reg[6:0] cost
	 );

always @(select) begin
		case(select)
			4'b0000: cost = 0;
			4'b0001: cost = 55;
			4'b0010: cost = 60;
			4'b0100: cost = 65;
			4'b1000: cost = 70;
			default: $display("error in product");
		endcase
end

endmodule
