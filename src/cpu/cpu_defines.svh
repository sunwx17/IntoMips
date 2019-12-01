`ifndef CPU_DEFINES_SVH
`define CPU_DEFINES_SVH

`include "defines.svh"


`define PC_RESET_ADDR   32'h8fc00000
//`define PC_RESET_ADDR   32'h80000000

`define PC_INTERRUPT    32'h8002a180
`define PC_SYSCALL      32'h8002a180
`define PC_INVALID_INST 32'h8002a180
`define PC_OV           32'h8002a180
`define PC_TLB_INVALID  32'h8002a180
`define PC_TLB_REFILL   32'h8002a000



//instruction
`define OPCODE_WIDTH        6
`define OPCODE_BUS          `OPCODE_WIDTH - 1:0
typedef logic[`OPCODE_BUS]  Opcode_t;      

//inside instruction
`define SA_WIDTH                6   
typedef logic[`SA_WIDTH - 1:0]  Sa_t;

`define ADDR_IN_INST                26
typedef logic[`ADDR_IN_INST - 1:0]  Addr_in_inst_t;

`define MASK_WIDTH                4
typedef logic[`MASK_WIDTH - 1:0]  Mask_t;

`define STALL_WIDTH                6
typedef logic[`STALL_WIDTH - 1:0]  Stall_t;

`define SEL_WIDTH               3
typedef logic[`SEL_WIDTH - 1:0] Sel_t;

//cp0
`define CP0_INDEX       0
`define CP0_RANDOM      1
`define CP0_ENTRYLO0    2
`define CP0_ENTRYLO1    3
`define CP0_CONTEXT     4
`define CP0_PAGEMASK    5
`define CP0_WIRED       6
`define CP0_BADVADDR    8
`define CP0_COUNT       9
`define CP0_ENTRYHI     10
`define CP0_COMPARE     11
`define CP0_STATUS      12
`define CP0_CAUSE       13
`define CP0_EPC         14
//`define CP0_PRID        15
`define CP0_CONFIG      16

`define CP0_EBASE       15
//`define CP0_CONFIG_1    16

`define CP0_STATUS_INIT 32'b0001_0000_0000_0000_0000_0000_0000_0000
`define CP0_CONFIG_INIT 32'b0001_1110_0000_0000_0000_0000_0000_0000//16

`define CP0_REGS_CAN_WRITE(waddr) (waddr == `CP0_COUNT  || waddr == `CP0_COMPARE || waddr == `CP0_STATUS || waddr == `CP0_EPC || waddr == `CP0_EBASE || waddr == `CP0_INDEX || waddr == `CP0_ENTRYLO0 || waddr == `CP0_ENTRYLO1 || waddr == `CP0_CONTEXT || waddr == `CP0_WIRED || waddr == `CP0_ENTRYHI)
`define CP0_REGS_CAN_WRITE_WITH_MASK(waddr) (waddr == `CP0_CAUSE)

`define CP0_CAUSE_MASK  32'b0000_0000_1100_0000_0000_0011_0000_0000

//Cause
`define CP0_CAUSE_BD    31
`define CP0_CAUSE_R     30
`define CP0_CAUSE_CE    29:28
`define CP0_CAUSE_DC    27
`define CP0_CAUSE_PCI   26
`define CP0_CAUSE_IV    23
`define CP0_CAUSE_WP    22
`define CP0_CAUSE_IP    15:8
`define CP0_CAUSE_IP_H  15:10
`define CP0_CAUSE_IP_S  9:8
`define CP0_CAUSE_EXCCODE 6:2

//status
`define CP0_STATUS_CU   31:28
`define CP0_STATUS_IM   15:8
`define CP0_STATUS_UM   4
`define CP0_STATUS_ERL  2
`define CP0_STATUS_EXL  1
`define CP0_STATUS_IE   0

//EntryHi
`define CP0_ENTRYHI_VPN2    31:13
`define CP0_ENTRYHI_ASID    7:0

