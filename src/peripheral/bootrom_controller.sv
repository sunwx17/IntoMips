`include "peripheral_defines.svh"

module bootrom_controller (
    input Bit_t     clk,
    input Bit_t     rst,

    //总线信号
    input Bit_t     read_op,
    input Word_t    bus_addr,
    output Word_t   bus_data_read,     

    input Bit_t     read_op_ex,
    input Word_t    bus_addr_ex,
    output Word_t   bus_data_read_ex
);

blk_mem_bootrom rom_instance(
    .clka(clk),
    .addra(bus_addr >> 2),
    .douta(bus_data_read),
    .clkb(clk),
    .addrb(bus_addr_ex >> 2),
    .doutb(bus_data_read_ex)
);

endmodule


