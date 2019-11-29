`include "cpu_defines.svh"

module ex(
    input               rst,
    
    input   Inst_addr_t pc,

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
    output  Word_t      lo_o,

    //mempry operations
    output  Oper_t      oper_o,
    output  Word_t      mem_oper_addr,
    output  Word_t      mem_oper_data,

    output  Bit_t       stallreq,

    input   Bit_t       is_in_delayslot_i,
    output  Bit_t       is_in_delayslot_o,

    //cp0
    input   Bit_t       mem_cp0_reg_we,
    input   Reg_addr_t  mem_cp0_reg_write_addr,
    input   Word_t      mem_cp0_reg_data,
  
    input   Bit_t       wb_cp0_reg_we,
    input   Reg_addr_t  wb_cp0_reg_write_addr,
    input   Word_t      wb_cp0_reg_data,

    input   Word_t      cp0_reg_data_i,
    output  Reg_addr_t  cp0_reg_read_addr_o,

    output  Bit_t       cp0_reg_we_o,
    output  Reg_addr_t  cp0_reg_write_addr_o,
    output  Word_t      cp0_reg_data_o,

    input   Excp_set_t  exception_type_i,
    output  Excp_set_t  exception_type_o,
    
    input   Inst_addr_t inst_addr_v_i,
    output  Inst_addr_t inst_addr_v_o,

    input   Bit_t       data_miss,
    input   Bit_t       data_valid,

    output  Inst_addr_t pc_o 
);

assign inst_addr_v_o = inst_addr_v_i;

assign is_in_delayslot_o = is_in_delayslot_i;

//assign exception_type_o = exception_type_i;//TODO: 溢出异常

always_comb begin
    if (rst) begin
        exception_type_o <= `NO_EXCP;
    end else begin
        exception_type_o <= exception_type_i;
        exception_type_o.data_tlb_refill_load <= `NEED_LOAD(oper) && data_miss;
        exception_type_o.data_tlb_invalid_load <= `NEED_LOAD(oper) && ~data_valid;
        exception_type_o.data_tlb_refill_store <= `NEED_SAVE(oper) && data_miss;
        exception_type_o.data_tlb_invalid_store <= `NEED_SAVE(oper) && ~data_valid;
    end
end





assign pc_o = pc;

assign oper_o = oper;

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


Word_t cp0_data;


always_comb begin
    if(rst == `ENABLE) begin
        cp0_data <= `ZERO_WORD;
        cp0_reg_read_addr_o <= `REG_ZERO;
    end else begin
        cp0_reg_read_addr_o <= reg2[`REG_ADDR_BUS];
        if (mem_cp0_reg_we == `ENABLE && mem_cp0_reg_write_addr == reg2[`REG_ADDR_BUS]) begin
            if (`CP0_REGS_CAN_WRITE(mem_cp0_reg_write_addr)) begin // has a problem
                cp0_data <= mem_cp0_reg_data;
            end else if(mem_cp0_reg_write_addr == `CP0_CAUSE) begin
                cp0_data <= mem_cp0_reg_data && `CP0_CAUSE_MASK;
            end
        end else if(wb_cp0_reg_we == `ENABLE && wb_cp0_reg_write_addr == reg2[`REG_ADDR_BUS]) begin
            if (`CP0_REGS_CAN_WRITE(wb_cp0_reg_write_addr)) begin // has a problem
                cp0_data <= wb_cp0_reg_data;
            end else if(mem_cp0_reg_write_addr == `CP0_CAUSE) begin
                cp0_data <= wb_cp0_reg_data && `CP0_CAUSE_MASK;
            end
        end else begin
            cp0_data <= cp0_reg_data_i;
        end
        /*if (`CP0_REGS_CAN_WRITE(mem_cp0_reg_write_addr)) begin // has a problem
            if (mem_cp0_reg_we == `ENABLE && mem_cp0_reg_write_addr == reg2[`REG_ADDR_BUS]) begin
                cp0_data <= mem_cp0_reg_data;
            end else if(wb_cp0_reg_we == `ENABLE && wb_cp0_reg_write_addr == reg2[`REG_ADDR_BUS]) begin
                cp0_data <= wb_cp0_reg_data;
            end
        end else if(mem_cp0_reg_write_addr == `CP0_CAUSE) begin
            if (mem_cp0_reg_we == `ENABLE && mem_cp0_reg_write_addr == reg2[`REG_ADDR_BUS]) begin
                cp0_data <= mem_cp0_reg_data && `CP0_CAUSE_MASK;
            end else if(wb_cp0_reg_we == `ENABLE && wb_cp0_reg_write_addr == reg2[`REG_ADDR_BUS]) begin
                cp0_data <= wb_cp0_reg_data && `CP0_CAUSE_MASK;
            end 
        end else begin
            cp0_data <= cp0_reg_data_i;
        end*/
    end
end




//unsigned
Word_t add_u, sub_u;
assign add_u = reg1 + reg2;
assign sub_u = reg1 - reg2;

// comparsion
Bit_t signed_lt, unsigned_lt;
assign signed_lt = (reg1[31] != reg2[31]) ? reg1[31] : sub_u[31];
assign unsigned_lt = (reg1 < reg2);

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
        
        mem_oper_addr <= `ZERO_WORD;

        mem_oper_addr <= `ZERO_WORD;

        whilo_o      <= `DISABLE;
        {hi_o, lo_o} <= {`ZERO_WORD, `ZERO_WORD};
        
        stallreq <= `DISABLE;
        
        cp0_reg_we_o <= `DISABLE;
        cp0_reg_write_addr_o <= `REG_ZERO;
        cp0_reg_data_o <= `ZERO_WORD;
        
    end else begin
        wreg_write_o <= wreg_write_i;
        wreg_addr_o  <= wreg_addr_i;
        wreg_data_o  <= `ZERO_WORD;

        mem_oper_addr <= `ZERO_WORD;
        
        mem_oper_addr <= `ZERO_WORD;

        if (`NEED_WRITE_HILO(oper)) begin
            whilo_o <= `ENABLE;
            wreg_write_o <= `DISABLE;
            wreg_addr_o  <= `REG_ZERO;
        end else begin
            whilo_o <= `DISABLE;
        end
        {hi_o, lo_o} <= {hi, lo};

        cp0_reg_we_o <= `DISABLE;
        cp0_reg_write_addr_o <= `REG_ZERO;
        cp0_reg_data_o <= `ZERO_WORD;

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
            OP_JALR : wreg_data_o <= pc + 8;
            OP_JAL, OP_BLTZAL, OP_BGEZAL : begin wreg_write_o <= `ENABLE;  wreg_data_o <= pc + 8; end
            OP_LB, OP_LBU, OP_LH, OP_LHU, OP_LW : mem_oper_addr <= add_u;
            OP_SB, OP_SH, OP_SW : begin mem_oper_addr <= reg1; mem_oper_data <= reg2; end
            OP_MTC0 : begin cp0_reg_we_o <= `ENABLE; cp0_reg_write_addr_o <= reg2[`REG_ADDR_BUS]; cp0_reg_data_o <= reg1; end
            OP_MFC0 : wreg_data_o <= cp0_data;
            //OP_CLZ  : 
            //OP_CLO  : 
            default: begin
            end
        endcase
    end
end
    
endmodule