// Verilog test fixture created from schematic F:\lab7prelab\ripple_carry_adder.sch - Sun Nov 03 18:08:14 2013

`timescale 1ns / 1ps

module ripple_carry_adder_ripple_carry_adder_sch_tb();

// Inputs
   reg a1;
   reg b1;
   reg a2;
   reg b2;
   reg a3;
   reg b3;
   reg a4;
   reg b4;

// Output
   wire s4;
   wire s3;
   wire s2;
   wire s1;

// Bidirs

// Instantiate the UUT
   ripple_carry_adder UUT (
		.a1(a1), 
		.b1(b1), 
		.a2(a2), 
		.b2(b2), 
		.a3(a3), 
		.b3(b3), 
		.a4(a4), 
		.b4(b4), 
		.s4(s4), 
		.s3(s3), 
		.s2(s2), 
		.s1(s1)
   );
// Initialize Inputs

initial begin
		a1 = 0;
		b1 = 0;
		a2 = 0;
		b2 = 0;
		a3 = 0;
		b3 = 0;
		a4 = 0;
		b4 = 0;
		#50;
		a1 = 1;
		b1 = 0;
		a2 = 0;
		b2 = 0;
		a3 = 0;
		b3 = 0;
		a4 = 0;
		b4 = 0;
		#50;
		a1 = 1;
		b1 = 1;
		a2 = 0;
		b2 = 0;
		a3 = 0;
		b3 = 0;
		a4 = 0;
		b4 = 0;
		#50;
		a1 = 0;
		b1 = 0;
		a2 = 1;
		b2 = 0;
		a3 = 0;
		b3 = 0;
		a4 = 0;
		b4 = 0;
		#50;
		a1 = 1;
		b1 = 0;
		a2 = 1;
		b2 = 1;
		a3 = 0;
		b3 = 0;
		a4 = 0;
		b4 = 0;
		#50;
		a1 = 1;
		b1 = 1;
		a2 = 1;
		b2 = 1;
		a3 = 1;
		b3 = 1;
		a4 = 1;
		b4 = 1;
		#50;
		a1 = 1;
		b1 = 0;
		a2 = 1;
		b2 = 0;
		a3 = 0;
		b3 = 1;
		a4 = 0;
		b4 = 1;
		#50;
		a1 = 1;
		b1 = 1;
		a2 = 1;
		b2 = 1;
		a3 = 0;
		b3 = 0;
		a4 = 0;
		b4 = 0;
		#50;
		a1 = 0;
		b1 = 0;
		a2 = 0;
		b2 = 0;
		a3 = 1;
		b3 = 1;
		a4 = 1;
		b4 = 1;
		#50;
		a1 = 1;
		b1 = 0;
		a2 = 1;
		b2 = 0;
		a3 = 1;
		b3 = 1;
		a4 = 1;
		b4 = 1;
		#50;
		a1 = 0;
		b1 = 0;
		a2 = 0;
		b2 = 0;
		a3 = 0;
		b3 = 0;
		a4 = 0;
		b4 = 0;
		#50;	
		end
endmodule
