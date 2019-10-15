module mem(
    input               rst,

    input   Bit_t       wreg_write_i,
    input   Reg_addr_t  wreg_addr_i,
    input   Word_t      wreg_data_i,

    output  Bit_t       wreg_write_o,
    output  Reg_addr_t  wreg_addr_o,
    output  Word_t      wreg_data_o
);

always_comb begin
    if (rst == `ENABLE) begin 
        wreg_write_o <= `DISABLE;
        wreg_addr_o  <= `REG_ZERO;
        wreg_data_o  <= `ZERO_WORD;
    end else begin
        wreg_write_o <= wreg_write_i;
        wreg_addr_o  <= wreg_addr_i;
        wreg_data_o  <= wreg_data_i;
    end
end



    
endmodule