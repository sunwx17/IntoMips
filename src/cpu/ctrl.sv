`include "cpu_defines.svh"

module ctrl(
    input           rst,
    input  Bit_t    stallreq_from_bus,
    input  Bit_t    stallreq_from_id,
    input  Bit_t    stallreq_from_ex,
    output Stall_t  stall,

    input  Word_t       cp0_ebase_i,
    input  Word_t       cp0_epc_i,
    input  Excp_t       exception_type_i,
    output Inst_addr_t  new_pc,
    output Bit_t        flush 
); 


always_comb begin
    if (rst == `ENABLE) begin
        stall <= 6'b000000;
        flush <= `DISABLE;
        new_pc <= `PC_RESET_ADDR;
    end else if (stallreq_from_bus == `ENABLE) begin
        stall <= 6'b111111;
        flush <= `DISABLE;
        new_pc <= `PC_RESET_ADDR;
    end else if (exception_type_i != EXC_NO) begin
        stall <= 6'b000000;
        flush <= `ENABLE;        
        case (exception_type_i)
            EXC_INTERRUPT : begin
                new_pc <= cp0_ebase_i + `PC_INTERRUPT;
            end
            EXC_SYSCALL : begin
                new_pc <= cp0_ebase_i + `PC_SYSCALL;
            end
            EXC_INVALID_INST : begin
                new_pc <= cp0_ebase_i + `PC_INVALID_INST;
            end
            EXC_OV : begin
                new_pc <= cp0_ebase_i + `PC_OV;
            end
            EXC_INST_TLB_REFILL, EXC_DATA_TLB_REFILL_LOAD, EXC_DATA_TLB_REFILL_STORE : begin
                new_pc <= cp0_ebase_i + `PC_TLB_REFILL;
            end
            EXC_INST_TLB_INVALID, EXC_DATA_TLB_INVALID_LOAD, EXC_DATA_TLB_INVALID_STORE : begin
                new_pc <= cp0_ebase_i + `PC_TLB_INVALID;
            end
            EXC_ERET : begin
                new_pc <= cp0_epc_i;
            end
            EXC_BREAKPOINT : begin
                new_pc <= cp0_ebase_i + `PC_BREAKPOINT;
            end
            default : begin end
        endcase
    end else if (stallreq_from_ex == `ENABLE) begin
        stall <= 6'b001111;
        flush <= `DISABLE;
        new_pc <= `PC_RESET_ADDR;
    end else if (stallreq_from_id == `ENABLE) begin
        stall <= 6'b000111;
        flush <= `DISABLE;
        new_pc <= `PC_RESET_ADDR;
    end else begin
        stall <= 6'b000000;
        flush <= `DISABLE;
        new_pc <= `PC_RESET_ADDR;
    end
end


endmodule