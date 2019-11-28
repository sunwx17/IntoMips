`include "cpu_defines.svh"
`include "peripheral_defines.svh"
module fake_sram(
    input clk,
    inout Word_t       ram_data,       //RAM数据，低8位与CPLD串口控制器共享
    input Ram_addr_t   ram_addr,       //RAM地址
    input Mask_t       ram_be_n,       //RAM字节使能，低有效。如果不使用字节使能，请保持为0
    input Bit_t        ram_ce_n,       //RAM片选，低有效
    input Bit_t        ram_oe_n,       //RAM读使能，低有效
    input Bit_t        ram_we_n       //RAM写使能，低有效
);
    
    //按字编址
    Byte_t sram_mem[0: 1024*1024*4];
    Word_t data;
    assign ram_data = data;

    always @ (posedge clk) begin
        if (~ram_ce_n && ram_oe_n && ~ram_we_n) begin
            if (~ram_be_n[0]) sram_mem[(ram_addr << 2) + 0] <= ram_data[7:0];
            if (~ram_be_n[1]) sram_mem[(ram_addr << 2) + 1] <= ram_data[15:8];
            if (~ram_be_n[2]) sram_mem[(ram_addr << 2) + 2] <= ram_data[23:16];
            if (~ram_be_n[3]) sram_mem[(ram_addr << 2) + 3] <= ram_data[31:24];  
            //$display("write %h at %d time = %t be = %b", ram_data, ram_addr, $time, ram_be_n);      
        end
    end    
    

    always_comb begin
        if (ram_ce_n) begin
            data <= `HIGH_WORD;
        end else begin
            if (ram_we_n && ~ram_oe_n) begin
                data <= {sram_mem[(ram_addr << 2) + 3], sram_mem[(ram_addr << 2) + 2], sram_mem[(ram_addr << 2) + 1], sram_mem[(ram_addr << 2) + 0]};
                //$display("read %h at %d time = %t be = %b", ram_data, ram_addr, $time, ram_be_n);      
            end else begin
                data <= `HIGH_WORD;
            end
        end
    end

    /*
    always @ (posedge clk) begin
        if (~ram_ce_n && ~ram_oe_n && ram_we_n) begin
            $display("sram be = %b", ram_be_n);      
        end else if (~ram_ce_n && ram_oe_n && ~ram_we_n) begin
            $display("sram w be = %b",ram_be_n);      
        end
    end
    */
endmodule