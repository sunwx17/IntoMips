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
    output  Word_t      wreg_data_o,

    //hilo
    input   Word_t      hi_i,
    input   Word_t      lo_i,

    input   Bit_t       mem_whilo_i,
    input   Word_t      mem_hi_i,
    input   Word_t      mem_lo_i,

    input   Bit_t       wb_whilo_i,
    input   Word_t      wb_hi_i,
    input   Word_t      wb_lo_i,

    output  Bit_t       whilo_o,
    output  Word_t      hi_o,
    output  Word_t      lo_o 
);

Word_t hi, lo;

always_comb begin
    if (rst == `ENABLE) begin
        {hi, lo} <= {`ZERO_WORD, `ZERO_WORD};
    end else if (mem_whilo_i == `ENABLE) begin
        {hi, lo} <= {mem_hi_i, mem_lo_i};
    end else if (wb_whilo_i == `ENABLE) begin
        {hi, lo} <= {wb_hi_i, wb_lo_i};
    end else begin
        {hi, lo} <= {hi_i, lo_i};
    end
end

always_comb begin
    if (rst == `ENABLE) begin
        wreg_write_o <= `DISABLE;
        wreg_addr_o  <= `REG_ZERO;
        wreg_data_o  <= `ZERO_WORD;

        whilo_o      <= `DISABLE;
        {hi_o, lo_o} <= {`ZERO_WORD, `ZERO_WORD};
    end else begin
        wreg_write_o <= wreg_write_i;
        wreg_addr_o  <= wreg_addr_i;
        wreg_data_o  <= `ZERO_WORD;
        
        whilo_o      <= `DISABLE;
        {hi_o, lo_o} <= {hi, lo};
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
                wreg_data_o <= { reg2[15:0], 16'b0 };
            end
            OP_MOVN : begin
                if (reg2 != `ZERO_WORD) begin
                    wreg_data_o <= reg1;
                end else begin
                    wreg_write_o <= `DISABLE;
                    wreg_addr_o  <= `REG_ZERO;
                end
            end
            OP_MOVZ : begin
                if (reg2 == `ZERO_WORD) begin
                    wreg_data_o <= reg1;
                end else begin
                    wreg_write_o <= `DISABLE;
                    wreg_addr_o  <= `REG_ZERO;
                end
            end
            OP_MFHI : begin
                wreg_data_o <= hi;
            end
            OP_MFLO : begin
                wreg_data_o <= lo;
            end
            OP_MTHI : begin
                wreg_write_o <= `DISABLE;
                wreg_addr_o  <= `REG_ZERO;
                whilo_o <= `ENABLE;
                hi_o    <= reg1;
            end
            OP_MTLO : begin
                wreg_write_o <= `DISABLE;
                wreg_addr_o  <= `REG_ZERO;
                whilo_o <= `ENABLE;
                lo_o    <= reg1;
            end
            default: begin
            end
        endcase
    end
end
    
endmodule