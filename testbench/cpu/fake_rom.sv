`include "cpu_defines.svh"

module fake_rom(
    input   Bit_t       ce,
    input   Inst_addr_t addr,
    output  Inst_t      inst
);

`define INST_MEM_NUM        131071
`define INST_MEM_NUM_LOG2   17

Inst_t inst_mem[0:`INST_MEM_NUM - 1];

initial $readmemh ( "ori0.mem", inst_mem );

always_comb begin
    if (ce == `DISABLE) begin
        inst <= `ZERO_WORD;
    end else begin
        inst <= {inst_mem[addr[`INST_MEM_NUM_LOG2 + 1:2]][7:0],
                 inst_mem[addr[`INST_MEM_NUM_LOG2 + 1:2]][15:8],
                 inst_mem[addr[`INST_MEM_NUM_LOG2 + 1:2]][23:16],
                 inst_mem[addr[`INST_MEM_NUM_LOG2 + 1:2]][31:24]};
    end
end


endmodule