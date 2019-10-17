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
    output  Word_t      mem_lo
);

always @ (posedge clk) begin
    if (rst == `ENABLE) begin 
        mem_wreg_write <= `DISABLE;
        mem_wreg_addr  <= `REG_ZERO;
        mem_wreg_data  <= `ZERO_WORD;

        mem_whilo      <= `DISABLE;
        mem_hi         <= `ZERO_WORD;
        mem_lo         <= `ZERO_WORD;
    end else begin
        mem_wreg_write <= ex_wreg_write;
        mem_wreg_addr  <= ex_wreg_addr;
        mem_wreg_data  <= ex_wreg_data;

        mem_whilo      <= ex_whilo;
        mem_hi         <= ex_hi;
        mem_lo         <= ex_lo;
    end
end
    
endmodule