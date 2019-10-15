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
Reg_addr_t  rd;
Halfword_t  imm;

assign opcode = inst[31:26];
assign rs     = inst[25:21];
assign rt     = inst[20:16];
assign rd     = inst[15:11];
assign imm    = inst[15:0];

always @ (*) begin
    if (rst == `ENABLE) begin
        oper_o <= OP_NOP;
        wreg_write_o <= `DISABLE;
        wreg_addr_o  <= `REG_ZERO;

        reg1_read_o <= `DISABLE;
        reg2_read_o <= `DISABLE;
        reg1_addr_o <= `REG_ZERO;
        reg2_addr_o <= `REG_ZERO;
    end else begin        
        oper_o <= OP_NOP;
        wreg_write_o <= `DISABLE;
        wreg_addr_o  <= rd;

        reg1_read_o <= `DISABLE;
        reg2_read_o <= `DISABLE;
        reg1_addr_o <= rs;
        reg2_addr_o <= rt;
        case (opcode)
            `OPCODE_ORI: begin
                oper_o <= OP_ORI;
                wreg_write_o <= `ENABLE;
                wreg_addr_o  <= rt;

                reg1_read_o <= `ENABLE;
                reg2_read_o <= `DISABLE;
                reg1_addr_o <= rs;
                reg2_addr_o <= `ZERO_WORD;
            end
            default:begin end
        endcase
    end
end
    
always @ (*) begin
    if (rst == `DISABLE) begin
        reg1_o <= `ZERO_WORD;
    end else if (reg1_read_o == `ENABLE) begin
        reg1_o <= reg1_data_i;
    end else if (reg1_read_o == `DISABLE) begin
        reg1_o <= imm;
    end else begin
        reg1_o <= `ZERO_WORD;
    end
end

always @ (*) begin
    if (rst == `DISABLE) begin
        reg2_o <= `ZERO_WORD;
    end else if (reg2_read_o == `ENABLE) begin
        reg2_o <= reg1_data_i;
    end else if (reg2_read_o == `DISABLE) begin
        reg2_o <= imm;
    end else begin
        reg2_o <= `ZERO_WORD;
    end
end



    
endmodule