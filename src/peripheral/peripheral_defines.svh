`ifndef PERIPHERAL_DEFINES_SVH
`define PERIPHERAL_DEFINES_SVH

`include "define.svh"

typedef logic[19:0] Ram_addr_t;
typedef logic[22:0] Flash_addr_t;
typedef logic[18:0] Vga_addr_t

//vga
`define VGA_HSIZE   800
`define VGA_HMAX    1040
`define VGA_VSIZE   600
`define VGA_VMAX    666
`define VGA_HFP     856
`define VGA_HSP     976 
`define VGA_VFP     637
`define VGA_VSP     643
`define VGA_NORMAL_HSIZE        800
`define VGA_NORMAL_VSIZE        592
`define VGA_BLOCK_HSIZE         8
`define VGA_BLOCK_VSIZE         16
`define VGA_BLOCK_HNUM          100
`define VGA_BLOCK_VNUM          37

//graphics
typedef logic[0:127] Ascii_data_t;
typedef logic[11:0] Graphics_block_addr_t;
typedef logic[9:0] Block_bit_addr_t;

//serial
typedef logic[1:0]  Serial_mode_t;


`endif