`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:22 11/10/2013 
// Design Name: 
// Module Name:    booth_encoder 
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
module booth_encoder(
    input [2:0] select,
	 input [3:0] x,
	 output reg [7:0] product
	 );

always @(*) begin
	case(select)
		0: product <= 0;
		1: product <= x;
		2: product <= x;
		3: product <= 2*x;
		4: product <= -2*x;
		5: product <= -1*x;
		6: product <= -1*x;
		7: product <= 0;
	endcase
end
endmodule
