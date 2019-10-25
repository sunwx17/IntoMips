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
Reg_data_t  cp0_count_o;
Reg_data_t  cp0_compare_o;
Reg_data_t  cp0_status_o;
Reg_data_t  cp0_cause_o;
Reg_data_t  cp0_epc_o;
Reg_data_t  cp0_config_o;
Reg_data_t  cp0_prid_o;

Word_t      cp0_exception_type_i;
Inst_addr_t cp0_pc_i;
Bit_t       cp0_is_in_delayslot_i;



cp0 cp0_instance(
    .clk, 
    .rst,
    .we_i(cp0_we_i),
    .waddr_i(cp0_waddr_i),
    .wdata_i(cp0_wdata_i),
    .raddr_i(cp0_raddr_i),
    .int_i(int_i),
    .data_o(cp0_data_o),
    .count_o(cp0_count_o),
    .compare_o(cp0_compare_o),
    .status_o(cp0_status_o),
    .cause_o(cp0_cause_o),
    .epc_o(cp0_epc_o),
    .config_o(cp0_config_o),
    .prid_o(cp0_prid_o),
    .timer_int_o(timer_int_o),
    .exception_type_i(cp0_exception_type_i),
    .pc_i(cp0_pc_i),
    .is_in_delayslot_i(cp0_is_in_delayslot_i) 
);


Bit_t    stallreq_from_id;
Bit_t    stallreq_from_ex;
Stall_t  stall;


Word_t      mem_cp0_epc_o;
Inst_addr_t new_pc;
Bit_t       flush;


ctrl ctrl_instance(
    .stallreq_from_id(stallreq_from_id),
    .stallreq_from_ex(stallreq_from_ex),
    .stall(stall),
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
    .pc(rom_addr_o),
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

//stage if_id
if_id if_id_instance(
    .clk,
    .rst,
    .if_pc(rom_addr_o),
    .if_inst(rom_data_i),
    .id_pc(id_pc_i),
    .id_inst(id_inst_i),
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


Word_t      id_exception_type_o;
Word_t      ex_exception_type_i;
Word_t      ex_exception_type_o;


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
    .exception_type_o(id_exception_type_o)
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
    .ex_exception_type(ex_exception_type_i) 
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
    .mem_oper_addr(ex_mem_oper_addr_o),
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
    .pc_o(ex_pc_o) 
);

//connext ex_mem and mem
Bit_t       mem_wreg_write_i;
Reg_addr_t  mem_wreg_addr_i;
Word_t      mem_wreg_data_i;

Oper_t      mem_oper_i;
Word_t      mem_mem_oper_addr_i;
Word_t      mem_mem_oper_data_i;

Word_t      mem_exception_type_i;
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
    .ex_mem_oper_addr(ex_mem_oper_addr_o),
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
    .mem_pc(mem_pc_i) 
);



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
    .cp0_epc_o(mem_cp0_epc_o) 
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
    .flush
);



/*always @ (posedge clk) begin
    $display("exception 0x%x", mem_exception_type_i);    
end*/


endmodule
