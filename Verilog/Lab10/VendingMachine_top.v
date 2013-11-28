`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:44 11/17/2013 
// Design Name: 
// Module Name:    VendingMachine_top 
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
module VendingMachine_top(
    input clk50, 
	 input reset,
	 input [3:0] productSelect,
	 input [2:0] coin,
	 output clk,
	 output wire dispense,
	 output wire [11:0] moneyBCD,
	 output wire [11:0] changeBCD,
	 output wire [5:0] product
	 );

wire [5:0] change;
wire [5:0] money;
HexToBCD moneyB(clk, reset, money*5, moneyBCD);
HexToBCD changeB(clk, reset, change*5, changeBCD);
VendingMachine vendingM(clk50, reset, productSelect, coin, clk, dispense, change, money, product);
endmodule
