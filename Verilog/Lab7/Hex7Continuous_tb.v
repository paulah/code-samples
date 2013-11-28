`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:50:15 10/26/2013
// Design Name:   Hex7Continuous
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab7/Hex7Continuous_tb.v
// Project Name:  Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Hex7Continuous
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Hex7Continuous_tb;

	// Inputs
	reg [3:0] x;

	// Outputs
	wire [6:0] y;

	// Instantiate the Unit Under Test (UUT)
	Hex7Continuous uut (
		.x(x), 
		.y(y)
	);

	integer i=0;
	initial begin
	x = 0;
	#10 $display("Starting test");
	
	for(i=0; i<16; i=i+1)
		begin
			x = i; //set the inputs
			#10 $display("x=%b%b%b%b, y=%b%b%b%b%b%b%b", x[3],x[2],x[1],x[0], y[0],y[1],y[2],y[3],y[4],y[5],y[6]);
			//if(y != a)
			//	$display("Error, y should be %b, is $b", a, y);
		end
	end
      
endmodule

