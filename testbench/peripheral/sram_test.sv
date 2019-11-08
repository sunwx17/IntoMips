module sram_test(
    input clk, rst,
    input Ram_addr_t    bus_addr,
    input Bit_t         read_op, write_op,
    input Word_t        bus_data_write,
    output Word_t       bus_data_read
);

sram_controller sram_controller_instance(
    .clk(clk),
    .rst(rst),
    .read_op(read_op),
    .write_op(write_op),
    .bus_data_write(bus_data_write),
    .bus_data_read(bus_data_read),
    .bus_addr(bus_addr),
    .byte_mask(4'b1111),
    .ram_data(fake_sram_instance.ram_data),
    .ram_addr(fake_sram_instance.ram_addr),
    .ram_be_n(fake_sram_instance.ram_be_n),
    .ram_ce_n(fake_sram_instance.ram_ce_n),
    .ram_oe_n(fake_sram_instance.ram_oe_n),
    .ram_we_n(fake_sram_instance.ram_we_n)
);


fake_sram fake_sram_instance(
    .clk(clk),
    .ram_data(sram_controller_instance.ram_data),
    .ram_addr(sram_controller_instance.ram_addr),
    .ram_be_n(sram_controller_instance.ram_be_n),
    .ram_ce_n(sram_controller_instance.ram_ce_n),
    .ram_oe_n(sram_controller_instance.ram_oe_n),
    .ram_we_n(sram_controller_instance.ram_we_n)
);

endmodule