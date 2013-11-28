`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:35:05 11/16/2013
// Design Name:   VendingMachine
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab10/VendingMachine_tb2.v
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

module VendingMachine_tb2;

	// Inputs
	reg clk50;
	reg reset;
	reg [3:0] product;
	reg [2:0] coin;

	// Outputs
	wire clk;
	wire dispense;
	wire [3:0] change;
	wire [5:0] money;

	// Instantiate the Unit Under Test (UUT)
	VendingMachine uut (
		.clk50(clk50), 
		.reset(reset), 
		.product(product), 
		.coin(coin), 
		.clk(clk), 
		.dispense(dispense), 
		.change(change),
		.money(money)
	);

	initial begin
		// Initialize Inputs
		clk50 = 0;
		reset = 1;
		#5000;
		reset = 0;
		product = 0;
		coin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		coin = 2;
		#50
		coin = 0;
		#100 $display("Input dime, dispense is %d, amount is %d", dispense, money);
		end
      
	always begin
		#10 clk50 = ~clk50;
	end
endmodule

