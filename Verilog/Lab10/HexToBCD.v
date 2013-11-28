`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:05 11/17/2013 
// Design Name: 
// Module Name:    HexToBCD 
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
module HexToBCD(
	input clk,
	input rst,
	input [7:0] hex,
	output [11:0] bcd
	);
	
reg [3:0] hundreds;
reg [3:0] tens;
reg [3:0] units;
reg [7:0] hex_reg;
reg [3:0] shift_state;
reg [11:0] buffer;
assign bcd = buffer;
always @ (posedge clk) begin
if(rst) begin
hex_reg <= hex;
shift_state <= 0;
hundreds <= 0;
tens <= 0;
units <= 0;
end
else begin
if( shift_state <= 6) begin
shift_state <= shift_state + 1;

hex_reg <= hex_reg << 1;
if ( {units[2:0], hex_reg[7]} >= 5) //shift and add
units <= {units[2:0], hex_reg[7]} + 3;
else
units <= {units[2:0], hex_reg[7]};
if ( {tens[2:0], units[3]} >= 5)
tens <= {tens[2:0], units[3]} + 3;
else
tens <= {tens[2:0], units[3]};
if ( {hundreds[2:0], tens[3]} >= 5)
hundreds <= {hundreds[2:0], tens[3]} + 3;
else
hundreds <= {hundreds[2:0], tens[3]};
end
else if (shift_state == 7) begin
shift_state <= shift_state + 1;
hex_reg <= hex_reg << 1;
units <= {units[2:0], hex_reg[7]};
tens <= {tens[2:0], units[3]};
hundreds <= {hundreds[2:0], tens[3]};
end
else begin
shift_state <= 0;
buffer <= {hundreds,tens,units};
hex_reg <= hex;
hundreds <= 0;
tens <= 0;
units <= 0;
end
//else do nothing
end
end


endmodule
