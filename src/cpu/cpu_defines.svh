`ifndef CPU_DEFINES_SVH
`define CPU_DEFINES_SVH

`include "defines.svh"

`define PC_RESET_ADDR 32'b0


//instruction
`define OPCODE_WIDTH        6
`define OPCODE_BUS          `OPCODE_WIDTH - 1:0
typedef logic[`OPCODE_BUS]  Opcode_t;      

//inside instruction
`define SA_WIDTH                6   
typedef logic[`SA_WIDTH - 1:0]  Sa_t;

`define ADDR_IN_INST                26
typedef logic[`ADDR_IN_INST - 1:0]  Addr_in_inst_t;

//operator
typedef enum {
    OP_NOP, OP_SSNOP,
    OP_AND, OP_OR, OP_XOR, OP_NOR,
    OP_ANDI, OP_ORI, OP_XORI, OP_LUI,
    OP_SLL, OP_SRA, OP_SRL,
    OP_SLLV, OP_SRAV, OP_SRLV
} Oper_t;

`define OPER_TYPE_I OP_ANDI, OP_ORI, OP_XORI, OP_LUI
`define OPER_TYPE_J NONE
`define OPER_TYPE_R_0 OP_AND, OP_OR, OP_XOR, OP_NOR, OP_SLLV, OP_SRAV, OP_SRLV
`define OPER_TYPE_R_1 OP_SLL, OP_SRA, OP_SRL


//opcode
`define OPCODE_SPEC 6'b000000
`define OPCODE_ANDI 6'b001100
`define OPCODE_ORI  6'b001101
`define OPCODE_XORI 6'b001110
`define OPCODE_LUI  6'b001111


//spec_opcode
`define SEPC_OPCODE_AND  6'b100100
`define SEPC_OPCODE_OR   6'b100101
`define SEPC_OPCODE_XOR  6'b100110
`define SEPC_OPCODE_NOR  6'b100111
`define SEPC_OPCODE_SLL  6'b000000
`define SEPC_OPCODE_SRL  6'b000010
`define SEPC_OPCODE_SRA  6'b000011
`define SEPC_OPCODE_SLLV 6'b000100
`define SEPC_OPCODE_SRLV 6'b000110
`define SEPC_OPCODE_SRAV 6'b000111


`endif
