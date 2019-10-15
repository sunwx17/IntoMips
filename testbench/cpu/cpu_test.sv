`include "cpu_defines.svh"

module cpu_test(
    input clk, rst
);

Inst_addr_t inst_addr;
Inst_t      inst;
Bit_t       ce;

cpu cpu_instance(
    .clk,
    .rst,
    .rom_data_i(inst),
    .rom_addr_o(inst_addr),  
    .rom_ce_o(ce)
);

fake_rom fake_rom_instance(
    .ce(ce),
    .addr(inst_addr),
    .inst(inst)
);


endmodule