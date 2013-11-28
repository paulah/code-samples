// Verilog test fixture created from schematic C:\Users\Paula\Google Drive\Xilinx\Lab6\mux41_4bit1.sch - Mon Oct 21 00:02:47 2013

`timescale 1ns / 1ps

module mux41_4bit1_mux41_4bit1_sch_tb();

// Inputs
   reg s1;
   reg [3:0] a;
   reg [3:0] b;
   reg [3:0] c;
   reg [3:0] d;
   reg s0;

// Output
   wire [3:0] y;

// Bidirs

// Instantiate the UUT
   mux41_4bit1 UUT (
		.s1(s1), 
		.y(y), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.s0(s0)
   );
	
	integer i=0;
	integer j=0;
	initial begin
	
	a = 0;
	b = 0;
	c = 0;
	d = 0;
	#10 $display("Starting test");
	
	for(i=0; i<=65535; i=i+1)
		begin
			{a,b,c,d} = i;
			{s1,s0} = 0;
			#10 $display("s=%b%b, a=%b, b=%b, c=%b, d=%b, y=%b", s1,s0,a,b,c,d,y);
			if(y != a)
				$display("Error, y should be %b, is $b", a, y);
			
			{a,b,c,d} = i;
			{s1,s0} = 1;
			#10 $display("s=%b%b, a=%b, b=%b, c=%b, d=%b, y=%b", s1,s0,a,b,c,d,y);
			if(y != b)
				$display("Error, y should be %b, is $b", b, y);
				
			{a,b,c,d} = i;
			{s1,s0} = 2;
			#10 $display("s=%b%b, a=%b, b=%b, c=%b, d=%b, y=%b", s1,s0,a,b,c,d,y);
			if(y != c)
				$display("Error, y should be %b, is $b", c, y);
				
			{a,b,c,d} = i;
			{s1,s0} = 3;
			#10 $display("s=%b%b, a=%b, b=%b, c=%b, d=%b, y=%b", s1,s0,a,b,c,d,y);
			if(y != d)
				$display("Error, y should be %b, is $b", d, y);
		end
	end
endmodule
