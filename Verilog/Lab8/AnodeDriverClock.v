`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:03 10/28/2013 
// Design Name: 
// Module Name:    AnodeDriverClock 
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
module AnodeDriverClock(
    input clock50,
	 input reset,
	 input [3:0] a,
	 input [3:0] b,
	 input [3:0] c,
	 input [3:0] d,
	 
	 output [6:0] data_lines,
	 output [3:0] anode_select,
	 
	 output clock
	 );
	wire [1:0] mux_select;
	wire [3:0] mux_output;
ClockConverter theClock(.clk(clock50), .reset(reset), .newclock(clock));
AnodeDriver anodeDriver(.clock(clock), .reset(reset), .anode_select(anode_select), .mux_select(mux_select));
mux4bit41 mux(.a(a), .b(b), .c(c), .d(d), .s1(mux_select[0]), .s2(mux_select[1]), .y(mux_output));
Hex7Continuous decoder(.x(mux_output), .y(data_lines));


endmodule
