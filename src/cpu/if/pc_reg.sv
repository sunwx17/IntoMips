`include "cpu_defines.svh"



module pc_reg(
    input               clk, rst,
    output  Inst_addr_t pc,
    output  Bit_t       ce,

    //branch
    input   Bit_t       branch_flag_i,
    input   Inst_addr_t branch_target_addr_i,

    input   Stall_t     stall,

    //exception
    input   Bit_t       flush,
    input   Inst_addr_t new_pc 
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
    end else if(flush == `ENABLE) begin
        pc <= new_pc;
    end else if(stall[0] != `ENABLE) begin
        if(branch_flag_i == `ENABLE) begin
            pc <= branch_target_addr_i;
        end else begin
            pc <= pc + `INST_BYTE_NUM;
        end
    end

end

/*always @ (negedge clk) begin
    $display("pc is 0x%x", pc);
end*/


endmodule