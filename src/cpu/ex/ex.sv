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
            OP_ORI: begin
                wreg_data_o <= reg1 | reg2;
            end
            default: begin
            end
        endcase
    end
end
    
endmodule