//pagemask
`define CP0_PAGEMASK_MASK   28:13

//context
`define CP0_CONTEXT_PTEBASE 31:23
`define CP0_CONTEXT_BADVPN2 22:4

`define ADDR_VPN2   31:13


//EntryLo
`define CP0_ENTRYLO_PFN 25:6//have to be 20 bits
`define CP0_ENTRYLO_C   5:3
`define CP0_ENTRYLO_D   2
`define CP0_ENTRYLO_V   1
`define CP0_ENTRYLO_G   0

typedef struct packed {
    Bit_t   interrupt;
    Bit_t   syscall;
    Bit_t   invalid_inst;
    Bit_t   ov;
    Bit_t   eret;
    Bit_t   inst_tlb_refill;
    Bit_t   inst_tlb_invalid;
    Bit_t   data_tlb_refill_load;
    Bit_t   data_tlb_invalid_load;
    Bit_t   data_tlb_refill_store;
    Bit_t   data_tlb_invalid_store;
} Excp_set_t;

`define NO_EXCP {$bits(Excp_set_t){1'b0}}

typedef enum {
    EXC_INTERRUPT, EXC_SYSCALL, EXC_INVALID_INST, EXC_OV, EXC_ERET,
    EXC_INST_TLB_REFILL, EXC_INST_TLB_INVALID,
    EXC_DATA_TLB_REFILL_LOAD, EXC_DATA_TLB_INVALID_LOAD, 
    EXC_DATA_TLB_REFILL_STORE, EXC_DATA_TLB_INVALID_STORE,
    EXC_NO
} Excp_t;




/*`define EXCP_TYPE_INTERRUPT     32'h00000001
`define EXCP_TYPE_SYSCALL       32'h00000008
`define EXCP_TYPE_INVALID_INST  32'h0000000a
`define EXCP_TYPE_OV            32'h0000000c
`define EXCP_TYPE_ERET          32'h0000000e*/

//`define NEED_CHANGE_BD(excp_code) ((excp_code == `EXCP_TYPE_INTERRUPT) || (((excp_code == `EXCP_TYPE_SYSCALL) || (excp_code == `EXCP_TYPE_INVALID_INST) || (excp_code == `EXCP_TYPE_OV)) && cp0_regs[`CP0_STATUS][`CP0_STATUS_EXL] == `DISABLE))

`define ORDINARY_EXCEPTION(excp_code) ((excp_code == EXC_SYSCALL) || (excp_code == EXC_INVALID_INST) || (excp_code == EXC_OV) || (excp_code == EXC_INST_TLB_REFILL) || (excp_code == EXC_INST_TLB_INVALID) || (excp_code == EXC_DATA_TLB_REFILL_LOAD) || (excp_code == EXC_DATA_TLB_INVALID_LOAD) || (excp_code == EXC_DATA_TLB_REFILL_STORE) || (excp_code == EXC_DATA_TLB_INVALID_STORE))

`define EXC_CODE_INTERRUPT      5'b00000
`define EXC_CODE_TLBL           5'b00010
`define EXC_CODE_TLBS           5'b00011
`define EXC_CODE_SYSCALL        5'b01000
`define EXC_CODE_INVALID_INST   5'b01010
`define EXC_CODE_OV             5'b01100
//`define EXC_CODE_ERET           5'b00000



//operator
typedef enum {
    OP_NOP, OP_SSNOP,
    OP_AND, OP_OR, OP_XOR, OP_NOR,
    OP_ANDI, OP_ORI, OP_XORI, OP_LUI,
    OP_SLL, OP_SRA, OP_SRL,
    OP_SLLV, OP_SRAV, OP_SRLV,
    OP_MOVN, OP_MOVZ, OP_MFHI, OP_MFLO, OP_MTHI, OP_MTLO,
    OP_ADD, OP_ADDU, OP_ADDI ,OP_ADDIU, OP_SUB, OP_SUBU,
    OP_SLT, OP_SLTU, OP_SLTI, OP_SLTIU,
    OP_CLO, OP_CLZ,
    OP_MUL, OP_MULT, OP_MULTU,
    OP_J, OP_JAL, OP_JR, OP_JALR,
    OP_BEQ, OP_BGTZ, OP_BLEZ, OP_BNE, OP_BLTZ, OP_BLTZAL, OP_BGEZ, OP_BGEZAL,
    OP_LB, OP_LBU, OP_LH, OP_LHU, OP_LW, OP_SB, OP_SH, OP_SW,
    OP_MTC0, OP_MFC0,
    OP_SYSCALL, OP_ERET,
    OP_TLBP, OP_TLBR, OP_TLBWI, OP_TLBWR, 
    OP_INVALID
} Oper_t;

`define OPER_TYPE_I_U OP_ANDI, OP_ORI, OP_XORI, OP_LUI
`define OPER_TYPE_I_S OP_ADDI, OP_ADDIU, OP_SLTI, OP_SLTIU, OP_LB, OP_LBU, OP_LH, OP_LHU, OP_LW
`define OPER_TYPE_I_B OP_BEQ, OP_BGTZ, OP_BLEZ, OP_BNE, OP_BLTZ, OP_BLTZAL, OP_BGEZ, OP_BGEZAL
`define OPER_TYPE_I_SS OP_SB, OP_SH, OP_SW
`define OPER_TYPE_J OP_J, OP_JAL
`define OPER_TYPE_R_0 OP_AND, OP_OR, OP_XOR, OP_NOR, OP_SLLV, OP_SRAV, OP_SRLV, OP_MOVN, OP_MOVZ, OP_MFHI, OP_MFLO, OP_MTHI, OP_MTLO, OP_ADD, OP_ADDU, OP_SUB, OP_SUBU, OP_SLT, OP_SLTU, OP_CLO, OP_CLZ, OP_MUL, OP_MULT, OP_MULTU, OP_JR, OP_JALR
`define OPER_TYPE_R_1 OP_SLL, OP_SRA, OP_SRL
`define OPER_TYPE_CP0 OP_MTC0, OP_MFC0
`define OPER_TYPE_N OP_SYSCALL, OP_ERET, OP_TLBP, OP_TLBR, OP_TLBWI, OP_TLBWR

`define NEED_WRITE_HILO(op) (op == OP_MTHI || op == OP_MTLO || op == OP_MULT ||op == OP_MULTU) 
`define NEED_LINK(op) (op == OP_JAL || op == OP_BLTZAL || op == OP_BGEZAL)
`define NEED_SAVE(op) (op == OP_SB || op == OP_SH || op == OP_SW)
`define NEED_LOAD(op) (op == OP_LB || op == OP_LBU || op == OP_LH || op == OP_LHU || op == OP_LW)
`define NEXT_IN_DELAYSLOT(op) (op == OP_J || op == OP_JAL || op == OP_JR || op == OP_JALR || op == OP_BEQ || op == OP_BGTZ || op == OP_BLEZ || op == OP_BNE || op == OP_BLTZ || op == OP_BLTZAL || op == OP_BGEZ || op == OP_BGEZAL)


//opcode
`define OPCODE_SPEC  6'b000000
`define OPCODE_SPEC2 6'b011100
`define OPCODE_REGIMM 6'b000001
`define OPCODE_COP0  6'b010000

`define OPCODE_ANDI 6'b001100
`define OPCODE_ORI  6'b001101
`define OPCODE_XORI 6'b001110
`define OPCODE_LUI  6'b001111

`define OPCODE_ADDI  6'b001000
`define OPCODE_ADDIU 6'b001001
`define OPCODE_SLTI  6'b001010
`define OPCODE_SLTIU 6'b001011

`define OPCODE_J   6'b000010
`define OPCODE_JAL 6'b000011

`define OPCODE_BEQ  6'b000100
`define OPCODE_BGTZ 6'b000111
`define OPCODE_BLEZ 6'b000110
`define OPCODE_BNE  6'b000101

`define OPCODE_LB   6'b100000
`define OPCODE_LBU  6'b100100
`define OPCODE_LH   6'b100001
`define OPCODE_LHU  6'b100101
`define OPCODE_LW   6'b100011

`define OPCODE_SB   6'b101000
`define OPCODE_SH   6'b101001
`define OPCODE_SW   6'b101011




//spec_opcode
`define SPEC_OPCODE_AND  6'b100100
`define SPEC_OPCODE_OR   6'b100101
`define SPEC_OPCODE_XOR  6'b100110
`define SPEC_OPCODE_NOR  6'b100111

`define SPEC_OPCODE_SLL  6'b000000
`define SPEC_OPCODE_SRL  6'b000010
`define SPEC_OPCODE_SRA  6'b000011
`define SPEC_OPCODE_SLLV 6'b000100
`define SPEC_OPCODE_SRLV 6'b000110
`define SPEC_OPCODE_SRAV 6'b000111

`define SPEC_OPCODE_MOVN 6'b001011
`define SPEC_OPCODE_MOVZ 6'b001010
`define SPEC_OPCODE_MFHI 6'b010000
`define SPEC_OPCODE_MFLO 6'b010010
`define SPEC_OPCODE_MTHI 6'b010001
`define SPEC_OPCODE_MTLO 6'b010011

`define SPEC_OPCODE_ADD  6'b100000
`define SPEC_OPCODE_ADDU 6'b100001
`define SPEC_OPCODE_SUB  6'b100010
`define SPEC_OPCODE_SUBU 6'b100011
`define SPEC_OPCODE_SLT  6'b101010
`define SPEC_OPCODE_SLTU 6'b101011

`define SPEC_OPCODE_MULT  6'b011000
`define SPEC_OPCODE_MULTU 6'b011001

`define SPEC_OPCODE_JR   6'b001000
`define SPEC_OPCODE_JALR 6'b001001

`define SPEC_OPCODE_SYSCALL 6'b001100

//spec2
`define SPEC2_OPCODE_CLZ 6'b100000
`define SPEC2_OPCODE_CLO 6'b100001

`define SPEC2_OPCODE_MUL 6'b000010

//regimm
`define REGIMM_OPCODE_BLTZ   5'b00000
`define REGIMM_OPCODE_BLTZAL 5'b10000
`define REGIMM_OPCODE_BGEZ   5'b00001
`define REGIMM_OPCODE_BGEZAL 5'b10001

//cop0
`define COP0_OPCODE_MTC0    5'b00100
`define COP0_OPCODE_MFC0    5'b00000

`define COP0_OPCODE_FUNC_TLBP   6'b001000
`define COP0_OPCODE_FUNC_TLBR   6'b000001
`define COP0_OPCODE_FUNC_TLBWI  6'b000010
`define COP0_OPCODE_FUNC_TLBWR  6'b000110

`define COP0_OPCODE_FUNC_ERET   6'b011000



typedef logic[1:0]  Doublebit_t;
typedef logic[2:0]  Triblebit_t;
typedef logic[3:0]  Fourbit_t;

typedef logic[12:0] Page_mask_t;


// mmu
`define TLB_ENTRY_NUM       16
`define TLB_ENTRY_NUM_LOG2        4
typedef logic[`TLB_ENTRY_NUM_LOG2 - 1:0]    TLB_index_t;
// (vpn[31:13], asid[7:0]) entry_hi, (pfn[31:6], c[5:3], d[2], v[1], g[0]) entry_lo1,2 
`define TLB_ENTRY_WIDTH 96
typedef logic[`TLB_ENTRY_NUM * `TLB_ENTRY_WIDTH - 1:0] TLB_entries_t;

`endif
