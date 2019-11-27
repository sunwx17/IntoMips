`include "cpu_defines.svh"

module id_ex(
    input               clk, rst,
    
    input   Oper_t      id_oper,
    input   Word_t      id_reg1,
    input   Word_t      id_reg2,
    input   Bit_t       id_wreg_write,
    input   Reg_addr_t  id_wreg_addr,
    input   Inst_addr_t id_pc,

    output  Oper_t      ex_oper,
    output  Word_t      ex_reg1,
    output  Word_t      ex_reg2,
    output  Bit_t       ex_wreg_write,
    output  Reg_addr_t  ex_wreg_addr,
    output  Inst_addr_t ex_pc,

    input   Bit_t       id_is_in_delayslot,
    output  Bit_t       ex_is_in_delayslot,

    input   Bit_t       next_is_in_delayslot_i,
    output  Bit_t       is_in_delayslot_o,

    input   Stall_t     stall,

    input   Bit_t       flush,
    input   Excp_set_t  id_exception_type,
    output  Excp_set_t  ex_exception_type,
    
    input   Inst_addr_t id_inst_addr_v,
    output  Inst_addr_t ex_inst_addr_v
);

always @ (posedge clk) begin
    if (rst == `ENABLE || flush == `ENABLE || (stall[2] == `ENABLE && stall[3] == `DISABLE)) begin
        ex_oper <= OP_NOP;
        ex_reg1 <= `ZERO_WORD;
        ex_reg2 <= `ZERO_WORD;
        ex_wreg_write <= `DISABLE;
        ex_wreg_addr  <= `REG_ZERO;
        ex_pc <= `PC_RESET_ADDR;
        ex_is_in_delayslot <= `DISABLE;
        is_in_delayslot_o <= `DISABLE;
        ex_exception_type <= `NO_EXCP;
        ex_inst_addr_v <= `ZERO_WORD;
    end else if (stall[2] == `DISABLE) begin
        ex_oper <= id_oper;
        ex_reg1 <= id_reg1;
        ex_reg2 <= id_reg2;
        ex_wreg_write <= id_wreg_write;
        ex_wreg_addr  <= id_wreg_addr;
        ex_pc <= id_pc;
        ex_is_in_delayslot <= id_is_in_delayslot;
        is_in_delayslot_o <= next_is_in_delayslot_i;
        ex_exception_type <= id_exception_type;
        ex_inst_addr_v <= id_inst_addr_v;
    end
end

endmodule