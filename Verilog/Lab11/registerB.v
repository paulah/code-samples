`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:36:48 11/24/2013 
// Design Name: 
// Module Name:    registerB 
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
module registerB #(parameter N = 4)(
	input reset,
	input clk,
	input enable,
	input ld_shift,
	input [N-1:0] D,
	output zero,
	output lsb_b
	);

always @ (posedge clk) begin
	if(enable) begin
		if(reset) D <= D;
		else begin
			if(D == 0)
				zero = 1;
			if(ld_shift)
				D <= D >> 1;
			else
				D <= D;
				
			lsb_b <= D[0];
		end
	end
	
	else // disabled
		D <= 0;
	end

endmodule
