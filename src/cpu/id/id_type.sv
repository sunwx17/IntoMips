`include "cpu_defines.svh"

module id_type(
    input   Inst_t      inst,

    output  Oper_t      oper,
    output  Bit_t       reg1_read,
    output  Bit_t       reg2_read,
    output  Reg_addr_t  reg1_addr,
    output  Reg_addr_t  reg2_addr,
    output  Bit_t       wreg_write,
    output  Reg_addr_t  wreg_addr,
    output  Word_t      immediate
);

Opcode_t        opcode;
Reg_addr_t      rs;
Reg_addr_t      rt;
Reg_addr_t      rd;
Sa_t            sa;
Opcode_t        func;
Addr_in_inst_t  addr;
Halfword_t      imm;

assign opcode = inst[31:26];
assign rs     = inst[25:21];
assign rt     = inst[20:16];
assign rd     = inst[15:11];
assign sa     = inst[10:6];
assign func   = inst[5:0];
assign addr   = inst[25:0];
assign imm    = inst[15:0];


always_comb begin
    oper <= OP_INVALID;
    case (opcode)
        `OPCODE_SPEC : begin
            case (func)
                `SPEC_OPCODE_AND  : oper <= OP_AND  ;
                `SPEC_OPCODE_OR   : oper <= OP_OR   ;
                `SPEC_OPCODE_XOR  : oper <= OP_XOR  ;
                `SPEC_OPCODE_NOR  : oper <= OP_NOR  ;
                `SPEC_OPCODE_SLL  : oper <= OP_SLL  ;
                `SPEC_OPCODE_SRL  : oper <= OP_SRL  ;
                `SPEC_OPCODE_SRA  : oper <= OP_SRA  ;
                `SPEC_OPCODE_SLLV : oper <= OP_SLLV ;
                `SPEC_OPCODE_SRLV : oper <= OP_SRLV ;
                `SPEC_OPCODE_SRAV : oper <= OP_SRAV ;
                `SPEC_OPCODE_MOVN : oper <= OP_MOVN ;
                `SPEC_OPCODE_MOVZ : oper <= OP_MOVZ ;
                `SPEC_OPCODE_MFHI : oper <= OP_MFHI ;
                `SPEC_OPCODE_MFLO : oper <= OP_MFLO ;
                `SPEC_OPCODE_MTHI : oper <= OP_MTHI ;
                `SPEC_OPCODE_MTLO : oper <= OP_MTLO ;
                `SPEC_OPCODE_ADD  : oper <= OP_ADD  ;
                `SPEC_OPCODE_ADDU : oper <= OP_ADDU ;
                `SPEC_OPCODE_SUB  : oper <= OP_SUB  ;
                `SPEC_OPCODE_SUBU : oper <= OP_SUBU ;
                `SPEC_OPCODE_SLT  : oper <= OP_SLT  ;
                `SPEC_OPCODE_SLTU : oper <= OP_SLTU ;
                `SPEC_OPCODE_MULT : oper <= OP_MULT ;
                `SPEC_OPCODE_MULTU: oper <= OP_MULTU;
                `SPEC_OPCODE_JR   : oper <= OP_JR   ;
                `SPEC_OPCODE_JALR : oper <= OP_JALR ;
                `SPEC_OPCODE_SYSCALL : oper <= OP_SYSCALL;
                default: oper <= OP_INVALID;
            endcase
        end
        `OPCODE_SPEC2 : begin
            case(func)
                `SPEC2_OPCODE_CLZ : oper <= OP_CLZ;
                `SPEC2_OPCODE_CLO : oper <= OP_CLO;
                `SPEC2_OPCODE_MUL : oper <= OP_MUL;
                default: oper <= OP_INVALID;
            endcase
        end
        `OPCODE_REGIMM : begin
            case (rt)
                `REGIMM_OPCODE_BLTZ   : oper <= OP_BLTZ  ;
                `REGIMM_OPCODE_BLTZAL : oper <= OP_BLTZAL;
                `REGIMM_OPCODE_BGEZ   : oper <= OP_BGEZ  ;
                `REGIMM_OPCODE_BGEZAL : oper <= OP_BGEZAL;
                default: oper <= OP_INVALID;
            endcase
        end
        `OPCODE_COP0 : begin
            case (rs)
                `COP0_OPCODE_MTC0 : oper <= OP_MTC0;
                `COP0_OPCODE_MFC0 : oper <= OP_MFC0;
                5'b10000 : begin
                    case(func)
                        `COP0_OPCODE_FUNC_ERET : oper <= OP_ERET ;
                        `COP0_OPCODE_FUNC_TLBP : oper <= OP_TLBP ;
                        `COP0_OPCODE_FUNC_TLBR : oper <= OP_TLBR ;
                        `COP0_OPCODE_FUNC_TLBWI: oper <= OP_TLBWI;
                        `COP0_OPCODE_FUNC_TLBWR: oper <= OP_TLBWR;
                        default: oper <= OP_INVALID;
                    endcase
                end
                default: oper <= OP_INVALID;
            endcase

        end
        `OPCODE_ANDI : oper <= OP_ANDI ;
        `OPCODE_ORI  : oper <= OP_ORI  ;
        `OPCODE_XORI : oper <= OP_XORI ;
        `OPCODE_LUI  : oper <= OP_LUI  ;
        `OPCODE_ADDI : oper <= OP_ADDI ;  
        `OPCODE_ADDIU: oper <= OP_ADDIU;  
        `OPCODE_SLTI : oper <= OP_SLTI ;  
        `OPCODE_SLTIU: oper <= OP_SLTIU;  
        `OPCODE_J    : oper <= OP_J    ;
        `OPCODE_JAL  : oper <= OP_JAL  ;
        `OPCODE_BEQ  : oper <= OP_BEQ  ;
        `OPCODE_BGTZ : oper <= OP_BGTZ ;
        `OPCODE_BLEZ : oper <= OP_BLEZ ;
        `OPCODE_BNE  : oper <= OP_BNE  ;
        `OPCODE_LB   : oper <= OP_LB   ;
        `OPCODE_LBU  : oper <= OP_LBU  ;
        `OPCODE_LH   : oper <= OP_LH   ;
        `OPCODE_LHU  : oper <= OP_LHU  ;
        `OPCODE_LW   : oper <= OP_LW   ;
        `OPCODE_SB   : oper <= OP_SB   ;
        `OPCODE_SH   : oper <= OP_SH   ;
        `OPCODE_SW   : oper <= OP_SW   ;
        default: oper <= OP_INVALID;
    endcase
