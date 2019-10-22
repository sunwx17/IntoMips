`include "cpu_defines.svh"

module ctrl(
    input           rst,
    input  Bit_t    stallreq_from_id,
    input  Bit_t    stallreq_from_ex,
    output Stall_t  stall 
);

always_comb begin
    if (rst == `ENABLE) begin
        stall <= 6'b000000;
    end else if (stallreq_from_ex == `ENABLE) begin
        stall <= 6'b001111;
    end else if (stallreq_from_id == `ENABLE) begin
        stall <= 6'b000111;
    end else begin
        stall <= 6'b000000;
    end
end


endmodule