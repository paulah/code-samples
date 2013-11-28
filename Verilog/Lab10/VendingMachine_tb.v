`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:52:25 11/16/2013
// Design Name:   VendingMachine
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab10/VendingMachine_tb.v
// Project Name:  Lab10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VendingMachine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VendingMachine_tb;

	// Inputs
	reg clk50;
	reg reset;
	reg [3:0] product;
	reg [2:0] coin;

	// Outputs
	wire clk;
	wire dispense;

	// Instantiate the Unit Under Test (UUT)
	VendingMachine uut (
		.clk50(clk50), 
		.reset(reset), 
		.product(product), 
		.coin(coin), 
		.clk(clk), 
		.dispense(dispense)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		#30;
		reset = 0;
		clk50 = 0;
		product = 0;
		coin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		coin = 2;
		#10
		coin = 0;
		//#100 $display("Input dime, 
		

	end
   
	always begin
		#10 clk50 = ~clk50;
	end
endmodule

