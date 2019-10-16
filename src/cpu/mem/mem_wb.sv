module mem_wb(
    input               clk, rst,

    input   Bit_t       mem_wreg_write,
    input   Reg_addr_t  mem_wreg_addr,
    input   Word_t      mem_wreg_data,

    output  Bit_t       wb_wreg_write,
    output  Reg_addr_t  wb_wreg_addr,
    output  Word_t      wb_wreg_data    
);

always @ (posedge clk) begin
    if (rst == `ENABLE) begin 
        wb_wreg_write <= `DISABLE;
        wb_wreg_addr  <= `REG_ZERO;
        wb_wreg_data  <= `ZERO_WORD;
    end else begin
        wb_wreg_write <= mem_wreg_write;
        wb_wreg_addr  <= mem_wreg_addr;
        wb_wreg_data  <= mem_wreg_data;
    end
end
    
endmodule