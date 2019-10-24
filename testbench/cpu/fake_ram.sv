`include "cpu_defines.svh"

module fake_ram(
    input               clk, rst,
    input  Bit_t        re, we,
    input  Word_t       addr,
    input  Word_t       data_i, 
    input  Mask_t       mask,
    output Word_t       data_o 
);

`define  DATA_MEM_NUM           131071
`define  DATA_MEM_NUM_LOG2      17


Byte_t data_mem[0:`DATA_MEM_NUM * 4 - 1];


always @ (posedge clk) begin
    if(we == `ENABLE) begin
        if(mask[0] == `ENABLE) data_mem[addr[`DATA_MEM_NUM_LOG2 + 1 : 0]] <= data_i[7:0];
        if(mask[1] == `ENABLE) data_mem[addr[`DATA_MEM_NUM_LOG2 + 1 : 0] + 1] <= data_i[15:8];
        if(mask[2] == `ENABLE) data_mem[addr[`DATA_MEM_NUM_LOG2 + 1 : 0] + 2] <= data_i[23:16];
        if(mask[3] == `ENABLE) data_mem[addr[`DATA_MEM_NUM_LOG2 + 1 : 0] + 3] <= data_i[31:24];
    end
end

always_comb begin
    if(re == `ENABLE && we == `DISABLE) begin
        data_o <= { data_mem[addr[`DATA_MEM_NUM_LOG2 + 1 : 0] + 3], 
                    data_mem[addr[`DATA_MEM_NUM_LOG2 + 1 : 0] + 2],
                    data_mem[addr[`DATA_MEM_NUM_LOG2 + 1 : 0] + 1],
                    data_mem[addr[`DATA_MEM_NUM_LOG2 + 1 : 0]] };
    end else begin
        data_o <= `ZERO_WORD;
    end
end


    
endmodule