`include "cpu_defines.svh"



module pc_reg(
    input   Bit_t           clk, rst,
    output  Inst_addr_t     pc,
    output  Bit_t           ce
);

always @ (posedge clk) begin
    if (rst == `ENABLE) begin
        ce <= `DISABLE;
    end else begin
        ce <= `ENABLE;
    end
end

always @ (posedge clk) begin
    if (ce == `DISABLE) begin
        pc <= `PC_RESET_ADDR;
    end else begin
        pc <= pc + `INST_BYTE_NUM;
    end

end


endmodule