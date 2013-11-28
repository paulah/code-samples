`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:39:19 11/25/2013 
// Design Name: 
// Module Name:    shiftAdd 
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
module shiftAdd(
	input clk,
	input reset,
	input [3:0] A,
	input [3:0] B,
	output reg [7:0] P
	 );
	
	reg [7:0] p1, p2, p3, p4;

always @(posedge clk) begin
	if(reset) begin
		P = 0;
	end
	
	else begin
		if(B == 0)
			P = 0;
		else begin
			if(B[0])
				p1 = A;
			else
				p1 = 0;
				
			if(B[1])
				p2 = (A <<< 1);
			else
				p2 = 0;
				
			if(B[2])
				p3 = (A <<< 2);
			else
				p3 = 0;
				
			if(B[3])
				p4 = (A <<< 3);
			else
				p4 = 0;
			
			P = p1 + p2 + p3 + p4;
		end
		
		 
	end
	
		
end

endmodule
