`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:08 11/18/2013 
// Design Name: 
// Module Name:    get_balance 
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
module get_balance(
	 input [3:0] switches,
	 input [6:0] cost,
	 input clk, 
	 input reset,
	 input [2:0] coin,
	 output reg [6:0] money,
	 output reg dispense
    );
	 
	 wire [6:0] coinValue;
	 reg [6:0] nextState;
	 wire newClock;
	 reg dispenseT;
	 
	Clock1Hz clock1hz(clk, reset, newClock);
	coinValue coinV (coin, coinValue);
	
	always @ (coinValue, cost) begin
		if (switches) begin
			if (dispense == 0) begin
				if (money >= cost) begin
					dispenseT <= 1;
					nextState <= money-cost;
				end
				else begin
					nextState <= money;
					dispenseT <= 0;
				end
			end
			else begin
				dispenseT <= 0;
			end
		end
		else begin
			dispenseT <= 0;
			if ((money + coinValue) <= 95) begin
				nextState <= money + coinValue;
			end
			else begin
				nextState <= money;
			end
		end
	end
	
	always @ (posedge newClock) begin
		if(reset) begin
			money <= 0;	
			dispense <= 0;
		end
		else begin
			money <= nextState;
			dispense <= dispenseT;
		end
	end

endmodule
