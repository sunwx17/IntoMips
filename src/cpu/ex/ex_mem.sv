`include "cpu_defines.svh"

module ex_mem(
    input               clk, rst,
    
    input   Bit_t       ex_wreg_write,
    input   Reg_addr_t  ex_wreg_addr,
    input   Word_t      ex_wreg_data,

    output  Bit_t       mem_wreg_write,
    output  Reg_addr_t  mem_wreg_addr,
    output  Word_t      mem_wreg_data
);

always @ (clk) begin
    if (rst == `DISABLE) begin 
        mem_wreg_write <= `DISABLE;
        mem_wreg_addr  <= `REG_ZERO;
        mem_wreg_data  <= `ZERO_WORD;
    end else begin
        mem_wreg_write <= ex_wreg_write;
        mem_wreg_addr  <= ex_wreg_addr;
        mem_wreg_data  <= ex_wreg_data;
    end
end
    
endmodule