`include "defines.svh"

module hilo(
    input               clk, rst,
    input   Bit_t       we,
    input   Reg_data_t  hi_i,
    input   Reg_data_t  lo_i,
    output  Reg_data_t  hi_o,
    output  Reg_data_t  lo_o
);

Reg_data_t hi;
Reg_data_t lo;

always @ (posedge clk) begin
    if (rst == `ENABLE) begin
        hi <= `ZERO_WORD;
        lo <= `ZERO_WORD;
    end else if (we == `ENABLE) begin
        hi <= hi_i;
        lo <= lo_i;
    end
end

always_comb begin
    if (rst == `ENABLE) begin
        hi_o <= `ZERO_WORD;
        lo_o <= `ZERO_WORD;
    end else begin
        hi_o <= hi;
        lo_o <= lo;
    end
end





    
endmodule