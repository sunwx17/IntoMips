`timescale 1ns / 1ps

module tb_sram_controller();
    reg clock, reset;
    
    wire [31:0] base_ram_data;
    wire [19:0] base_ram_addr;
    wire [3:0] base_ram_be_n;
    wire base_ram_ce_n;
    wire base_ram_oe_n;
    wire base_ram_we_n;
    wire [31:0] bus_data;
    wire bus_stall;
    reg read_op;
    reg write_op;
    
    
    initial begin
        clock = 0;
        read_op = 0;
        reset = 1;
        #(100) reset = 0;
        write_op = 0;
        read_op = 1;
        repeat (10)
            #(100) clock = ~clock;
    end
    
    
    //always
        //#100 clock = ~clock;

    
    
    sram_controller ctl(
        .clk(clock),
        .rst(reset),
        .read_op(read_op),
        .write_op(write_op),
        .bus_data(bus_data),
        .bus_addr(20'b0),
        .byte_mask(4'b1111),
        .bus_stall(bus_stall),
        .ram_data(base_ram_data),
        .ram_addr(base_ram_addr),
        .ram_be_n(base_ram_be_n),
        .ram_ce_n(base_ram_ce_n),
        .ram_oe_n(base_ram_oe_n),
        .ram_we_n(base_ram_we_n)
    );


endmodule
