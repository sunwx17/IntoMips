`include "cpu_defines.svh"


module id(
    input               rst,
    input   Inst_addr_t pc,
    input   Inst_t      inst,
    input   Reg_data_t  reg1_data_i,
    input   Reg_data_t  reg2_data_i,
    
    output  Bit_t       reg1_read_o,
    output  Bit_t       reg2_read_o,
    output  Reg_addr_t  reg1_addr_o,
    output  Reg_addr_t  reg2_addr_o,

    output  Oper_t      oper_o,
    output  Word_t      reg1_o,
    output  Word_t      reg2_o,
    output  Bit_t       wreg_write_o,
    output  Reg_addr_t  wreg_addr_o,

    //below for solve data conflict
    input   Bit_t       ex_wreg_write_i,
    input   Reg_addr_t  ex_wreg_addr_i,
    input   Word_t      ex_wreg_data_i,

    input   Bit_t       mem_wreg_write_i,
    input   Reg_addr_t  mem_wreg_addr_i,
    input   Word_t      mem_wreg_data_i, 

    //branch
    output  Bit_t       branch_flag_o,
    output  Inst_addr_t branch_target_addr_o,

    output  Inst_addr_t pc_o
);

Oper_t      oper;
Bit_t       reg1_read;
Bit_t       reg2_read;
Reg_addr_t  reg1_addr;
Reg_addr_t  reg2_addr;
Bit_t       wreg_write;
Reg_addr_t  wreg_addr;
Word_t      immediate;


id_type id_type_instance(
    .inst,
    .oper,
    .reg1_read,
    .reg2_read,
    .reg1_addr,
    .reg2_addr,
    .wreg_write,
    .wreg_addr,
    .immediate
);

branch branch_instance(
    .rst,
    .oper,
    .pc,
    .reg1(reg1_o),
    .reg2(reg2_o),
    .imm(immediate),
    .branch_flag(branch_flag_o),
    .branch_target_addr(branch_target_addr_o)
);

always_comb begin
    if (rst == `ENABLE) begin
        oper_o <= OP_NOP;
        wreg_write_o <= `DISABLE;
        wreg_addr_o  <= `REG_ZERO;
        reg1_read_o <= `DISABLE;
        reg2_read_o <= `DISABLE;
        reg1_addr_o <= `REG_ZERO;
        reg2_addr_o <= `REG_ZERO;
        pc_o <= `PC_RESET_ADDR;
    end else begin        
        oper_o <= oper;
        wreg_write_o <= wreg_write;
        wreg_addr_o  <= wreg_addr;
        reg1_read_o <= reg1_read;
        reg2_read_o <= reg2_read;
        reg1_addr_o <= reg1_addr;
        reg2_addr_o <= reg2_addr;
        pc_o <= pc;
    end
end
    
always_comb begin
    if (rst == `ENABLE) begin
        reg1_o <= `ZERO_WORD;
    end else if (reg1_read_o == `ENABLE && ex_wreg_write_i == `ENABLE && ex_wreg_addr_i == reg1_addr_o) begin
        if(ex_wreg_addr_i != `REG_ZERO) begin
            reg1_o <= ex_wreg_data_i;
        end else begin
            reg1_o <= `ZERO_WORD;
        end
    end else if (reg1_read_o == `ENABLE && mem_wreg_write_i == `ENABLE && mem_wreg_addr_i == reg1_addr_o) begin
        if(mem_wreg_addr_i != `REG_ZERO) begin
            reg1_o <= mem_wreg_data_i;
        end else begin
            reg1_o <= `ZERO_WORD;
        end
    end else if (reg1_read_o == `ENABLE) begin
        reg1_o <= reg1_data_i;
    end else if (reg1_read_o == `DISABLE) begin
        reg1_o <= immediate;
    end else begin
        reg1_o <= `ZERO_WORD;
    end
end

always_comb begin
    if (rst == `ENABLE) begin
        reg2_o <= `ZERO_WORD;
    end else if (reg2_read_o == `ENABLE && ex_wreg_write_i == `ENABLE && ex_wreg_addr_i == reg2_addr_o) begin
        if(ex_wreg_addr_i != `REG_ZERO) begin
            reg2_o <= ex_wreg_data_i;
        end else begin
            reg2_o <= `ZERO_WORD;
        end
    end else if (reg2_read_o == `ENABLE && mem_wreg_write_i == `ENABLE && mem_wreg_addr_i == reg2_addr_o) begin
        if(mem_wreg_addr_i != `REG_ZERO) begin
            reg2_o <= mem_wreg_data_i;
        end else begin
            reg2_o <= `ZERO_WORD;
        end
    end else if (reg2_read_o == `ENABLE) begin
        reg2_o <= reg2_data_i;
    end else if (reg2_read_o == `DISABLE) begin
        reg2_o <= immediate;
    end else begin
        reg2_o <= `ZERO_WORD;
    end
end



    
endmodule