-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Sun Dec  1 18:31:49 2019
-- Host        : monell-ubuntu running 64-bit Ubuntu 18.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/monell/code/IntoMips/vivado/intomips.srcs/sources_1/ip/vga_clk_wiz/vga_clk_wiz_stub.vhdl
-- Design      : vga_clk_wiz
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg676-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_clk_wiz is
  Port ( 
    clk_100M_out : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_50M_in : in STD_LOGIC
  );

end vga_clk_wiz;

architecture stub of vga_clk_wiz is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_100M_out,locked,clk_50M_in";
begin
end;
