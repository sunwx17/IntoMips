`include "cpu_defines.svh"

module ex(
    input               rst,
    
    input   Oper_t      oper,
    input   Word_t      reg1,
    input   Word_t      reg2,

    input   Bit_t       wreg_write_i,
    input   Reg_addr_t  wreg_addr_i,

    output  Bit_t       wreg_write_o,
    output  Reg_addr_t  wreg_addr_o,
    output  Word_t      wreg_data_o    
);

always_comb begin
    if (rst == `ENABLE) begin
        wreg_write_o <= `DISABLE;
        wreg_addr_o  <= `REG_ZERO;
        wreg_data_o  <= `ZERO_WORD;
    end else begin
        wreg_write_o <= wreg_write_i;
        wreg_addr_o  <= wreg_addr_i;
        wreg_data_o  <= `ZERO_WORD;
        case (oper)
            OP_AND, OP_ANDI : begin
                wreg_data_o <= reg1 & reg2;
            end
            OP_OR, OP_ORI : begin
                wreg_data_o <= reg1 | reg2;
            end
            OP_XOR, OP_XORI : begin
                wreg_data_o <= reg1 ^ reg2;
            end
            OP_NOR : begin
                wreg_data_o <= ~(reg1 | reg2);
            end
            OP_SLL, OP_SLLV : begin
                wreg_data_o <= reg2 << reg1[4:0];
            end
            OP_SRL, OP_SRLV : begin
                wreg_data_o <= reg2 >> reg1[4:0];
            end
            OP_SRA, OP_SRAV : begin
                wreg_data_o <= $signed(reg2) >>> reg1[4:0];
            end
            OP_LUI  : begin
                wreg_data_o <= { reg2, 16'b0 };
            end
            default: begin
            end
        endcase
    end
end
    
endmodule