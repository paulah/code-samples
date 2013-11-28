`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:54 11/24/2013 
// Design Name: 
// Module Name:    registerA 
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
module registerA #(parameter N = 4)(
	input reset,
	input clk,
	input enable,
	input ld_shift,
	input [N-1:0] D,
	output reg [2*N-1:0] Q
	);

always @ (posedge clk) begin
	if(enable) begin
		if(reset) Q <= D;
		else begin
			if(ld_shift)
				Q <= Q << 1;
			else
				Q <= Q;
		end
	end
	
	else // disabled
		Q <= 0;
	end
endmodule
