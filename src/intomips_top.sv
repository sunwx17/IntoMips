`default_nettype wire

module intomips_top(
    input wire clk_50M,           //50MHz 时钟输入
    input wire clk_11M0592,       //11.0592MHz 时钟输入

    input wire clock_btn,         //BTN5手动时钟按钮开关，带消抖电路，按下时为1
    input wire reset_btn,         //BTN6手动复位按钮开关，带消抖电路，按下时为1

    input  [3:0]  touch_btn,  //BTN1~BTN4，按钮开关，按下时为1
    input  wire[31:0] dip_sw,     //32位拨码开关，拨到“ON”时为1
    output wire[15:0] leds,       //16位LED，输出时1点亮
    output wire[7:0]  dpy0,       //数码管低位信号，包括小数点，输出1点亮
    output wire[7:0]  dpy1,       //数码管高位信号，包括小数点，输出1点亮

    //CPLD串口控制器信号
    output wire uart_rdn,         //读串口信号，低有效
    output wire uart_wrn,         //写串口信号，低有效
    input wire uart_dataready,    //串口数据准备好
    input wire uart_tbre,         //发送数据标志
    input wire uart_tsre,         //数据发送完毕标志

    //BaseRAM信号
    inout wire[31:0] base_ram_data,  //BaseRAM数据，低8位与CPLD串口控制器共享
    output wire[19:0] base_ram_addr, //BaseRAM地址
    output wire[3:0] base_ram_be_n,  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持为0
    output wire base_ram_ce_n,       //BaseRAM片选，低有效
    output wire base_ram_oe_n,       //BaseRAM读使能，低有效
    output wire base_ram_we_n,       //BaseRAM写使能，低有效

    //ExtRAM信号
    inout wire[31:0] ext_ram_data,  //ExtRAM数据
    output wire[19:0] ext_ram_addr, //ExtRAM地址
    output wire[3:0] ext_ram_be_n,  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持为0
    output wire ext_ram_ce_n,       //ExtRAM片选，低有效
    output wire ext_ram_oe_n,       //ExtRAM读使能，低有效
    output wire ext_ram_we_n,       //ExtRAM写使能，低有效

    //直连串口信号
    output wire txd,  //直连串口发送端
    input  wire rxd,  //直连串口接收端

    //Flash存储器信号，参考 JS28F640 芯片手册
    output wire [22:0]flash_a,      //Flash地址，a0仅在8bit模式有效，16bit模式无意义
    inout  wire [15:0]flash_d,      //Flash数据
    output wire flash_rp_n,         //Flash复位信号，低有效
    output wire flash_vpen,         //Flash写保护信号，低电平时不能擦除、烧写
    output wire flash_ce_n,         //Flash片选信号，低有效
    output wire flash_oe_n,         //Flash读使能信号，低有效
    output wire flash_we_n,         //Flash写使能信号，低有效
    output wire flash_byte_n,       //Flash 8bit模式选择，低有效。在使用flash的16位模式时请设为1

    //USB 控制器信号，参考 SL811 芯片手册
    output wire sl811_a0,
    //inout  wire[7:0] sl811_d,     //USB数据线与网络控制器的dm9k_sd[7:0]共享
    output wire sl811_wr_n,
    output wire sl811_rd_n,
    output wire sl811_cs_n,
    output wire sl811_rst_n,
    output wire sl811_dack_n,
    input  wire sl811_intrq,
    input  wire sl811_drq_n,

    //网络控制器信号，参考 DM9000A 芯片手册
    output wire dm9k_cmd,
    inout  wire[15:0] dm9k_sd,
    output wire dm9k_iow_n,
    output wire dm9k_ior_n,
    output wire dm9k_cs_n,
    output wire dm9k_pwrst_n,
    input  wire dm9k_int,

    //图像输出信号
    output wire[2:0] video_red,    //红色像素，3位
    output wire[2:0] video_green,  //绿色像素，3位
    output wire[1:0] video_blue,   //蓝色像素，2位
    output wire video_hsync,       //行同步（水平同步）信号
    output wire video_vsync,       //场同步（垂直同步）信号
    output wire video_clk,         //像素时钟输出
    output wire video_de           //行数据有效信号，用于区分消隐区
);

assign leds[0] = uart_rdn;
assign leds[1] = uart_wrn;
assign leds[2] = uart_dataready;
assign leds[3] = uart_tbre;
assign leds[4] = uart_tsre;
assign leds[5] = uart_mode[0];
assign leds[6] = uart_mode[1];

reg a = 1'b0;

//与主频反相
reg clk_25M = 1'b1;
//cpu导入
always @(posedge clk_50M) begin
    clk_25M <= ~clk_25M;
end

Inst_addr_t inst_addr_v;
Word_t      data_addr_v;
Inst_addr_t inst_addr;
Word_t      data_addr;
Bit_t       sram_read_op;
Bit_t       sram_write_op;
Word_t      sram_data_read;
Word_t      sram_data_write;
Bit_t       uart_read_op;
Bit_t       uart_write_op;
Word_t      uart_data_read;
Word_t      uart_data_write;
Serial_mode_t   uart_mode;

Bit_t       vga_write_op;
Word_t      vga_data_write;
Word_t      vga_addr;


Bit_t       cpu_read_op;
Bit_t       cpu_write_op;
Word_t      cpu_data_read;
Word_t      cpu_data_write;


always_comb begin
    if (inst_addr_v >= 32'h80000000 && inst_addr_v < 32'h80400000) begin
        inst_addr <= {10'b0, inst_addr_v[21:0]};
    end
    if (data_addr_v >= 32'h80400000 && data_addr_v < 32'h80800000) begin
        data_addr <= {10'b0, data_addr_v[21:0]};
        sram_read_op <= cpu_read_op;
        sram_write_op <= cpu_write_op;
        sram_data_write <= cpu_data_write;
        cpu_data_read <= sram_data_read;
        uart_read_op <= `DISABLE;
        uart_write_op <= `DISABLE;
        uart_data_write <= `ZERO_WORD;
        vga_write_op <= `DISABLE;
        vga_data_write <= `HIGH_BYTE;
    end else if(data_addr_v == 32'hBFD003F8) begin
        uart_read_op <= cpu_read_op;
        uart_write_op <= cpu_write_op;
        uart_data_write <= cpu_data_write;
        cpu_data_read <= uart_data_read;
        sram_read_op <= `DISABLE;
        sram_write_op <= `DISABLE;
        sram_data_write <= `ZERO_WORD;
        vga_write_op <= `DISABLE;
        vga_data_write <= `HIGH_BYTE;
    end else if (data_addr_v == 32'hBFD003FC) begin
        cpu_data_read <= {30'b0, uart_mode};
        sram_read_op <= `DISABLE;
        sram_write_op <= `DISABLE;
        sram_data_write <= `ZERO_WORD;
        uart_read_op <= `DISABLE;
        uart_write_op <= `DISABLE;
        uart_data_write <= `ZERO_WORD;
        vga_write_op <= `DISABLE;
        vga_data_write <= `HIGH_BYTE;
    end else if (data_addr_v >= 32'hBA000000 && data_addr_v < 32'hBA075300) begin
        //vga
        vga_write_op <= 1'b1;
        vga_data_write <= cpu_data_write;
        //vga_data_write <= 32'h00000007;
        vga_addr <= data_addr_v & 32'h000fffff;

        sram_read_op <= `DISABLE;
        sram_write_op <= `DISABLE;
        sram_data_write <= `ZERO_WORD;
        uart_read_op <= `DISABLE;
        uart_write_op <= `DISABLE;
        uart_data_write <= `ZERO_WORD;
    end
end

cpu cpu_instance(
    .clk(clk_25M),
    .rst(reset_btn),
    .rom_data_i(inst_ram_controller.bus_data_read),
    .rom_addr_o(inst_addr_v),
    .rom_ce_o(inst_ram_controller.read_op),
    .ram_data_i(cpu_data_read),
    .ram_addr_o(data_addr_v),
    .ram_data_o(cpu_data_write),
    .ram_re_o(cpu_read_op),
    .ram_we_o(cpu_write_op),
    .ram_mask_o(data_sram_controller.byte_mask)
    //.timer_int_o
);
//ext ram store instructions
sram_controller inst_ram_controller(
    .clk(clk_50M),
    .rst(reset_btn),
    .read_op(cpu_instance.rom_ce_o),
    .write_op(1'b0),
    //.bus_data_write(),
    .bus_data_read(cpu_instance.rom_data_i),
    .bus_addr(inst_addr),
    .byte_mask(4'b1111),
    //.bus_stall
    .ram_data(ext_ram_data),
    .ram_addr(ext_ram_addr),
    .ram_be_n(ext_ram_be_n),
    .ram_ce_n(ext_ram_ce_n),
    .ram_oe_n(ext_ram_oe_n),
    .ram_we_n(ext_ram_we_n)
);


//base ram
sram_controller data_sram_controller(
    .clk(clk_50M),
    .rst(reset_btn),
    .read_op(sram_read_op),
    .write_op(sram_write_op),
    .bus_data_write(sram_data_write),
    .bus_data_read(sram_data_read),
    .bus_addr(data_addr),
    .byte_mask(cpu_instance.ram_mask_o),
    //.bus_stall
    .ram_data(base_ram_data),
    .ram_addr(base_ram_addr),
    .ram_be_n(base_ram_be_n),
    .ram_ce_n(base_ram_ce_n),
    .ram_oe_n(base_ram_oe_n),
    .ram_we_n(base_ram_we_n)
);

serial_controller serial_controller_instance(
    .clk(clk_50M), 
    .rst(reset_btn),
    .read_op(uart_read_op), 
    .write_op(uart_write_op),
    .bus_data_write(uart_data_write),
    .bus_data_read(uart_data_read),
    .mode(uart_mode),

    .uart_rdn,        
    .uart_wrn,        
    .uart_dataready,  
    .uart_tbre,       
    .uart_tsre,       
    .uart_data(base_ram_data[7:0])
);

vga_controller vga_controller_instance(
    .clk_25M,
    .clk_50M,
    .rst(reset_btn),
    .write_op(vga_write_op),
    .bus_addr(vga_addr),
    .bus_data(vga_data_write),
    .video_red,
    .video_green,
    .video_blue,
    .video_hsync,
    .video_vsync,
    .video_clk,
    .video_de
);



//assign leds[7:0] = base_ram_data[7:0];

/*
//云端sram测试模块导入
sram_controller_cloud_tb(
    .clock_btn(clock_btn),
    .reset_btn(reset_btn),
    .base_ram_data(base_ram_data),
    .base_ram_addr(base_ram_addr),
    .base_ram_be_n(base_ram_be_n),
    .base_ram_ce_n(base_ram_ce_n),
    .base_ram_oe_n(base_ram_oe_n),
    .base_ram_we_n(base_ram_we_n),
    .leds(leds),
    .dpy0(dpy0),
    .dpy1(dpy1),
    .dip_sw(dip_sw[3:0])
);
*/
/*
//云端flash测试模块导入
flash_controller_cloud_tb(
    .clock_btn(clock_btn),
    .reset_btn(reset_btn),
    .flash_a(flash_a),
    .flash_d(flash_d),
    .flash_rp_n(flash_rp_n),
    .flash_vpen(flash_vpen),
    .flash_ce_n(flash_ce_n),
    .flash_oe_n(flash_oe_n),
    .flash_we_n(flash_we_n),
    .flash_byte_n(flash_byte_n),
    .leds(leds),
    .dpy0(dpy0),
    .dpy1(dpy1)
);
*/

/*
//云端serial测试模块导入
serial_controller_cloud_tb(
    .rst(reset_btn),
    .clk(clock_btn),
    .base_ram_ce_n(base_ram_ce_n),
    .base_ram_oe_n(base_ram_oe_n),
    .base_ram_we_n(base_ram_we_n),
    .uart_rdn(uart_rdn),
    .uart_wrn(uart_wrn),
    .uart_dataready(uart_dataready),
    .uart_tbre(uart_tbre),
    .uart_tsre(uart_tsre),
    .uart_data(base_ram_data[7:0]),
    .dip_sw(dip_sw),
    .leds(leds),
    .dpy0(dpy0),
    .dpy1(dpy1)
);
*/
endmodule
