`include "cpu_defines.svh"

module cpu(
    input               clk, rst,
    input   Inst_t      rom_data_i,
    output  Inst_addr_t rom_addr_o,  
    output  Bit_t       rom_ce_o
);

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

//pc
pc_reg pc_reg_instance(
    .clk,
    .rst,
    .pc(rom_addr_o),
    .ce(rom_ce_o)
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
    .id_inst(id_inst_i)
);


//connect id and id_ex
Oper_t      id_oper_o;
Word_t      id_reg1_o;
Word_t      id_reg2_o;
Bit_t       id_wreg_write_o;
Reg_addr_t  id_wreg_addr_o;


//connext ex and ex_mem
Bit_t       ex_wreg_write_o;
Reg_addr_t  ex_wreg_addr_o;
Word_t      ex_wreg_data_o;

//connect mem and mem_wb
Bit_t       mem_wreg_write_o;
Reg_addr_t  mem_wreg_addr_o;
Word_t      mem_wreg_data_o;


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
    .ex_wreg_write_i(ex_wreg_write_o),
    .ex_wreg_addr_i(ex_wreg_addr_o),
    .ex_wreg_data_i(ex_wreg_data_o),
    .mem_wreg_write_i(mem_wreg_write_o),
    .mem_wreg_addr_i(mem_wreg_addr_o),
    .mem_wreg_data_i(mem_wreg_data_o) 
);



//connect id_ex and ex
Oper_t      ex_oper_i;
Word_t      ex_reg1_i;
Word_t      ex_reg2_i;
Bit_t       ex_wreg_write_i;
Reg_addr_t  ex_wreg_addr_i;

//stage id_ex
id_ex id_ex_instance(
    .clk,
    .rst,
    .id_oper(id_oper_o),
    .id_reg1(id_reg1_o),
    .id_reg2(id_reg2_o),
    .id_wreg_write(id_wreg_write_o),
    .id_wreg_addr(id_wreg_addr_o),
    .ex_oper(ex_oper_i),
    .ex_reg1(ex_reg1_i),
    .ex_reg2(ex_reg2_i),
    .ex_wreg_write(ex_wreg_write_i),
    .ex_wreg_addr(ex_wreg_addr_i)
);


/*always @ (negedge clk) begin
    $display("0x%x << 0x%x", ex_reg2_i, ex_reg1_i);
    //$display("reg2 data: 0x%x", reg_data_2);
    //$display("ex write: %0d $%0d=0x%x", ex_wreg_write_o, ex_wreg_addr_o, ex_wreg_data_o);
    //$display("mem write: %0d $%0d=0x%x", mem_wreg_write_o, mem_wreg_addr_o, mem_wreg_data_o);
    //$display("wb write: %0d $%0d=0x%x", reg_write_enable, reg_write_addr, reg_write_data);
end*/


//stage ex
ex ex_instance(
    .rst,
    .oper(ex_oper_i),
    .reg1(ex_reg1_i),
    .reg2(ex_reg2_i),
    .wreg_write_i(ex_wreg_write_i),
    .wreg_addr_i(ex_wreg_addr_i),
    .wreg_write_o(ex_wreg_write_o),
    .wreg_addr_o(ex_wreg_addr_o),
    .wreg_data_o(ex_wreg_data_o)
);

//connext ex_mem and mem
Bit_t       mem_wreg_write_i;
Reg_addr_t  mem_wreg_addr_i;
Word_t      mem_wreg_data_i;

//stage ex_mem
ex_mem ex_mem_instance(
    .clk,
    .rst,
    .ex_wreg_write(ex_wreg_write_o),
    .ex_wreg_addr(ex_wreg_addr_o),
    .ex_wreg_data(ex_wreg_data_o),
    .mem_wreg_write(mem_wreg_write_i),
    .mem_wreg_addr(mem_wreg_addr_i),
    .mem_wreg_data(mem_wreg_data_i)
);



//stage mem
mem mem_instance(
    .rst,
    .wreg_write_i(mem_wreg_write_i),
    .wreg_addr_i(mem_wreg_addr_i),
    .wreg_data_i(mem_wreg_data_i),
    .wreg_write_o(mem_wreg_write_o),
    .wreg_addr_o(mem_wreg_addr_o),
    .wreg_data_o(mem_wreg_data_o)
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
    .wb_wreg_data(reg_write_data)
);



endmodule
