`include "defines.svh"
module registers(
    // clock
    input               clk, rst,

    // write
    input   Bit_t       write_enable,
    input   Reg_addr_t  write_addr,
    input   Reg_data_t  write_data,

    // read 1
    input   Bit_t       read_enable_1,
    input   Reg_addr_t  read_addr_1,
    

    // read 2
    input   Bit_t       read_enable_2,
    input   Reg_addr_t  read_addr_2,

    // output
    output  Reg_data_t  data_1,
    output  Reg_data_t  data_2

);

endmodule