`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:33 11/03/2013 
// Design Name: 
// Module Name:    ripple_carry_REAL 
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
module ripple_carry_REAL(
    input a1,
    input a2,
    input a3,
    input a4,
    input b1,
    input b2,
    input b3,
    input b4,
    output s1,
	 output s2,
	 output s3,
	 output s4,
	 output cout
    );
	 
	 wire c1out;
	 wire c2out;
	 wire c3out;


	 
	 assign s1 = a1^b1;
	 assign c1out = a1&b1;
	 assign s2 = a2^b2^c1out;
	 assign c2out = (a2&b2)|(c1out&(a2^b2));
	 assign s3 = a3^b3^c2out;
	 assign c3out = (a3&b3)|(c2out&(a3^b3));
	 assign s4 = a4^b4^c3out;
	 assign cout = (a4&b4)|(c3out&(a4^b4));

endmodule
