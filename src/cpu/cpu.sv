`include "cpu_defines.svh"

module cpu(
    input               clk, rst,
    input   Inst_t      rom_data_i,
    output  Inst_addr_t rom_addr_o,  
    output  Bit_t       rom_ce_o,

    input   Word_t      ram_data_i,
    output  Word_t      ram_addr_o,
    output  Word_t      ram_data_o,
    output  Bit_t       ram_re_o,
    output  Bit_t       ram_we_o,
    output  Mask_t      ram_mask_o,

    input   Bit_t       stallreq_from_bus,

    input   Bit_t[5:0]  int_i, //???
    output  Bit_t       timer_int_o 
);

/*always @ (posedge clk) begin
    if (ram_we_o == `ENABLE) begin
        $display("write 0x%x to 0x%0x", ram_data_o, ram_addr_o);
    end else if(ram_re_o == `ENABLE) begin
        $display("read 0x%x from 0x%0x", ram_data_i, ram_addr_o);
    end 
end*/

//mmu
Word_t  inst_addr_v;
Word_t  data_addr_v;
Word_t  inst_addr_p;
Word_t  data_addr_p;

assign rom_addr_o = inst_addr_p;
//assign ram_addr_o = data_addr_p;

Bit_t   inst_miss;
Bit_t   inst_valid;
Bit_t   data_miss;
Bit_t   data_valid;

Word_t  bad_addr_v;



//wire about regfile
Bit_t       reg_write_enable;
Reg_addr_t  reg_write_addr;
Reg_data_t  reg_write_data;
Bit_t       reg_read_enable_1;
Reg_addr_t  reg_read_addr_1;
Bit_t       reg_read_enable_2;
Reg_addr_t  reg_read_addr_2;
Reg_data_t  reg_data_1;
Reg_data_t  reg_data_2;

//regfile
registers registers_instance(
    .clk,
    .rst,
    .write_enable(reg_write_enable),
    .write_addr(reg_write_addr),
    .write_data(reg_write_data),
    .read_enable_1(reg_read_enable_1),
    .read_addr_1(reg_read_addr_1),
    .read_enable_2(reg_read_enable_2),
    .read_addr_2(reg_read_addr_2),
    .data_1(reg_data_1),
    .data_2(reg_data_2)
);

Bit_t       cp0_we_i;
Reg_addr_t  cp0_waddr_i;
Reg_data_t  cp0_wdata_i;
Reg_addr_t  cp0_raddr_i;
Reg_data_t  cp0_data_o;


Reg_data_t  cp0_index_o;
Reg_data_t  cp0_random_o;
Reg_data_t  cp0_entrylo0_o;
Reg_data_t  cp0_entrylo1_o;
Reg_data_t  cp0_context_o;
Reg_data_t  cp0_pagemask_o;
Reg_data_t  cp0_wired_o;
Reg_data_t  cp0_entryhi_o;


Reg_data_t  cp0_count_o;
Reg_data_t  cp0_compare_o;
Reg_data_t  cp0_status_o;
Reg_data_t  cp0_cause_o;
Reg_data_t  cp0_epc_o;
Reg_data_t  cp0_config_o;
//Reg_data_t  cp0_prid_o;
Reg_data_t  cp0_ebase_o;

Reg_data_t  cp0_breakpoint_o;

Excp_t      cp0_exception_type_i;
Inst_addr_t cp0_pc_i;
Bit_t       cp0_is_in_delayslot_i;

Bit_t       cp0_tlbr_op;
Reg_data_t  cp0_entryhi_i;
Reg_data_t  cp0_entrylo0_i;
Reg_data_t  cp0_entrylo1_i;

Bit_t       cp0_tlbp_op;
Reg_data_t  cp0_index_i;

Bit_t[7:0]  asid;
Bit_t       user_mode;


Bit_t   tlb_p;
Bit_t   tlb_r;
Bit_t   tlb_wi;
Bit_t   tlb_wr;


assign asid = cp0_entryhi_o[`CP0_ENTRYHI_ASID];
assign user_mode = cp0_status_o[`CP0_STATUS_UM] & (~cp0_status_o[`CP0_STATUS_ERL]) & (cp0_status_o[`CP0_STATUS_EXL]);
assign cp0_tlbr_op = tlb_r;

assign cp0_tlbp_op = tlb_p;


cp0 cp0_instance(
    .clk, 
    .rst,
    .we_i(cp0_we_i),
    .waddr_i(cp0_waddr_i),
    .wdata_i(cp0_wdata_i),
    .raddr_i(cp0_raddr_i),
    .int_i(int_i),
    .data_o(cp0_data_o),

    .index_o(cp0_index_o),
    .random_o(cp0_random_o),
    .entrylo0_o(cp0_entrylo0_o),
    .entrylo1_o(cp0_entrylo1_o),
    .context_o(cp0_context_o),
    .pagemask_o(cp0_pagemask_o),
    .wired_o(cp0_wired_o),
    .entryhi_o(cp0_entryhi_o),


    .count_o(cp0_count_o),
    .compare_o(cp0_compare_o),
    .status_o(cp0_status_o),
    .cause_o(cp0_cause_o),
    .epc_o(cp0_epc_o),
    .config_o(cp0_config_o),
    //.prid_o(cp0_prid_o),
    .ebase_o(cp0_ebase_o),

    .breakpoint_o(cp0_breakpoint_o),

    .tlbr_op(cp0_tlbr_op),
    .entryhi_i(cp0_entryhi_i),
    .entrylo0_i(cp0_entrylo0_i),
    .entrylo1_i(cp0_entrylo1_i),

    .tlbp_op(cp0_tlbp_op),
    .index_i(cp0_index_i),

    .bad_addr_v,

    .timer_int_o(timer_int_o),
    .exception_type_i(cp0_exception_type_i),
    .pc_i(cp0_pc_i),
    .is_in_delayslot_i(cp0_is_in_delayslot_i),
    .stallreq_bus(stallreq_from_bus)
);


Bit_t    stallreq_from_id;
Bit_t    stallreq_from_ex;
Stall_t  stall;


Word_t      mem_cp0_epc_o;
Inst_addr_t new_pc;
Bit_t       flush;


ctrl ctrl_instance(
    .rst,
    .stallreq_from_bus(stallreq_from_bus),
    .stallreq_from_id(stallreq_from_id),
    .stallreq_from_ex(stallreq_from_ex),
    .stall(stall),
    .cp0_ebase_i(cp0_ebase_o),
    .cp0_epc_i(mem_cp0_epc_o),
    .exception_type_i(cp0_exception_type_i),
    .new_pc(new_pc),
    .flush(flush) 
);




//branch
Bit_t branch_flag;
Inst_addr_t branch_target_addr;

//pc
pc_reg pc_reg_instance(
    .clk,
    .rst,
    //.pc(rom_addr_o),
    .pc(inst_addr_v),
    .ce(rom_ce_o),
    .branch_flag_i(branch_flag),
    .branch_target_addr_i(branch_target_addr),
    .stall,
    .flush,
    .new_pc 
);

//connect if_id and id
Inst_addr_t id_pc_i;
Inst_t      id_inst_i;
Excp_set_t  id_exception_type_i;


Inst_addr_t id_inst_addr_v_i;
Inst_addr_t id_inst_addr_v_o;
Inst_addr_t ex_inst_addr_v_i;
Inst_addr_t ex_inst_addr_v_o;
Inst_addr_t mem_inst_addr_v_i;
Word_t mem_data_addr_v_i;

//stage if_id
if_id if_id_instance(
    .clk,
    .rst,
    .if_pc(inst_addr_v),
    .if_inst(rom_data_i),
    .if_miss(inst_miss),
    .if_valid(inst_valid),
    .id_pc(id_pc_i),
    .id_inst(id_inst_i),
    .id_exception_type(id_exception_type_i),
    .if_inst_addr_v(inst_addr_v),
    .id_inst_addr_v(id_inst_addr_v_i),
    .stall,
    .flush
);


//connect id and id_ex
Oper_t      id_oper_o;
Word_t      id_reg1_o;
Word_t      id_reg2_o;
Bit_t       id_wreg_write_o;
Reg_addr_t  id_wreg_addr_o;
Inst_addr_t id_pc_o;


//connext ex and ex_mem
Bit_t       ex_wreg_write_o;
Reg_addr_t  ex_wreg_addr_o;
Word_t      ex_wreg_data_o;
Inst_addr_t ex_pc_o;

//connect mem and mem_wb
Bit_t       mem_wreg_write_o;
Reg_addr_t  mem_wreg_addr_o;
Word_t      mem_wreg_data_o;


//memory operations and load conflict
Oper_t      ex_oper_o;


Bit_t       id_is_in_delayslot_i;
Bit_t       id_is_in_delayslot_o;
Bit_t       id_next_is_in_delayslot_o;

Bit_t       ex_is_in_delayslot_i;
Bit_t       ex_is_in_delayslot_o;


Excp_set_t  id_exception_type_o;
Excp_set_t  ex_exception_type_i;
Excp_set_t  ex_exception_type_o;


//stage id
id id_instance(
    .rst,
    .pc(id_pc_i),
    .inst(id_inst_i),
    .reg1_data_i(reg_data_1),
    .reg2_data_i(reg_data_2),
    .reg1_read_o(reg_read_enable_1),
    .reg2_read_o(reg_read_enable_2),
    .reg1_addr_o(reg_read_addr_1),
    .reg2_addr_o(reg_read_addr_2),
    .oper_o(id_oper_o),
    .reg1_o(id_reg1_o),
    .reg2_o(id_reg2_o),
    .wreg_write_o(id_wreg_write_o),
    .wreg_addr_o(id_wreg_addr_o),
    .ex_oper_i(ex_oper_o),
    .ex_wreg_write_i(ex_wreg_write_o),
    .ex_wreg_addr_i(ex_wreg_addr_o),
    .ex_wreg_data_i(ex_wreg_data_o),
    .mem_wreg_write_i(mem_wreg_write_o),
    .mem_wreg_addr_i(mem_wreg_addr_o),
    .mem_wreg_data_i(mem_wreg_data_o), 
    .is_in_delayslot_i(id_is_in_delayslot_i),
    .is_in_delayslot_o(id_is_in_delayslot_o),
    .next_is_in_delayslot_o(id_next_is_in_delayslot_o),
    .branch_flag_o(branch_flag),
    .branch_target_addr_o(branch_target_addr),
    .pc_o(id_pc_o),
    .stallreq(stallreq_from_id),
    .inst_addr_v_i(id_inst_addr_v_i),
    .inst_addr_v_o(id_inst_addr_v_o),
    .exception_type_i(id_exception_type_i),
    .exception_type_o(id_exception_type_o),
    .breakpoint_i(cp0_breakpoint_o)
);





//connect id_ex and ex
Oper_t      ex_oper_i;
Word_t      ex_reg1_i;
Word_t      ex_reg2_i;
Bit_t       ex_wreg_write_i;
Reg_addr_t  ex_wreg_addr_i;
Inst_addr_t ex_pc_i; 

//stage id_ex
id_ex id_ex_instance(
    .clk,
    .rst,
    .id_oper(id_oper_o),
    .id_reg1(id_reg1_o),
    .id_reg2(id_reg2_o),
    .id_wreg_write(id_wreg_write_o),
    .id_wreg_addr(id_wreg_addr_o),
    .id_pc(id_pc_o),
    .ex_oper(ex_oper_i),
    .ex_reg1(ex_reg1_i),
    .ex_reg2(ex_reg2_i),
    .ex_wreg_write(ex_wreg_write_i),
    .ex_wreg_addr(ex_wreg_addr_i),
    .ex_pc(ex_pc_i),
    .id_is_in_delayslot(id_is_in_delayslot_o),
    .ex_is_in_delayslot(ex_is_in_delayslot_i),
    .next_is_in_delayslot_i(id_next_is_in_delayslot_o),
    .is_in_delayslot_o(id_is_in_delayslot_i),
    .stall,
    .flush,
    .id_exception_type(id_exception_type_o),
    .ex_exception_type(ex_exception_type_i),
    .id_inst_addr_v(id_inst_addr_v_o),
    .ex_inst_addr_v(ex_inst_addr_v_i) 
);


/*always @ (negedge clk) begin
    $display("0x%x < 0x%x", ex_reg2_i, ex_reg1_i);
    $display("imm : 0x%x", id_instance.id_type_instance.imm);
    //$display("reg2 data: 0x%x", reg_data_2);
    //$display("ex write: %0d $%0d=0x%x", ex_wreg_write_o, ex_wreg_addr_o, ex_wreg_data_o);
    //$display("mem write: %0d $%0d=0x%x", mem_wreg_write_o, mem_wreg_addr_o, mem_wreg_data_o);
    //$display("wb write: %0d $%0d=0x%x", reg_write_enable, reg_write_addr, reg_write_data);
end*/

//hilo
Bit_t       ex_whilo_o;
Word_t      ex_hi_o;
Word_t      ex_lo_o;

Bit_t       mem_whilo_i;
Word_t      mem_hi_i;
Word_t      mem_lo_i;

Bit_t       mem_whilo_o;
Word_t      mem_hi_o;
Word_t      mem_lo_o;

Bit_t       hilo_we;
Word_t      hi_i;
Word_t      lo_i;
Word_t      hi_o;
Word_t      lo_o;



hilo hilo_instance(
    .clk,
    .rst,
    .we(hilo_we),
    .hi_i,
    .lo_i,
    .hi_o,
    .lo_o
);

//memory operations
Word_t      ex_mem_oper_addr_o;
Word_t      ex_mem_oper_data_o;


//cp0
Bit_t       ex_cp0_reg_we_o;
Reg_addr_t  ex_cp0_reg_write_addr_o;
Word_t      ex_cp0_reg_data_o;

Bit_t       mem_cp0_reg_we_i;
Reg_addr_t  mem_cp0_reg_write_addr_i;
Word_t      mem_cp0_reg_data_i;

Bit_t       mem_cp0_reg_we_o;
Reg_addr_t  mem_cp0_reg_write_addr_o;
Word_t      mem_cp0_reg_data_o;



//stage ex
ex ex_instance(
    .rst,
    .pc(ex_pc_i),
    .oper(ex_oper_i),
    .reg1(ex_reg1_i),
    .reg2(ex_reg2_i),
    .wreg_write_i(ex_wreg_write_i),
    .wreg_addr_i(ex_wreg_addr_i),
    .wreg_write_o(ex_wreg_write_o),
    .wreg_addr_o(ex_wreg_addr_o),
    .wreg_data_o(ex_wreg_data_o),
    .hi_i(hi_o),
    .lo_i(lo_o),
    .mem_whilo_i(mem_whilo_o),
    .mem_hi_i(mem_hi_o),
    .mem_lo_i(mem_lo_o),
    .wb_whilo_i(hilo_we),
    .wb_hi_i(hi_i),
    .wb_lo_i(lo_i),
    .whilo_o(ex_whilo_o),
    .hi_o(ex_hi_o),
    .lo_o(ex_lo_o),
    .oper_o(ex_oper_o),
    //.mem_oper_addr(ex_mem_oper_addr_o),
    .mem_oper_addr(data_addr_v),
    .mem_oper_data(ex_mem_oper_data_o),
    .is_in_delayslot_i(ex_is_in_delayslot_i),
    .is_in_delayslot_o(ex_is_in_delayslot_o),
    .stallreq(stallreq_from_ex),
    .mem_cp0_reg_we(mem_cp0_reg_we_o),
    .mem_cp0_reg_write_addr(mem_cp0_reg_write_addr_o),
    .mem_cp0_reg_data(mem_cp0_reg_data_o),
    .wb_cp0_reg_we(cp0_we_i),
    .wb_cp0_reg_write_addr(cp0_waddr_i),
    .wb_cp0_reg_data(cp0_wdata_i),
    .cp0_reg_data_i(cp0_data_o),
    .cp0_reg_read_addr_o(cp0_raddr_i),
    .cp0_reg_we_o(ex_cp0_reg_we_o),
    .cp0_reg_write_addr_o(ex_cp0_reg_write_addr_o),
    .cp0_reg_data_o(ex_cp0_reg_data_o),
    .exception_type_i(ex_exception_type_i),
    .exception_type_o(ex_exception_type_o),
    .inst_addr_v_i(ex_inst_addr_v_i),
    .inst_addr_v_o(ex_inst_addr_v_o),
    .data_miss,
    .data_valid,
    .pc_o(ex_pc_o) 
);

//connext ex_mem and mem
Bit_t       mem_wreg_write_i;
Reg_addr_t  mem_wreg_addr_i;
Word_t      mem_wreg_data_i;

Oper_t      mem_oper_i;
Word_t      mem_mem_oper_addr_i;
Word_t      mem_mem_oper_data_i;

Excp_set_t  mem_exception_type_i;
Bit_t       mem_is_in_delayslot_i;
Inst_addr_t mem_pc_i;

//stage ex_mem
ex_mem ex_mem_instance(
    .clk,
    .rst,
    .ex_wreg_write(ex_wreg_write_o),
    .ex_wreg_addr(ex_wreg_addr_o),
    .ex_wreg_data(ex_wreg_data_o),
    .mem_wreg_write(mem_wreg_write_i),
    .mem_wreg_addr(mem_wreg_addr_i),
    .mem_wreg_data(mem_wreg_data_i),
    .ex_whilo(ex_whilo_o),
    .ex_hi(ex_hi_o),
    .ex_lo(ex_lo_o),
    .mem_whilo(mem_whilo_i),
    .mem_hi(mem_hi_i),
    .mem_lo(mem_lo_i),
    .ex_oper(ex_oper_o),
    //.ex_mem_oper_addr(ex_mem_oper_addr_o),
    .ex_mem_oper_addr(data_addr_p),
    .ex_mem_oper_data(ex_mem_oper_data_o),
    .mem_oper(mem_oper_i),
    .mem_mem_oper_addr(mem_mem_oper_addr_i),
    .mem_mem_oper_data(mem_mem_oper_data_i),
    .stall,
    .ex_cp0_reg_we(ex_cp0_reg_we_o),
    .ex_cp0_reg_write_addr(ex_cp0_reg_write_addr_o),
    .ex_cp0_reg_data(ex_cp0_reg_data_o),
    .mem_cp0_reg_we(mem_cp0_reg_we_i),
    .mem_cp0_reg_write_addr(mem_cp0_reg_write_addr_i),
    .mem_cp0_reg_data(mem_cp0_reg_data_i),
    .flush,
    .ex_exception_type(ex_exception_type_o),
    .ex_is_in_delayslot(ex_is_in_delayslot_o),
    .ex_pc(ex_pc_o),
    .mem_exception_type(mem_exception_type_i),
    .mem_is_in_delayslot(mem_is_in_delayslot_i),
    .mem_pc(mem_pc_i),
    .ex_inst_addr_v(ex_inst_addr_v_o),
    .mem_inst_addr_v(mem_inst_addr_v_i),
    .ex_data_addr_v(data_addr_v),
    .mem_data_addr_v(mem_data_addr_v_i) 
);


Bit_t   mem_tlb_p_o;
Bit_t   mem_tlb_r_o;
Bit_t   mem_tlb_wi_o;
Bit_t   mem_tlb_wr_o;




//stage mem
mem mem_instance(
    .rst,
    .wreg_write_i(mem_wreg_write_i),
    .wreg_addr_i(mem_wreg_addr_i),
    .wreg_data_i(mem_wreg_data_i),
    .wreg_write_o(mem_wreg_write_o),
    .wreg_addr_o(mem_wreg_addr_o),
    .wreg_data_o(mem_wreg_data_o),
    .whilo_i(mem_whilo_i),
    .hi_i(mem_hi_i),
    .lo_i(mem_lo_i),
    .whilo_o(mem_whilo_o),
    .hi_o(mem_hi_o),
    .lo_o(mem_lo_o),
    .oper_i(mem_oper_i),
    .mem_oper_addr(mem_mem_oper_addr_i),
    .mem_oper_data(mem_mem_oper_data_i),
    .mem_data_i(ram_data_i),
    //.mem_addr_o(data_addr_v),
    .mem_addr_o(ram_addr_o),
    .mem_data_o(ram_data_o),
    .mem_we_o(ram_we_o),
    .mem_re_o(ram_re_o),
    .mem_mask_o(ram_mask_o),
    .cp0_reg_we_i(mem_cp0_reg_we_i),
    .cp0_reg_write_addr_i(mem_cp0_reg_write_addr_i),
    .cp0_reg_data_i(mem_cp0_reg_data_i),
    .cp0_reg_we_o(mem_cp0_reg_we_o),
    .cp0_reg_write_addr_o(mem_cp0_reg_write_addr_o),
    .cp0_reg_data_o(mem_cp0_reg_data_o),
    .exception_type_i(mem_exception_type_i),
    .pc_i(mem_pc_i),
    .is_in_delayslot_i(mem_is_in_delayslot_i),
    .cp0_status_i(cp0_status_o),
    .cp0_cause_i(cp0_cause_o),
    .cp0_epc_i(cp0_epc_o),
    .wb_cp0_reg_we(cp0_we_i),
    .wb_cp0_reg_write_addr(cp0_waddr_i),
    .wb_cp0_reg_data(cp0_wdata_i),
    .exception_type_o(cp0_exception_type_i),
    .pc_o(cp0_pc_i),
    .is_in_delayslot_o(cp0_is_in_delayslot_i),
    .cp0_epc_o(mem_cp0_epc_o),
    .inst_addr_v(mem_inst_addr_v_i),
    .data_addr_v(mem_data_addr_v_i),
    .bad_addr_v,
    .tlb_p(mem_tlb_p_o),
    .tlb_r(mem_tlb_r_o),
    .tlb_wi(mem_tlb_wi_o),
    .tlb_wr(mem_tlb_wr_o)
);

//stage mem_wb
mem_wb mem_wb_instance(
    .clk, 
    .rst,
    .mem_wreg_write(mem_wreg_write_o),
    .mem_wreg_addr(mem_wreg_addr_o),
    .mem_wreg_data(mem_wreg_data_o),
    .wb_wreg_write(reg_write_enable),
    .wb_wreg_addr(reg_write_addr),
    .wb_wreg_data(reg_write_data),
    .mem_whilo(mem_whilo_o),
    .mem_hi(mem_hi_o),
    .mem_lo(mem_lo_o),
    .wb_whilo(hilo_we),
    .wb_hi(hi_i),
    .wb_lo(lo_i),
    .stall,
    .mem_cp0_reg_we(mem_cp0_reg_we_o),
    .mem_cp0_reg_write_addr(mem_cp0_reg_write_addr_o),
    .mem_cp0_reg_data(mem_cp0_reg_data_o),
    .wb_cp0_reg_we(cp0_we_i),
    .wb_cp0_reg_write_addr(cp0_waddr_i),
    .wb_cp0_reg_data(cp0_wdata_i),
    .mem_tlb_p(mem_tlb_p_o),
    .mem_tlb_r(mem_tlb_r_o),
    .mem_tlb_wi(mem_tlb_wi_o),
    .mem_tlb_wr(mem_tlb_wr_o),
    .wb_tlb_p(tlb_p),
    .wb_tlb_r(tlb_r),
    .wb_tlb_wi(tlb_wi),
    .wb_tlb_wr(tlb_wr),
    .flush
);

//Byte_t cp0_asid;
//Bit_t is_user_mode;
Inst_addr_t inst_vir_addr, inst_phy_addr;
Word_t  data_vir_addr, data_phy_addr;
Bit_t mmu_miss1, mmu_d1, mmu_v1, mmu_illegal1, mmu_miss2, mmu_d2, mmu_v2, mmu_illegal2;
Triblebit_t mmu_c1, mmu_c2;
Word_t tlb_p_index;



TLB_index_t tlb_rw_index;
Bit_t tlb_rw_we;

assign tlb_rw_index = tlb_wr ? cp0_random_o : cp0_index_o;
assign tlb_rw_we = tlb_wr | tlb_wi;


// mmu just test now
mmu mmu_instance(
    .clk,
    .rst,
    .asid,
    .is_user(user_mode),
    .inst_vaddr(inst_addr_v),
    .data_vaddr(data_addr_v),

    .inst_paddr(inst_addr_p),
    .miss1(inst_miss),
    .d1(mmu_d1),
    .v1(inst_valid),
    .illegal1(mmu_illegal1),
    .c1(mmu_c1),

    .data_paddr(data_addr_p),
    .miss2(data_miss),
    .d2(mmu_d2),
    .v2(data_valid),
    .illegal2(mmu_illegal2),
    .c2(mmu_c2),

    .tlb_rw_index,
    .tlb_rw_we,
    
    .entry_hi_i(cp0_entryhi_o),
    .entry_lo1_i(cp0_entrylo0_o),
    .entry_lo2_i(cp0_entrylo1_o),

    .entry_hi_o(cp0_entryhi_i),
    .entry_lo1_o(cp0_entrylo0_i),
    .entry_lo2_o(cp0_entrylo1_i),

    .tlb_p_index(cp0_index_i)
);



/*always @ (posedge clk) begin
    $display("exception 0x%x", mem_exception_type_i);    
end*/


endmodule
