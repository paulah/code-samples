`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:55:22 11/15/2013 
// Design Name: 
// Module Name:    VendingMachine 
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
module VendingMachine(
    input clk50, 
	 input reset,
	 input [3:0] productSelect,
	 input [2:0] coin,
	 output clk,
	 output reg dispense,
	 output reg [5:0] change,
	 output reg [5:0] money,
	 output wire [5:0] product
	 );

wire [5:0] result;
wire [5:0] coinValue;
reg [5:0] nextState;

reg dispenseT;
reg [5:0] changeT;


Clock1Hz myClock (.clk50(clk50), .reset(reset), .clk(clk));
productCost productC (productSelect, product);
coinValue coinV (coin, coinValue);

always @ (coinValue, product, money, dispense, change) begin	
	if(money == 0) begin
		nextState <= nextState+ money + coinValue;
	end
	else begin
		if(productSelect == 0) begin
				if(money < 20) begin
					nextState <= nextState + coinValue;
					changeT <= 0;
					dispenseT <= 0;
				end
			end
		else begin
			if(money >= product) begin
				dispenseT <= 1;
				changeT <= money - product;
				nextState <= ~money + 1;
			end
			else begin
				dispenseT <= 0;
				changeT <= money;
				nextState <= ~money + 1;
			end
		end
	end
end

always @ (negedge clk) begin
	if(reset) begin
		money <= 0;
		change <= 0;
		dispense <= 0;
	end
	else begin
		dispense <= dispenseT;
		money <= nextState + money;
		change <= changeT;
	end
end

endmodule
