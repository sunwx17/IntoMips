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

    input   Stall_t     stall,

    //cp0
    input   Bit_t       ex_cp0_reg_we,
    input   Reg_addr_t  ex_cp0_reg_write_addr,
    input   Word_t      ex_cp0_reg_data,

    output  Bit_t       mem_cp0_reg_we,
    output  Reg_addr_t  mem_cp0_reg_write_addr,
    output  Word_t      mem_cp0_reg_data,

    input   Bit_t       flush,
    input   Excp_set_t  ex_exception_type,
    input   Bit_t       ex_is_in_delayslot,
    input   Inst_addr_t ex_pc,

    output  Excp_set_t  mem_exception_type,
    output  Bit_t       mem_is_in_delayslot,
    output  Inst_addr_t mem_pc,
    
    input   Inst_addr_t ex_inst_addr_v,
    output  Inst_addr_t mem_inst_addr_v,

    input   Inst_addr_t ex_data_addr_v,
    output  Inst_addr_t mem_data_addr_v

);

always @ (posedge clk) begin
    if (rst == `ENABLE || flush == `ENABLE || (stall[3] == `ENABLE && stall[4] == `DISABLE)) begin 
        mem_wreg_write <= `DISABLE;
        mem_wreg_addr  <= `REG_ZERO;
        mem_wreg_data  <= `ZERO_WORD;

        mem_whilo      <= `DISABLE;
        mem_hi         <= `ZERO_WORD;
        mem_lo         <= `ZERO_WORD;
        
        mem_oper          <= OP_NOP;
        mem_mem_oper_addr <= `ZERO_WORD;
        mem_mem_oper_data <= `ZERO_WORD;

        mem_cp0_reg_we          <= `DISABLE;
        mem_cp0_reg_write_addr  <= `REG_ZERO;
        mem_cp0_reg_data        <= `ZERO_WORD;

        mem_exception_type      <= `NO_EXCP;
        mem_is_in_delayslot     <= `DISABLE;
        mem_pc      <=  `PC_RESET_ADDR;
        mem_inst_addr_v <= `ZERO_WORD;
        mem_data_addr_v <= `ZERO_WORD;
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
        
        mem_cp0_reg_we          <= ex_cp0_reg_we;
        mem_cp0_reg_write_addr  <= ex_cp0_reg_write_addr;
        mem_cp0_reg_data        <= ex_cp0_reg_data;

        mem_exception_type      <= ex_exception_type;
        mem_is_in_delayslot     <= ex_is_in_delayslot;
        mem_pc      <=  ex_pc;
        mem_inst_addr_v <= ex_inst_addr_v;
        mem_data_addr_v <= ex_data_addr_v;
    end
end
    
endmodule