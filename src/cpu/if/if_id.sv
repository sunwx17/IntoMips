`include "cpu_defines.svh"


module if_id(
    input                   clk, rst,
    (*MAKE_DEBUG="TRUE"*)input   Inst_addr_t     if_pc,
    input   Inst_t          if_inst,
    input   Bit_t           if_miss,
    input   Bit_t           if_valid,
    
    output  Inst_addr_t     id_pc,
    output  Inst_t          id_inst,
    output  Excp_set_t      id_exception_type,

    input   Inst_addr_t     if_inst_addr_v,
    output  Inst_addr_t     id_inst_addr_v,

    input   Stall_t         stall,

    input   Bit_t           flush
);

always @ (posedge clk) begin
    if (rst == `ENABLE || flush == `ENABLE || (stall[1] == `ENABLE && stall[2] == `DISABLE)) begin
        id_pc <= `PC_RESET_ADDR;
        id_inst <= `ZERO_WORD;
        id_exception_type <= `NO_EXCP;
        id_inst_addr_v <= `ZERO_WORD;
    end else if (stall[1] == `DISABLE) begin
        id_pc <= if_pc;
        id_inst <= if_inst;
        id_exception_type.inst_tlb_refill <= if_miss;
        id_exception_type.inst_tlb_invalid <= ~if_valid;
        id_inst_addr_v <= if_inst_addr_v;
    end
end

endmodule