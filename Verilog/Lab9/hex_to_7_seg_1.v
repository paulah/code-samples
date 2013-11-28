`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:53:10 10/27/2013 
// Design Name: 
// Module Name:    hex_to_7_seg_1 
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
module hex_to_7_seg_1(
    input wire [3:0] x,
    output reg a,
    output reg b,
    output reg c,
    output reg d,
    output reg e,
    output reg f,
    output reg g
    );

always @(*)
begin
if(x == 4'b0000)
begin
assign a = 0;
assign b = 0;
assign c = 0;
assign d = 0;
assign e = 0;
assign f = 0;
assign g = 1;
end
else if(x == 4'b0001)
begin
assign a = 1;
assign b = 0;
assign c = 0;
assign d = 1;
assign e = 1;
assign f = 1;
assign g = 1;
end
else if(x == 4'b0010)
begin
assign a = 0;
assign b = 0;
assign c = 1;
assign d = 0;
assign e = 0;
assign f = 1;
assign g = 0;
end
else if(x == 4'b0011)
begin
assign a = 0;
assign b = 0;
assign c = 0;
assign d = 0;
assign e = 1;
assign f = 1;
assign g = 0;
end
else if(x == 4'b0100)
begin
assign a = 1;
assign b = 0;
assign c = 0;
assign d = 1;
assign e = 1;
assign f = 0;
assign g = 0;
end
else if(x == 4'b0101)
begin
assign a = 0;
assign b = 1;
assign c = 0;
assign d = 0;
assign e = 1;
assign f = 0;
assign g = 0;
end
else if(x == 4'b0110)
begin
assign a = 0;
assign b = 1;
assign c = 0;
assign d = 0;
assign e = 0;
assign f = 0;
assign g = 0;
end
else if(x == 4'b0111)
begin
assign a = 0;
assign b = 0;
assign c = 0;
assign d = 1;
assign e = 1;
assign f = 1;
assign g = 1;
end
else if(x == 4'b1000)
begin
assign a = 0;
assign b = 0;
assign c = 0;
assign d = 0;
assign e = 0;
assign f = 0;
assign g = 0;
end
else if(x == 4'b1001)
begin
assign a = 0;
assign b = 0;
assign c = 0;
assign d = 0;
assign e = 1;
assign f = 0;
assign g = 0;
end
else if(x == 4'b1010)
begin
assign a = 0;
assign b = 0;
assign c = 0;
assign d = 1;
assign e = 0;
assign f = 0;
assign g = 0;
end
else if(x == 4'b1011)
begin
assign a = 1;
assign b = 1;
assign c = 0;
assign d = 0;
assign e = 0;
assign f = 0;
assign g = 0;
end
else if(x == 4'b1100)
begin
assign a = 0;
assign b = 1;
assign c = 1;
assign d = 0;
assign e = 0;
assign f = 0;
assign g = 1;
end
else if(x == 4'b1101)
begin
assign a = 1;
assign b = 0;
assign c = 0;
assign d = 0;
assign e = 0;
assign f = 1;
assign g = 0;
end
else if(x == 4'b1110)
begin
assign a = 0;
assign b = 1;
assign c = 1;
assign d = 0;
assign e = 0;
assign f = 0;
assign g = 0;
end
else if(x == 4'b1111)
begin
assign a = 0;
assign b = 1;
assign c = 1;
assign d = 1;
assign e = 0;
assign f = 0;
assign g = 0;
end

end
endmodule
