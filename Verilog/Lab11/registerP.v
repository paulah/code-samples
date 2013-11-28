`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:50:46 11/24/2013 
// Design Name: 
// Module Name:    registerP 
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
module registerP #(parameter N = 4)(
    input reset,
	 input clk,
	 input ldP,
	 input [2*N-1:0] D,
	 output [2*N-1:0] P
	 );

always @(posedge clk) begin
	if(reset)
		P <= 0;
	else begin
		if(ldP)
			P <= D + P;
	end
end

endmodule
