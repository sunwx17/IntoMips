`include "cpu_defines.svh"

module top_tb(
);

Bit_t clock_50, rst;    

initial begin
    clock_50 = 1'b0;
    forever #10 clock_50 = ~ clock_50;
end

initial begin
    rst = 1'b1;
    $readmemh({"memory_byte", ".mem"}, ext_sram.sram_mem);
    //$readmemh({"vga_ascii_demo", ".mem"}, ext_sram.sram_mem);
    //$readmemh({"kernel", ".mem"}, base_sram.sram_mem);
    $readmemh({"ucore-kernel-initrd", ".mem"}, base_sram.sram_mem);
    #200 rst = 1'b0;
    #5000000 rst = 1'b1;
    #5002000 $stop;
end

Word_t flash_addr;
intomips_top intomips_top_instance(
    .clk_50M(clock_50),           //50MHz 时钟输入
    .reset_btn(rst),         //BTN6手动复位按钮�?关，带消抖电路，按下时为1


   /* //CPLD串口控制器信�?
    output wire uart_rdn,         //读串口信号，低有�?
    output wire uart_wrn,         //写串口信号，低有�?
    input wire uart_dataready,    //串口数据准备�?
    input wire uart_tbre,         //发�?�数据标�?
    input wire uart_tsre,         //数据发�?�完毕标�?*/

    //BaseRAM信号
    .base_ram_data(base_sram.ram_data),
    .base_ram_addr(base_sram.ram_addr),
    .base_ram_be_n(base_sram.ram_be_n),
    .base_ram_ce_n(base_sram.ram_ce_n),
    .base_ram_oe_n(base_sram.ram_oe_n),
    .base_ram_we_n(base_sram.ram_we_n), 

    //ExtRAM信号
    .ext_ram_data(ext_sram.ram_data),
    .ext_ram_addr(ext_sram.ram_addr),
    .ext_ram_be_n(ext_sram.ram_be_n),
    .ext_ram_ce_n(ext_sram.ram_ce_n),
    .ext_ram_oe_n(ext_sram.ram_oe_n),
    .ext_ram_we_n(ext_sram.ram_we_n),

    //flash信号
    .flash_a(flash_addr),
    .flash_d(fake_flash.DQ),
    .flash_rp_n(fake_flash.RP_N),
    .flash_vpen(fake_flash.WP_N),
    .flash_ce_n(fake_flash.E_N),
    .flash_oe_n(fake_flash.G_N),
    .flash_we_n(fake_flash.W_N),


    .uart_dataready(1'b0)
);

fake_sram ext_sram(
    .clk(clock_50),
    .ram_data(intomips_top_instance.ext_ram_data),
    .ram_addr(intomips_top_instance.ext_ram_addr),
    .ram_be_n(intomips_top_instance.ext_ram_be_n),
    .ram_ce_n(intomips_top_instance.ext_ram_ce_n),
    .ram_oe_n(intomips_top_instance.ext_ram_oe_n),
    .ram_we_n(intomips_top_instance.ext_ram_we_n) 
);

fake_sram0 base_sram(
    .clk(clock_50),
    .ram_data(intomips_top_instance.base_ram_data),
    .ram_addr(intomips_top_instance.base_ram_addr),
    .ram_be_n(intomips_top_instance.base_ram_be_n),
    .ram_ce_n(intomips_top_instance.base_ram_ce_n),
    .ram_oe_n(intomips_top_instance.base_ram_oe_n),
    .ram_we_n(intomips_top_instance.base_ram_we_n) 
);

parameter FLASH_INIT_FILE = "kernel.bin";

x28fxxxp30 #(.FILENAME_MEM(FLASH_INIT_FILE)) fake_flash(
    .A(flash_addr[1+:22]), 
    .DQ(intomips_top_instance.flash_d), 
    .W_N(intomips_top_instance.flash_we_n), 
    .G_N(intomips_top_instance.flash_oe_n),
    .E_N(intomips_top_instance.flash_ce_n), 
    .L_N(1'b0),
    .K(1'b0),
    .WP_N(intomips_top_instance.flash_vpen),
    .RP_N(intomips_top_instance.flash_rp_n),
    .VDD('d3300), 
    .VDDQ('d3300), 
    .VPP('d1800), 
    .Info(1'b1)
);








endmodule