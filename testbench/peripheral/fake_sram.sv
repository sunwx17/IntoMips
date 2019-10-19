`include "defines.svh"
module fake_sram(
    inout Word_t        ram_data,       //RAM数据，低8位与CPLD串口控制器共享
    input Ram_addr_t   ram_addr,       //RAM地址
    input logic[3:0]   ram_be_n,       //RAM字节使能，低有效。如果不使用字节使能，请保持为0
    input Bit_t        ram_ce_n,       //RAM片选，低有效
    input Bit_t        ram_oe_n,       //RAM读使能，低有效
    input Bit_t        ram_we_n,       //RAM写使能，低有效
);
    Word_t sram_mem[0: 1024*1024];
    Word_t data;
    assign ram_data = data;

    always_comb begin
        if (ram_ce_n) begin
            data <= `HIGH_WORD
        end else begin
            if (ram_oe_n && ~ram_we_n) begin
                //write
                sram_mem[ram_addr] <= data;
            end else if (~ram_oe_n && ram_we_n) begin
                data <= sram_mem[ram_addr];
            end else begin
                data <= `HIGH_WORD;
            end
        end
    end
endmodule