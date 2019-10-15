`ifndef CPU_DEFINES_SVH
`define CPU_DEFINES_SVH

`include "defines.svh"

`define PC_RESET_ADDR 32'b0


//instruction
`define OPCODE_WIDTH        6
`define OPCODE_BUS          `OPCODE_WIDTH - 1:0
typedef logic[`OPCODE_BUS]  Opcode_t;      

//operator
typedef enum {
    OP_NOP,
    OP_ORI
} Oper_t;

`define OPCODE_ORI  6'b001101




`endif
