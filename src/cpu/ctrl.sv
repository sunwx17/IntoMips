`include "cpu_defines.svh"

module ctrl(
    input           rst,
    input  Bit_t    stallreq_from_bus,
    input  Bit_t    stallreq_from_id,
    input  Bit_t    stallreq_from_ex,
    output Stall_t  stall,

    input  Word_t       cp0_epc_i,
    input  Word_t       exception_type_i,
    output Inst_addr_t  new_pc,
    output Bit_t        flush 
); 


always_comb begin
    if (rst == `ENABLE) begin
        stall <= 6'b000000;
        flush <= `DISABLE;
        new_pc <= `PC_RESET_ADDR;
    end else if (exception_type_i != `ZERO_WORD) begin
        stall <= 6'b000000;
        flush <= `ENABLE;        
        case (exception_type_i)
            `EXCP_TYPE_INTERRUPT : begin
                new_pc <= `PC_INTERRUPT;
            end
            `EXCP_TYPE_SYSCALL : begin
                new_pc <= `PC_SYSCALL;
            end
            `EXCP_TYPE_INVALID_INST : begin
                new_pc <= `PC_INVALID_INST;
            end
            `EXCP_TYPE_OV : begin
                new_pc <= `PC_OV;
            end
            `EXCP_TYPE_ERET : begin
                new_pc <= cp0_epc_i;
            end
            default : begin end
        endcase
    end else if (stallreq_from_bus == `ENABLE) begin
        stall <= 6'b000011;
        flush <= `DISABLE;
        new_pc <= `PC_RESET_ADDR;
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