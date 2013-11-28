////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.58f
//  \   \         Application: netgen
//  /   /         Filename: test_module_synthesis.v
// /___/   /\     Timestamp: Mon Oct 14 15:36:23 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim test_module.ngc test_module_synthesis.v 
// Device	: xc3s500e-5-fg320
// Input file	: test_module.ngc
// Output file	: F:\Lab5\netgen\synthesis\test_module_synthesis.v
// # of Modules	: 1
// Design Name	: test_module
// Xilinx        : C:\Xilinx\14.5\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module test_module (
  clk, rst, cout, sum, c1
);
  input clk;
  input rst;
  output cout;
  output sum;
  output [3 : 0] c1;
  wire clk_BUFGP_9;
  wire cout_OBUF_11;
  wire rst_IBUF_13;
  wire sum_OBUF_15;
  wire \theAdder/XLXN_1 ;
  wire \theAdder/XLXN_3 ;
  wire [3 : 0] Result;
  wire [3 : 0] \theCounter/count ;
  FDR   \theCounter/count_0  (
    .C(clk_BUFGP_9),
    .D(Result[0]),
    .R(rst_IBUF_13),
    .Q(\theCounter/count [0])
  );
  FDR   \theCounter/count_1  (
    .C(clk_BUFGP_9),
    .D(Result[1]),
    .R(rst_IBUF_13),
    .Q(\theCounter/count [1])
  );
  FDR   \theCounter/count_2  (
    .C(clk_BUFGP_9),
    .D(Result[2]),
    .R(rst_IBUF_13),
    .Q(\theCounter/count [2])
  );
  FDR   \theCounter/count_3  (
    .C(clk_BUFGP_9),
    .D(Result[3]),
    .R(rst_IBUF_13),
    .Q(\theCounter/count [3])
  );
  OR2   \theAdder/XLXI_4  (
    .I0(\theAdder/XLXN_3 ),
    .I1(\theAdder/XLXN_1 ),
    .O(cout_OBUF_11)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  sum1 (
    .I0(\theCounter/count [2]),
    .I1(\theCounter/count [1]),
    .I2(\theCounter/count [0]),
    .O(sum_OBUF_15)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \theCounter/Mcount_count_xor<1>11  (
    .I0(\theCounter/count [1]),
    .I1(\theCounter/count [0]),
    .O(Result[1])
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \theCounter/Mcount_count_xor<2>11  (
    .I0(\theCounter/count [2]),
    .I1(\theCounter/count [1]),
    .I2(\theCounter/count [0]),
    .O(Result[2])
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \theCounter/Mcount_count_xor<3>11  (
    .I0(\theCounter/count [3]),
    .I1(\theCounter/count [2]),
    .I2(\theCounter/count [1]),
    .I3(\theCounter/count [0]),
    .O(Result[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \theAdder/XLXI_2/Cout1  (
    .I0(\theCounter/count [1]),
    .I1(\theCounter/count [2]),
    .O(\theAdder/XLXN_1 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \theAdder/XLXN_31  (
    .I0(\theCounter/count [0]),
    .I1(\theCounter/count [1]),
    .I2(\theCounter/count [2]),
    .O(\theAdder/XLXN_3 )
  );
  IBUF   rst_IBUF (
    .I(rst),
    .O(rst_IBUF_13)
  );
  OBUF   cout_OBUF (
    .I(cout_OBUF_11),
    .O(cout)
  );
  OBUF   sum_OBUF (
    .I(sum_OBUF_15),
    .O(sum)
  );
  OBUF   c1_3_OBUF (
    .I(\theCounter/count [3]),
    .O(c1[3])
  );
  OBUF   c1_2_OBUF (
    .I(\theCounter/count [2]),
    .O(c1[2])
  );
  OBUF   c1_1_OBUF (
    .I(\theCounter/count [1]),
    .O(c1[1])
  );
  OBUF   c1_0_OBUF (
    .I(\theCounter/count [0]),
    .O(c1[0])
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_9)
  );
  INV   \theCounter/Mcount_count_xor<0>11_INV_0  (
    .I(\theCounter/count [0]),
    .O(Result[0])
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

