`include "cpu_defines.svh"


module id(
    input                   rst,
    input   Inst_addr_t     pc,
    input   Inst_t          inst,
    input   Reg_data_t      reg1_data_i,
    input   Reg_data_t      reg2_data_i,
    
    output  Bit_t       reg1_read_o,
    output  Bit_t       reg2_read_o,
    output  Reg_addr_t  reg1_addr_o,
    output  Reg_addr_t  reg2_addr_o,

    output  Oper_t      oper_o,
    output  Word_t      reg1_o,
    output  Word_t      reg2_o,
    output  Bit_t       wreg_write_o,
    output  Reg_addr_t  wreg_addr_o


);

Opcode_t    opcode;
Reg_addr_t  rs;
Reg_addr_t  rt;
Halfword_t  imm;

assign opcode = inst[31:26];
assign rs     = inst[25:21];
assign rt     = inst[20:16];
assign rd     = inst[15:11];
assign imm    = inst[15:0];

always @ (*)
    if (rst = `ENABLE) begin
        reg1_read_o <= `DISABLE;
        reg2_read_o <= `DISABLE;
        reg1_addr_o <= `REG_ZERO;
        reg2_addr_o <= `REG_ZERO;
        
        oper_o <= OP_NOP;
        reg1_o <= `ZERO_WORD;
        reg2_o <= `ZERO_WORD;
        wreg_write_o <= `DISABLE;
        wreg_addr_o  <= `REG_ZERO;
    end else begin
        reg1_read_o <= `DISABLE;
        reg2_read_o <= `DISABLE;
        reg1_addr_o <= rs;
        reg2_addr_o <= rt;
        
        oper_o <= OP_NOP;
        reg1_o <= `ZERO_WORD;
        reg2_o <= `ZERO_WORD;
        wreg_write_o <= `DISABLE;
        wreg_addr_o  <= rd;

        case (opcode)
            `OPCODE_ORI: begin
                wreg_write_o <= `ENABLE;
            end



    
endmodule