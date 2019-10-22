`include "cpu_defines.svh"

module cpu_test(
    input clk, rst
);

Inst_addr_t inst_addr;
Inst_t      inst;
Bit_t       ce;

Word_t      ram_data_i;
Word_t      ram_addr;
Word_t      ram_data_o;
Bit_t       ram_re;
Bit_t       ram_we;
Mask_t      ram_mask;

cpu cpu_instance(
    .clk,
    .rst,
    .rom_data_i(inst),
    .rom_addr_o(inst_addr),  
    .rom_ce_o(ce),
    .ram_data_i(ram_data_o),
    .ram_addr_o(ram_addr),
    .ram_data_o(ram_data_i),
    .ram_re_o(ram_re),
    .ram_we_o(ram_we),
    .ram_mask_o(ram_mask) 
);

fake_rom fake_rom_instance(
    .ce(ce),
    .addr(inst_addr),
    .inst(inst)
);

fake_ram fake_ram_instance(
    .clk,
    .re(ram_re),
    .we(ram_we),
    .addr(ram_addr),
    .data_i(ram_data_i), 
    .mask(ram_mask),
    .data_o(ram_data_o) 
);


endmodule