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
    $readmemh({"kernel", ".mem"}, base_sram.sram_mem);
    #200 rst = 1'b0;
    #500000 rst = 1'b1;
    #500200 $stop;
end


intomips_top intomips_top_instance(
    .clk_50M(clock_50),           //50MHz 时钟输入
    .reset_btn(rst),         //BTN6手动复位按钮开关，带消抖电路，按下时为1


   /* //CPLD串口控制器信号
    output wire uart_rdn,         //读串口信号，低有效
    output wire uart_wrn,         //写串口信号，低有效
    input wire uart_dataready,    //串口数据准备好
    input wire uart_tbre,         //发送数据标志
    input wire uart_tsre,         //数据发送完毕标志*/

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









endmodule