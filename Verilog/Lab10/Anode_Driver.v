`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:27 10/27/2013 
// Design Name: 
// Module Name:    Anode_Driver 
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
module Anode_Driver(
    input clock,
    input reset,
    output reg [3:0] anode_selection_signal,
    output reg [1:0] mux_selection_signal
    );
	 
always @(posedge clock)
begin
if(reset)
begin
anode_selection_signal[3:0] <= 4'b0111;
mux_selection_signal[1:0] <= 2'b00;
end
else
begin
anode_selection_signal <= {anode_selection_signal[0], anode_selection_signal[3:1]};
mux_selection_signal <= mux_selection_signal+1;
end
end
endmodule
