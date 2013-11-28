`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:16 10/27/2013 
// Design Name: 
// Module Name:    AnodeDriver 
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
module AnodeDriver(
	 input clock,
    input reset,
    output reg[3:0] anode_select,
    output reg[1:0] mux_select
    );


	always @(posedge clock) begin
		if(reset) begin
			anode_select <= 'b0111;
			mux_select <= 0;
		end
		else begin
			anode_select <= {anode_select[2:0], anode_select[3]};
			if(mux_select == 'd3)
				mux_select <= 0;
			else
				mux_select <= mux_select + 1;
		end
	end
endmodule
