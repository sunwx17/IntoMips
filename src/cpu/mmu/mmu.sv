`include "cpu_defines.svh"

module mmu(
    input                   clk, rst,
    input   Triblebit_t     mem_op_i,
    input   Word_t          store_data_i,
    input   Word_t          mem_addr_i,
    input   Word_t          sram_data_i,
    input   Word_t          flash_data_i,
    input   Word_t          serial_data_i,
    input   Word_t          cp0_status_i,
    input   Word_t          cp0_index_i,
    input   Word_t          cp0_entry_lo0_i,
    input   Word_t          cp0_entry_lo1_i,
    input   Word_t          cp0_entry_hi_i,
    input   Fourbit_t       exception_i,

    output  Triblebit_t     sram_op_o,
    output  Word_t          sram_data_o,
    output  Word_t          sram_add_o,
    output  Triblebit_t     flash_op_o,
    output  Word_t          flash_data_o,
    output  Word_t          flash_add_o,
    output  Triblebit_t     serial_op_o,
    output  Word_t          serial_data_o,
    output  Bit_t           serial_mode_o,
    output  Triblebit_t     keyboard_op_o,
    output  Bit_t           keyboard_mode_o,
    output  Word_t          mem_data_o
);

endmodule