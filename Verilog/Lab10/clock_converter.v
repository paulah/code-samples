`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:09 10/27/2013 
// Design Name: 
// Module Name:    clock_converter 
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
module clock_converter(
 input clk,
 input rst,
 output clk_out,
 reg[15:0] counter
 );

always @(posedge clk or negedge rst)
begin
if(!rst)
counter<=16'd0;
else
if(counter==16'd50000)
counter<=16'd0;
else
counter<=counter+1;
end

assign clk_out = (counter == 16'd50000);

endmodule