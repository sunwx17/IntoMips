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

//unsigned
Word_t add_u, sub_u;
assign add_u = reg1 + reg2;
assign sub_u = reg1 - reg2;

// comparsion
Bit_t signed_lt, unsigned_lt;
assign signed_lt = (reg1[31] != reg2[31]) ? reg1[31] : sub_u[31];
assign unsigned_lt = ({1'b0, reg1} < {1'b0, reg2});

//multiply
Bit_t is_signed, res_sign;
assign res_sign = (oper != OP_MULTU) && (reg1[31] ^ reg2[31]);

Word_t abs_reg1, abs_reg2;
assign abs_reg1 = ((oper != OP_MULTU) && reg1[31]) ? -reg1 : reg1;
assign abs_reg2 = ((oper != OP_MULTU) && reg2[31]) ? -reg2 : reg2;

Doubleword_t mul_abs, mul_res;
assign mul_abs = abs_reg1 * abs_reg2;
assign mul_res = res_sign ? -mul_abs : mul_abs;
//Below is from TrivialMIPS, but I don't know why
/*Word_t mul_hi, mul_lo;
logic[32:0] mul_md;
assign mul_hi = abs_reg1[31:16] * abs_reg2[31:16];
assign mul_md = abs_reg1[15:0] * abs_reg2[31:16] + abs_reg1[31:16] * abs_reg2[15:0];
assign mul_lo = abs_reg1[15:0] * abs_reg2[15:0];
assign mul_abs = { mul_hi, mul_lo } + { 15'b0, mul_md, 16'b0 };
*/




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
        
        if (`NEED_WRITE_HILO(oper)) begin
            whilo_o <= `ENABLE;
            wreg_write_o <= `DISABLE;
            wreg_addr_o  <= `REG_ZERO;
        end else begin
            whilo_o <= `DISABLE;
        end
        {hi_o, lo_o} <= {hi, lo};

        case (oper)
            OP_AND, OP_ANDI : wreg_data_o <= reg1 & reg2;
            OP_OR, OP_ORI : wreg_data_o <= reg1 | reg2;
            OP_XOR, OP_XORI : wreg_data_o <= reg1 ^ reg2;
            OP_NOR : wreg_data_o <= ~(reg1 | reg2);
            OP_SLL, OP_SLLV : wreg_data_o <= reg2 << reg1[4:0];
            OP_SRL, OP_SRLV : wreg_data_o <= reg2 >> reg1[4:0];
            OP_SRA, OP_SRAV : wreg_data_o <= $signed(reg2) >>> reg1[4:0];
            OP_LUI : wreg_data_o <= { reg2[15:0], 16'b0 };
            OP_MOVN : { wreg_data_o, wreg_write_o } <= (reg2 != `ZERO_WORD) ? { reg1, `ENABLE } : { `ZERO_WORD, `DISABLE };
            OP_MOVZ : { wreg_data_o, wreg_write_o } <= (reg2 == `ZERO_WORD) ? { reg1, `ENABLE } : { `ZERO_WORD, `DISABLE };
            OP_MFHI : wreg_data_o <= hi;
            OP_MFLO : wreg_data_o <= lo;
            OP_MTHI : hi_o <= reg1;
            OP_MTLO : lo_o <= reg1;
            OP_ADD, OP_ADDI, OP_ADDU, OP_ADDIU : wreg_data_o <= add_u;//add and addi should not be like this
            OP_SUB, OP_SUBU : wreg_data_o <= sub_u;//sub should not be like this
            OP_SLT, OP_SLTI : wreg_data_o <= signed_lt;
            OP_SLTU, OP_SLTIU : wreg_data_o <= unsigned_lt;
            OP_MUL : wreg_data_o <= mul_res[31:0];
            OP_MULT, OP_MULTU : {hi_o, lo_o} <= mul_res;
            //OP_CLZ  : 
            //OP_CLO  : 
            default: begin
            end
        endcase
    end
end
    
endmodule