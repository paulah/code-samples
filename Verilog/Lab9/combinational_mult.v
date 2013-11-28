`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:16 11/10/2013 
// Design Name: 
// Module Name:    combinational_mult 
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
module combinational_mult(
    input A3,
    input A2,
    input A1,
    input A0,
    input B3,
    input B2,
    input B1,
    input B0,
    output S0,
    output S1,
    output S2,
    output S3,
    output S4,
    output S5,
    output S6,
	 output S7
    );

wire sum1, sum2, sum3, sum4, sum5, sum6, sum7;

assign S0=A0&B0;


wire A1B0, A0B1, A1B0A0B1c;
assign A1B0 = A1&B0;
assign A0B1 = A0&B1;
half_adder h1(A1B0, A0B1, sum1, A1B0A0B1c);


wire A0B2, A1B1, A2B0, sumA0B2A1B1, A0B2A1B1c, S2c;
assign A0B2 = A0&B2;
assign A1B1 = A1&B1;
assign A2B0 = A2&B0;
half_adder h2(A0B2, A1B1, sumA0B2A1B1, A0B2A1B1c);
full_adder f1(sumA0B2A1B1, A2B0, A1B0A0B1c, sum2, S2c);


wire A0B3, A1B2, A2B1, A3B0, sumA0B3A1B2, A0B3A1B2c, s1, c1, c2;
assign A0B3 = A0&B3;
assign A1B2 = A1&B2;
assign A2B1 = A2&B1;
assign A3B0 = A3&B0;
half_adder h3(A0B3, A1B2, sumA0B3A1B2, A0B3A1B2c);
full_adder f2(sumA0B3A1B2, A2B1, A0B2A1B1c, s1, c1);
full_adder f3(A3B0, s1, S2c, sum3, c2);


wire A1B3, A2B2, A3B1, s3, c3, s4, c4, c5;
assign A1B3 = A1&B3;
assign A2B2 = A2&B2;
assign A3B1 = A3&B1;
full_adder f4(A1B3, A2B2, A0B3A1B2c, s3, c3);
full_adder f5(A3B1, s3, c1, s4, c4);
half_adder h4(s4, c2, sum4, c5);


wire A2B3, A3B2, s6, c6, c7;
assign A2B3 = A2&B3;
assign A3B2 = A3&B2;
full_adder f6(A2B3, A3B2, c3, s6, c6);
full_adder f7(s6, c4, c5, sum5, c7);


wire A3B3;
assign A3B3 = A3&B3;
full_adder f8(A3B3, c6, c7, sum6, sum7);


assign S1 = sum1;
assign S2 = sum2;
assign S3 = sum3;
assign S4 = sum4;
assign S5 = sum5;
assign S6 = sum6;
assign S7 = sum7;

endmodule
