`include "cpu_defines.svh"


module if_id(
    input                   clk, rst,
    input   Inst_addr_t     if_pc,
    input   Inst_t          if_inst,
    //Why do we need pc for id?
    output  Inst_addr_t     id_pc,
    output  Inst_t          id_inst
);

always @ (clk) begin
    if (rst == `ENABLE) begin
        id_pc <= `PC_RESET_ADDR;
        id_inst <= `ZERO_WORD;
    end else begin
        id_pc <= if_pc;
        id_inst <= if_inst;
    end
end

endmodule