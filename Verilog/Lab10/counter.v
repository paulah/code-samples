`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:02 10/28/2013 
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
module counter
#(parameter N=15)
(   input wire clr,
    input wire clk,
    output reg [N-1:0] slowclk
    );
always @(posedge clk)
begin
    if (clr==1)
        slowclk <= 0;
    else
        slowclk <= slowclk +1;
end
endmodule