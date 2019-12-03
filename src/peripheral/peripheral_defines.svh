`ifndef PERIPHERAL_DEFINES_SVH
`define PERIPHERAL_DEFINES_SVH

`include "defines.svh"

typedef logic[3:0] Sram_Mask_t;

typedef logic[19:0] Ram_addr_t;
typedef logic[22:0] Flash_addr_t;
typedef logic[18:0] Vga_addr_t;

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

`define VGA_TEXT_FIELD          7:0
`define VGA_FG_COLOR_FIELD      15:8
`define VGA_BG_COLOR_FIELD      23:16
`define VGA_COLOR_FIELD         23:8

`define VGA_FG_RED              7:5
`define VGA_FG_GREEN            4:2
`define VGA_FG_BLUE             1:0
`define VGA_BG_RED              15:13
`define VGA_BG_GREEN            12:10
`define VGA_BG_BLUE             9:8


`define VGA_RED                 7:5
`define VGA_GREEN               4:2
`define VGA_BLUE                1:0


//graphics
typedef logic[0:127] Ascii_data_t;
typedef logic[11:0] Graphics_block_addr_t;
typedef logic[9:0] Block_bit_addr_t;
typedef logic[15:0] Color_t;

//serial
typedef logic[1:0]  Serial_mode_t;

//vga
typedef logic[2:0]  Vga_red_t;
typedef logic[2:0]  Vga_green_t;
typedef logic[1:0]  Vga_blue_t;


//generate waiting state
`define WAIT_STATE(CUR_STATE, NAME, A, B) \
    NAME``_``A: begin \
        CUR_STATE <= NAME``_``B; \
    end

`define WAIT_4_STATES(CUR_STATE, NAME) \
    `WAIT_STATE(CUR_STATE, NAME, 0, 1) \
    `WAIT_STATE(CUR_STATE, NAME, 1, 2) \
    `WAIT_STATE(CUR_STATE, NAME, 2, 3) 

`define WAIT_2_STATES(CUR_STATE, NAME) \
    `WAIT_STATE(CUR_STATE, NAME, 0, 1) 


`define FLASH_WAIT_CYCLE 2
`define FLASH_WAIT_STATES(CUR_STATE, NAME) `WAIT_2_STATES(CUR_STATE, NAME)
`define FLASH_LAST_WAIT_STATE(NAME) NAME``_``1

`define USB_WAIT_CYCLE 4
`define USB_WAIT_STATES(CUR_STATE, NAME) `WAIT_4_STATES(CUR_STATE, NAME)
`define USB_LAST_WAIT_STATE(NAME) NAME``_``3

`endif