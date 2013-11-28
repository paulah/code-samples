// Verilog test fixture created from schematic C:\Users\Paula\Google Drive\Xilinx\Lab5\fulladder.sch - Sun Oct 13 16:48:38 2013

`timescale 1ns / 1ps

module fulladder_fulladder_sch_tb();

// Inputs
   reg A;
   reg B;
   reg Cin;

// Output
   wire Cout;
   wire S;

// Bidirs

// Instantiate the UUT
   fulladder UUT (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.Cout(Cout), 
		.S(S)
   );
// Initialize Inputs
   
	integer i=0;
		initial begin
		A = 0;
		B = 0;
		Cin=0;
		#10 $display("Starting test");

		for(i=0; i<8; i=i+1)
		begin
			{Cin,A,B} = i; //set the inputs
			#10 $display("Cin A B =%b%b%b, {Cout,S}=%b%b", Cin,A,B,Cout,S);
			if({Cout,S}!=(Cin+A+B))
			$display("Error, {Cout,S} should be %b, is $b", (A+B+Cin), {Cout,S});
		end
	end 
	
endmodule
