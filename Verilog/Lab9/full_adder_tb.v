`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:55:25 11/03/2013
// Design Name:   full_adder
// Module Name:   F:/lab7prelab/full_adder_tb.v
// Project Name:  lab7prelab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_adder_tb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;
		#50;
		a = 0;
		b = 0;
		cin = 1;
		#50;
      a = 0;
		b = 1;
		cin = 0;
		#50;
      a = 0;
		b = 1;
		cin = 1;
		#50;
      a = 1;
		b = 0;
		cin = 0;
		#50;
      a = 1;
		b = 0;
		cin = 1;
		#50;
      a = 1;
		b = 1;
		cin = 0;
		#50;
      a = 1;
		b = 1;
		cin = 1;
		#50;
		a = 0;
		b = 0;
		cin = 0;
		#50;
      
      
        
		// Add stimulus here

	end
      
endmodule

