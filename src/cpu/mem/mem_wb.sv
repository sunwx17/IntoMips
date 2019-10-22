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

    input   Stall_t     stall
);

always @ (posedge clk) begin
    if (rst == `ENABLE || (stall[4] == `ENABLE && stall[5] == `DISABLE)) begin 
        wb_wreg_write <= `DISABLE;
        wb_wreg_addr  <= `REG_ZERO;
        wb_wreg_data  <= `ZERO_WORD;

        wb_whilo      <= `DISABLE;
        wb_hi         <= `ZERO_WORD;
        wb_lo         <= `ZERO_WORD;
    end else if(stall[4] == `DISABLE) begin
        wb_wreg_write <= mem_wreg_write;
        wb_wreg_addr  <= mem_wreg_addr;
        wb_wreg_data  <= mem_wreg_data;

        wb_whilo      <= mem_whilo;
        wb_hi         <= mem_hi;
        wb_lo         <= mem_lo;
    end
end
    
endmodule