end

always_comb begin
    case (oper)
        `OPER_TYPE_I_U : begin
            wreg_write <= `ENABLE;
            wreg_addr  <= rt;
            reg1_read  <= `ENABLE;
            reg2_read  <= `DISABLE;
            reg1_addr  <= rs;
            reg2_addr  <= `REG_ZERO;
            immediate  <= {`ZERO_HWORD, imm}; 
        end
        `OPER_TYPE_I_S : begin
            wreg_write <= `ENABLE;
            wreg_addr  <= rt;
            reg1_read  <= `ENABLE;
            reg2_read  <= `DISABLE;
            reg1_addr  <= rs;
            reg2_addr  <= `REG_ZERO;
            immediate  <= {{16{imm[15]}}, imm}; 
        end
        `OPER_TYPE_I_B : begin
            wreg_write <= `DISABLE;
            wreg_addr  <= 5'b11111;
            reg1_read  <= `ENABLE;
            reg2_read  <= `ENABLE;
            reg1_addr  <= rs;
            reg2_addr  <= rt;
            immediate  <= {{16{imm[15]}}, imm}; 
        end
        `OPER_TYPE_I_SS : begin
            wreg_write <= `DISABLE;
            wreg_addr  <= `REG_ZERO;
            reg1_read  <= `ENABLE;
            reg2_read  <= `ENABLE;
            reg1_addr  <= rs;
            reg2_addr  <= rt;
            immediate  <= {{16{imm[15]}}, imm}; 
        end        
        `OPER_TYPE_J   : begin
            wreg_write <= `DISABLE;
            wreg_addr  <= 5'b11111;
            reg1_read  <= `DISABLE;
            reg2_read  <= `DISABLE;
            reg1_addr  <= `REG_ZERO;
            reg2_addr  <= `REG_ZERO;
            immediate  <= {6'b0, addr}; 
        end
        `OPER_TYPE_R_0 : begin
            wreg_write <= `ENABLE;
            wreg_addr  <= rd;
            reg1_read  <= `ENABLE;
            reg2_read  <= `ENABLE;
            reg1_addr  <= rs;
            reg2_addr  <= rt;
            immediate  <= `REG_ZERO;
        end
        `OPER_TYPE_R_1 : begin
            wreg_write <= `ENABLE;
            wreg_addr  <= rd;
            reg1_read  <= `DISABLE;
            reg2_read  <= `ENABLE;
            reg1_addr  <= `REG_ZERO;
            reg2_addr  <= rt;
            immediate  <= {27'b0, sa};
        end
        OP_MTC0 : begin
            wreg_write <= `DISABLE;
            wreg_addr  <= `REG_ZERO;
            reg1_read  <= `ENABLE;
            reg2_read  <= `DISABLE;
            reg1_addr  <= rt;
            reg2_addr  <= `REG_ZERO;
            immediate  <= {27'b0, rd};
        end
        OP_MFC0 : begin
            wreg_write <= `ENABLE;
            wreg_addr  <= rt;
            reg1_read  <= `DISABLE;
            reg2_read  <= `DISABLE;
            reg1_addr  <= `REG_ZERO;
            reg2_addr  <= `REG_ZERO;
            immediate  <= {27'b0, rd};
        end
        `OPER_TYPE_N : begin 
            wreg_write <= `DISABLE;
            wreg_addr  <= `REG_ZERO;
            reg1_read  <= `DISABLE;
            reg2_read  <= `DISABLE;
            reg1_addr  <= `REG_ZERO;
            reg2_addr  <= `REG_ZERO;
            immediate  <= `ZERO_WORD;
        end
        default : begin end
    endcase
end







    
endmodule