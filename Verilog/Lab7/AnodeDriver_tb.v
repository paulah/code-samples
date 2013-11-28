`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:38:31 10/27/2013
// Design Name:   AnodeDriver
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab7/AnodeDriver_tb.v
// Project Name:  Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AnodeDriver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AnodeDriver_tb;

	// Inputs
	reg clock;
	reg reset;
	wire [3:0] anode_select;
	wire [1:0] mux_select;

	// Instantiate the Unit Under Test (UUT)
	AnodeDriver uut (
		.clock(clock), 
		.reset(reset), 
		.anode_select(anode_select), 
		.mux_select(mux_select)
	);
integer i = 0;
	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;
		#30;
		reset = 0;

		for(i = 0; i < 20; i=i+1) begin
			#10 $display("mux_select=%b%b, anode_select=%b%b%b%b", mux_select[0], mux_select[1], 
			anode_select[0], anode_select[1], anode_select[2], anode_select[3]);
		end
		#10

		#30
		$display("mux_select=%b%b", mux_select[0], mux_select[1]);
	end
   always begin
		#10 clock = ~clock;
	end
endmodule

