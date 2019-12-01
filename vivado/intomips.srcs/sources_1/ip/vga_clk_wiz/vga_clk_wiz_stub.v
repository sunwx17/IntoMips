// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Sun Dec  1 18:31:48 2019
// Host        : monell-ubuntu running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/monell/code/IntoMips/vivado/intomips.srcs/sources_1/ip/vga_clk_wiz/vga_clk_wiz_stub.v
// Design      : vga_clk_wiz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module vga_clk_wiz(clk_100M_out, locked, clk_50M_in)
/* synthesis syn_black_box black_box_pad_pin="clk_100M_out,locked,clk_50M_in" */;
  output clk_100M_out;
  output locked;
  input clk_50M_in;
endmodule
