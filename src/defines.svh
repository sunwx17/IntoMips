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

//ram data format
typedef logic[19:0] Ram_addr_t;

`define ZERO_BIT    1'b0
`define ZERO_BYTE   8'h0
`define ZERO_HWORD  16'h0
`define ZERO_WORD   32'h0
`define ZERO_DWORD  64'h0

`define HIGH_WORD   32'bZ


//instruction
`define INST_WIDTH          32
`define INST_BUS            `INST_WIDTH - 1:0
typedef logic[`INST_BUS]    Inst_t;

`define INST_ADDR_WIDTH         32
`define INST_ADDR_BUS           `INST_ADDR_WIDTH - 1:0
typedef logic[`INST_ADDR_BUS]   Inst_addr_t;

`define INST_BYTE_NUM  4


//register
`define REG_ADDR_BUS       4:0
`define REG_WIDTH           32
`define REG_BUS             31:0
`define REG_NUM             32
`define REG_NUM_LOG2        5



`endif