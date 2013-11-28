`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:55:43 11/16/2013
// Design Name:   VendingMachine
// Module Name:   C:/Users/Paula/Google Drive/Xilinx/Lab10/VendingMaching_tb3.v
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

module VendingMaching_tb3;

	// Inputs
	reg clk50;
	reg reset;
	reg [3:0] productSelect;
	reg [2:0] coin;

	// Outputs
	wire clk;
	wire dispense;
	wire [5:0] change;
	wire [5:0] money;

	// Instantiate the Unit Under Test (UUT)
	VendingMachine uut (.clk50(clk50), .reset(reset), .productSelect(productSelect), .coin(coin),
		.clk(clk), .dispense(dispense), .change(change), 	.money(money)
	);

	initial begin
		// Initialize Inputs
		productSelect = 0;
		coin = 0;
		clk50 = 0;
		reset = 1;
		
		#400;
		reset = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		coin = 3'b010;
		#5
		coin = 0;
		#100 $display("Input dime, dispense is %d, amount is %d", dispense, money*5);
		
		coin = 3'b001;

		#5 coin = 0;
		#100 $display("Input nickel, dispense is %d, amount is %d", dispense, money*5);
		
		coin = 3'b100;
		#5 coin = 0;
		#100 $display("Input quarter, dispense is %d, amount is %d", dispense, money*5);
		
		productSelect = 1;
		#100 $display("Product 1 Selected, dispense is %d, change is %d, amount is %d", dispense, change*5, money*5);
		///
		productSelect = 0;
		#100
		coin = 3'b100;
		#10
		coin = 0;
		#100 $display("Input quarter, dispense is %d, amount is %d", dispense, money*5);
		
		coin = 3'b100;
		
		#10 coin = 0;
		#105 $display("Input quarter, dispense is %d, amount is %d", dispense, money*5);
		
		
		coin = 3'b100;
		#10 coin = 0;
		#105 $display("Input quarter, dispense is %d, amount is %d", dispense, money*5);
		
		
		
		productSelect = 1;
		#105 $display("Product 1 Selected, dispense is %d, change is %d, amount is %d", dispense, change*5, money*5);
		
		///
		
				productSelect = 0;
		#100
		coin = 3'b100;
		#5
		coin = 0;
		#100 $display("Input quarter, dispense is %d, amount is %d", dispense, money*5);
		
		coin = 3'b100;
		
		#5 coin = 0;
		#100 $display("Input quarter, dispense is %d, amount is %d", dispense, money*5);
		
		
		coin = 3'b100;
		#5 coin = 0;
		#100 $display("Input quarter, dispense is %d, amount is %d", dispense, money*5);
		
		productSelect = 4'b0010;
		#100 $display("Product 2 Selected, dispense is %d, change is %d, amount is %d", dispense, change*5, money*5);
		end
      
	always begin
		#5 clk50 = ~clk50;
	end
      
endmodule

