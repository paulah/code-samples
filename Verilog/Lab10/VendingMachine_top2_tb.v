`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:34:50 11/17/2013
// Design Name:   VendingMachine_top2
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab10/VendingMachine_top2_tb.v
// Project Name:  Lab10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VendingMachine_top2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VendingMachine_top2_tb;

	// Inputs
	reg clk50;
	reg reset;
	reg [3:0] productSelect;
	reg [2:0] coin;

	// Outputs
	wire clk;
	wire dispense;
	wire [11:0] moneyBCD;
	wire [11:0] changeBCD;
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;
	wire [3:0] anode_sig;
	wire [14:0] counter;

	// Instantiate the Unit Under Test (UUT)
	VendingMachine_top2 uut (
		.clk50(clk50), 
		.reset(reset), 
		.productSelect(productSelect), 
		.coin(coin), 
		.clk(clk), 
		.dispense(dispense), 
		.moneyBCD(moneyBCD), 
		.changeBCD(changeBCD), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.anode_sig(anode_sig),
		.counter(counter)
	);

	initial begin
		// Initialize Inputs
		clk50 = 0;
		reset = 1;
		#100;
		reset = 0;
		productSelect = 0;
		coin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   
	always begin
		#5 clk50 = ~clk50;
	end
	
endmodule

