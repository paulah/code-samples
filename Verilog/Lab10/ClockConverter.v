`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:03:52 10/26/2013 
// Design Name: 
// Module Name:    ClockConverter 
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
module ClockConverter(
    input clk,
    input reset,
    output reg newclock
    );

	reg [15:0] counter;	
	
	always @(posedge clk) begin
		if(reset) begin
			counter <= 0;
			newclock <= 0;
		end
		else if(counter==50000) begin
			counter <= 0;
			newclock <= newclock + 1;
		end
		else
		begin
			counter <= counter+1;
		end
	end
endmodule 
