`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:01 11/15/2013 
// Design Name: 
// Module Name:    Clock1Hz 
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
module Clock1Hz(
	input clk50,
	input reset,
	output reg clk
	);
	
	reg [26:0] counter;	

	always @(posedge clk50) begin
		if(counter==50000000) begin
			counter <= 0;
			clk <= ~clk;
		end
		else
		begin
			counter <= counter+1;
		end
	end
endmodule
