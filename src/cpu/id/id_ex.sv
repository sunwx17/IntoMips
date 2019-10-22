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

    input   Stall_t     stall
);

always @ (posedge clk) begin
    if (rst == `ENABLE || (stall[2] == `ENABLE && stall[3] == `DISABLE)) begin
        ex_oper <= OP_NOP;
        ex_reg1 <= `ZERO_WORD;
        ex_reg2 <= `ZERO_WORD;
        ex_wreg_write <= `DISABLE;
        ex_wreg_addr  <= `REG_ZERO;
        ex_pc <= `PC_RESET_ADDR;
    end else if (stall[2] == `DISABLE) begin
        ex_oper <= id_oper;
        ex_reg1 <= id_reg1;
        ex_reg2 <= id_reg2;
        ex_wreg_write <= id_wreg_write;
        ex_wreg_addr  <= id_wreg_addr;
        ex_pc <= id_pc;
    end
end

endmodule