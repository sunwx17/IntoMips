`include "defines.svh"
module registers(
    // clock
    input   logic    clk,
    input   logic    rst,

    // write
    input   logic                        write_enable,
    input   logic[`REG_ADDR_BUS]         write_addr,
    input   logic[`REG_BUS]              write_data,

    // read 1
    input   logic                        read_enable_1,
    input   logic[`REG_ADDR_BUS]         read_addr_1,
    

    // read 2
    input   logic                        read_enable_2,
    input   logic[`REG_ADDR_BUS]         read_addr_2,

    // output
    output  logic[`REG_BUS]              data_1,
    output  logic[`REG_BUS]              data_2

);

endmodule