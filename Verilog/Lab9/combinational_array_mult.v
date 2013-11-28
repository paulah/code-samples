`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:56 11/10/2013 
// Design Name: 
// Module Name:    combinational_array_mult 
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
module combinational_array_mult(
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


wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12;
wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;
wire sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7;



combinational_array_block h1(A0, B0, 0, 0, sum0, c1);
combinational_array_block h2(A1, B0, 0, 0, s2, c2);
combinational_array_block G1(A0, B1, s2, c1, sum1, c5);
combinational_array_block h3(A2, B0, 0, 0, s3, c3);
combinational_array_block G2(A1, B1, s3, c2, s6, c6);
combinational_array_block G4(A0, B2, s6, c5, sum2, c9);
combinational_array_block h4(A3, B0, 0, 0, s4, c4); 
combinational_array_block G3(A2, B1, s4, c3, s7, c7);
combinational_array_block G5(A1, B2, s7, c6, s10, c10);
combinational_array_block G7(A0, B3, s10, c9, sum3, c13);
combinational_array_block f1(A3, B1, c13, c4, s8, c8);
combinational_array_block G6(A2, B2, s8, c7, s11, c11);
combinational_array_block G8(A1, B3, s11, c10, sum4, c14);
combinational_array_block f2(A3, B2, c14, c8, s12, c12);
combinational_array_block G9(A2, B3, s12, c11, sum5, c15);
combinational_array_block f3(A3, B3, c15, c12, sum6, sum7);


assign S0 = sum0;
assign S1 = sum1;
assign S2 = sum2;
assign S3 = sum3;
assign S4 = sum4;
assign S5 = sum5;
assign S6 = sum6;
assign S7 = sum7;
endmodule
