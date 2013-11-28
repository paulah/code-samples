`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:43:19 11/24/2013 
// Design Name: 
// Module Name:    add_mux 
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
module add_mux #(parameter N=4)(
    input [2*N-1:0] A,
	 input [2*N-1:0] B,
	 input sel,
	 output [2*N-1:0] Y
	 );

always @(posedge clk) begin
	if(sel) 
		assign Y = A + B;
	else //sel is zero
		assign Y = A;
end

endmodule
