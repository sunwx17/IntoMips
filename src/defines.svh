`ifndef DEFINES_SVH
`define DEFINES_SVH


//project configuration
`default_nettype wire
`timescale 1ns / 1ps

//Global define
`define ENABLE 1'b1
`define DISABLE 1'b0

//data format
typedef logic       Bit_t;
typedef logic[7:0]  Byte_t;
typedef logic[15:0] Halfword_t;
typedef logic[31:0] Word_t;
typedef logic[63:0] Doubleword_t;

`define ZERO_BIT    1'b0
`define ZERO_BYTE   8'h0
`define ZERO_HWORD  16'h0
`define ZERO_WORD   32'h0
`define ZERO_DWORD  64'h0

`define ONE_WORD    32'hffff

`define HIGH_WORD   32'bZ
`define HIGH_BYTE   8'bZ

//mmu
`define USE_MMU     1


//instruction
`define INST_WIDTH          32
`define INST_BUS            `INST_WIDTH - 1:0
typedef logic[`INST_BUS]    Inst_t;

`define INST_ADDR_WIDTH         32
`define INST_ADDR_BUS           `INST_ADDR_WIDTH - 1:0
typedef logic[`INST_ADDR_BUS]   Inst_addr_t;

`define INST_BYTE_NUM  4  


//register
`define REG_NUM                 32
`define REG_NUM_LOG2            5
`define REG_ADDR_BUS            `REG_NUM_LOG2 - 1:0
typedef logic[`REG_ADDR_BUS]    Reg_addr_t;
`define REG_ZERO                5'b00000

`define REG_DATA_WIDTH          32
`define REG_DATA_BUS            31:0
typedef logic[`REG_DATA_BUS]    Reg_data_t;

typedef Reg_data_t[`REG_NUM - 1:0]  Regs_t;


`define ADDR_IN_BASE(addr)          (addr >= 32'h80000000 && addr < 32'h80400000)
`define ADDR_IN_EXT(addr)           (addr >= 32'h80400000 && addr < 32'h80800000)
`define ADDR_IN_UART_DATA(addr)     (addr == 32'hBFD003F8)
`define ADDR_IN_UART_STATUS(addr)   (addr == 32'hBFD003FC)
`define ADDR_IN_VGA(addr)           (addr >= 32'hBA000000 && addr < 32'hBA000E75)
`define ADDR_IN_BOOTROM(addr)       (addr >= 32'h8fc00000 && addr < 32'h8fc04000)
`define ADDR_IN_FLASH(addr)         (addr >= 32'hBE000000 && addr < 32'hBF000000)
`define ADDR_IN_USB(addr)           (addr >= 32'hbc020000 && addr < 32'hbc020008)



`endif