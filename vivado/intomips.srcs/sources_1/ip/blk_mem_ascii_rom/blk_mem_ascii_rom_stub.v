// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Sat Nov 23 18:15:42 2019
// Host        : monell-ubuntu running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top blk_mem_ascii_rom -prefix
//               blk_mem_ascii_rom_ blk_mem_ascii_rom_stub.v
// Design      : blk_mem_ascii_rom
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module blk_mem_ascii_rom(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[6:0],douta[127:0]" */;
  input clka;
  input [6:0]addra;
  output [127:0]douta;
endmodule
