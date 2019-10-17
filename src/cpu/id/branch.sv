`include "cpu_defines.svh"

module branch(
    input               rst,
    input   Oper_t      oper,
    input   Inst_addr_t pc,
    input   Word_t      reg1,
    input   Word_t      reg2,
    input   Word_t      imm,
    output  Bit_t       branch_flag,
    output  Inst_addr_t branch_target_addr
);

always_comb begin
    if (rst == `ENABLE) begin
        branch_flag <= `DISABLE;
        branch_target_addr <= `PC_RESET_ADDR;
    end else begin
        branch_flag <= `DISABLE;
        branch_target_addr <= `PC_RESET_ADDR;
        //branch default
        branch_target_addr <= pc + 4 + { imm, 2'b00 };
        case (oper)
            OP_JR, OP_JALR : begin
                branch_flag <= `ENABLE;
                branch_target_addr <= reg1;
            end
            OP_J, OP_JAL :begin
                branch_flag <= `ENABLE;
                branch_target_addr <= { pc[31:28], reg1[25:0], 2'b00 };
            end
            OP_BEQ   : branch_flag <= (reg1 == reg2);
            OP_BGTZ  : branch_flag <= (reg1[31] == 1'b0) && (reg1 > 0);
            OP_BLEZ  : branch_flag <= ~((reg1[31] == 1'b0) && (reg1 > 0));
            OP_BNE   : branch_flag <= (reg1 != reg2);
            OP_BLTZ, OP_BLTZAL : branch_flag <= (reg1[31] == 1'b1);
            OP_BGEZ, OP_BGEZAL : branch_flag <= (reg1[31] == 1'b0);
            default: begin end
        endcase
    end
end

    
endmodule