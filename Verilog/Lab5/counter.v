`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:38 10/14/2013 
// Design Name: 
// Module Name:    counter 
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
module counter #(parameter N = 16)(
	input clk,
	input reset,
	output reg [3:0] count
);

always @(posedge clk) begin
	if (reset) begin
		count <= 0;
	end
	else begin
	if (count < N) begin
		count <= count + 1;
	end
	else begin
		count <= 0;
	end
end
end
endmodule
