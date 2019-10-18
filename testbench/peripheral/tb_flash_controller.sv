`timescale 1ns / 1ps

module tb_flash_controller();
    reg clock, reset;
    wire [31:0] data = 32'b0;
    
    wire [22:0] flash_a = 23'b0;
    wire [31:0] flash_d = 32'b0;
    wire flash_rp_n;
    wire flash_vpen;
    wire flash_ce_n;
    wire flash_oe_n;
    wire flash_we_n;
    wire flash_byte_n;
    
    initial begin
        reset = 1'b0;
        clock = 1'b0;
        #(200) clock = ~clock;
        #(200) clock = ~clock;
        #(200) clock = ~clock;
        #(200) clock = ~clock;
        #(200) clock = ~clock;
        #(200) clock = ~clock;
        #(200) clock = ~clock;
        #(200) clock = ~clock;
        #(200) clock = ~clock;
        
    end
    
    flash_controller ctl(
    .clk(clock),
    .rst(reset),
    .bus_addr(23'b0),
    .read_op(1'b1),
    .bus_data(data),
    .flash_a(flash_a),
    .flash_d(flash_d),
    .flash_rp_n(flash_rp_n),
    .flash_vpen(flash_vpen),
    .flash_ce_n(flash_ce_n),
    .flash_oe_n(flash_oe_n),
    .flash_we_n(flash_we_n),
    .flash_byte_n(flash_byte_n)
    );


endmodule