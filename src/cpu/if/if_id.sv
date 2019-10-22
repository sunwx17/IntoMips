`include "cpu_defines.svh"


module if_id(
    input                   clk, rst,
    input   Inst_addr_t     if_pc,
    input   Inst_t          if_inst,
    
    output  Inst_addr_t     id_pc,
    output  Inst_t          id_inst,

    input   Stall_t         stall
);

always @ (posedge clk) begin
    if (rst == `ENABLE || (stall[1] == `ENABLE && stall[2] == `DISABLE)) begin
        id_pc <= `PC_RESET_ADDR;
        id_inst <= `ZERO_WORD;
    end else if (stall[1] == `DISABLE) begin
        id_pc <= if_pc;
        id_inst <= if_inst;
    end
end

endmodule