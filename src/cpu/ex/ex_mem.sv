`include "cpu_defines.svh"

module ex_mem(
    input               clk, rst,
    
    input   Bit_t       ex_wreg_write,
    input   Reg_addr_t  ex_wreg_addr,
    input   Word_t      ex_wreg_data,

    output  Bit_t       mem_wreg_write,
    output  Reg_addr_t  mem_wreg_addr,
    output  Word_t      mem_wreg_data,

    //hilo    
    input   Bit_t       ex_whilo,
    input   Word_t      ex_hi,
    input   Word_t      ex_lo,

    output  Bit_t       mem_whilo,
    output  Word_t      mem_hi,
    output  Word_t      mem_lo,

    //memory operations
    input   Oper_t      ex_oper,
    input   Word_t      ex_mem_oper_addr,
    input   Word_t      ex_mem_oper_data,
    
    output  Oper_t      mem_oper,
    output  Word_t      mem_mem_oper_addr,
    output  Word_t      mem_mem_oper_data,

    input   Stall_t     stall
);

always @ (posedge clk) begin
    if (rst == `ENABLE || (stall[3] == `ENABLE && stall[4] == `DISABLE)) begin 
        mem_wreg_write <= `DISABLE;
        mem_wreg_addr  <= `REG_ZERO;
        mem_wreg_data  <= `ZERO_WORD;

        mem_whilo      <= `DISABLE;
        mem_hi         <= `ZERO_WORD;
        mem_lo         <= `ZERO_WORD;
        
        mem_oper          <= OP_NOP;
        mem_mem_oper_addr <= `ZERO_WORD;
        mem_mem_oper_data <= `ZERO_WORD;
    end else if (stall[3] == `DISABLE) begin
        mem_wreg_write <= ex_wreg_write;
        mem_wreg_addr  <= ex_wreg_addr;
        mem_wreg_data  <= ex_wreg_data;

        mem_whilo      <= ex_whilo;
        mem_hi         <= ex_hi;
        mem_lo         <= ex_lo;

        mem_oper          <= ex_oper;
        mem_mem_oper_addr <= ex_mem_oper_addr;
        mem_mem_oper_data <= ex_mem_oper_data;
    end
end
    
endmodule