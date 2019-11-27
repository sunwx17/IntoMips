`include "cpu_defines.svh"

module mem_wb(
    input               clk, rst,

    input   Bit_t       mem_wreg_write,
    input   Reg_addr_t  mem_wreg_addr,
    input   Word_t      mem_wreg_data,

    output  Bit_t       wb_wreg_write,
    output  Reg_addr_t  wb_wreg_addr,
    output  Word_t      wb_wreg_data,    
    
    //hilo    
    input   Bit_t       mem_whilo,
    input   Word_t      mem_hi,
    input   Word_t      mem_lo,

    output  Bit_t       wb_whilo,
    output  Word_t      wb_hi,
    output  Word_t      wb_lo,

    input   Stall_t     stall,

    //cp0
    input   Bit_t       mem_cp0_reg_we,
    input   Reg_addr_t  mem_cp0_reg_write_addr,
    input   Word_t      mem_cp0_reg_data,

    output  Bit_t       wb_cp0_reg_we,
    output  Reg_addr_t  wb_cp0_reg_write_addr,
    output  Word_t      wb_cp0_reg_data,


    input   Bit_t       mem_tlb_p,
    input   Bit_t       mem_tlb_r,
    input   Bit_t       mem_tlb_wi,
    input   Bit_t       mem_tlb_wr,

    output  Bit_t       wb_tlb_p,
    output  Bit_t       wb_tlb_r,
    output  Bit_t       wb_tlb_wi,
    output  Bit_t       wb_tlb_wr,


    input   Bit_t       flush
);

always @ (posedge clk) begin
    if (rst == `ENABLE || flush == `ENABLE || (stall[4] == `ENABLE && stall[5] == `DISABLE)) begin 
        wb_wreg_write <= `DISABLE;
        wb_wreg_addr  <= `REG_ZERO;
        wb_wreg_data  <= `ZERO_WORD;

        wb_whilo      <= `DISABLE;
        wb_hi         <= `ZERO_WORD;
        wb_lo         <= `ZERO_WORD;

        wb_cp0_reg_we         <= `DISABLE;
        wb_cp0_reg_write_addr <= `REG_ZERO;
        wb_cp0_reg_data       <= `ZERO_WORD;

        wb_tlb_p    <=  `DISABLE;
        wb_tlb_r    <=  `DISABLE;
        wb_tlb_wi   <=  `DISABLE;
        wb_tlb_wr   <=  `DISABLE;
    end else if(stall[4] == `DISABLE) begin
        wb_wreg_write <= mem_wreg_write;
        wb_wreg_addr  <= mem_wreg_addr;
        wb_wreg_data  <= mem_wreg_data;

        wb_whilo      <= mem_whilo;
        wb_hi         <= mem_hi;
        wb_lo         <= mem_lo;

        wb_cp0_reg_we         <= mem_cp0_reg_we;
        wb_cp0_reg_write_addr <= mem_cp0_reg_write_addr;
        wb_cp0_reg_data       <= mem_cp0_reg_data;

        wb_tlb_p    <=  mem_tlb_p;
        wb_tlb_r    <=  mem_tlb_r;
        wb_tlb_wi   <=  mem_tlb_wi;
        wb_tlb_wr   <=  mem_tlb_wr;
    end
end
    
endmodule