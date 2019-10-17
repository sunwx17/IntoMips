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
    OP_SLLV, OP_SRAV, OP_SRLV,
    OP_MOVN, OP_MOVZ, OP_MFHI, OP_MFLO, OP_MTHI, OP_MTLO,
    OP_ADD, OP_ADDU, OP_ADDI ,OP_ADDIU, OP_SUB, OP_SUBU,
    OP_SLT, OP_SLTU, OP_SLTI, OP_SLTIU,
    OP_CLO, OP_CLZ,
    OP_MUL, OP_MULT, OP_MULTU
} Oper_t;

`define OPER_TYPE_I_U OP_ANDI, OP_ORI, OP_XORI, OP_LUI
`define OPER_TYPE_I_S OP_ADDI, OP_ADDIU, OP_SLTI, OP_SLTIU
`define OPER_TYPE_J
`define OPER_TYPE_R_0 OP_AND, OP_OR, OP_XOR, OP_NOR, OP_SLLV, OP_SRAV, OP_SRLV, OP_MOVN, OP_MOVZ, OP_MFHI, OP_MFLO, OP_MTHI, OP_MTLO, OP_ADD, OP_ADDU, OP_SUB, OP_SUBU, OP_SLT, OP_SLTU, OP_CLO, OP_CLZ, OP_MUL, OP_MULT, OP_MULTU
`define OPER_TYPE_R_1 OP_SLL, OP_SRA, OP_SRL

`define NEED_WRITE_HILO(op) (op == OP_MTHI || op == OP_MTLO || op == OP_MULT ||op == OP_MULTU) 




//opcode
`define OPCODE_SPEC  6'b000000
`define OPCODE_SPEC2 6'b011100

`define OPCODE_ANDI 6'b001100
`define OPCODE_ORI  6'b001101
`define OPCODE_XORI 6'b001110
`define OPCODE_LUI  6'b001111

`define OPCODE_ADDI  6'b001000
`define OPCODE_ADDIU 6'b001001
`define OPCODE_SLTI  6'b001010
`define OPCODE_SLTIU 6'b001011


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

`define SEPC_OPCODE_MOVN 6'b001011
`define SEPC_OPCODE_MOVZ 6'b001010
`define SEPC_OPCODE_MFHI 6'b010000
`define SEPC_OPCODE_MFLO 6'b010010
`define SEPC_OPCODE_MTHI 6'b010001
`define SEPC_OPCODE_MTLO 6'b010011

`define SEPC_OPCODE_ADD  6'b100000
`define SEPC_OPCODE_ADDU 6'b100001
`define SEPC_OPCODE_SUB  6'b100010
`define SEPC_OPCODE_SUBU 6'b100011
`define SEPC_OPCODE_SLT  6'b101010
`define SEPC_OPCODE_SLTU 6'b101011

`define SEPC_OPCODE_MULT  6'b011000
`define SEPC_OPCODE_MULTU 6'b011001

//spec2
`define SPEC2_OPCODE_CLZ 6'b100000
`define SPEC2_OPCODE_CLO 6'b100001

`define SPEC2_OPCODE_MUL 6'b000010




`endif
