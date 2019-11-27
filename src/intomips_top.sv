`default_nettype wire

module intomips_top(
    input wire clk_50M,           //50MHz 时钟输入
    input wire clk_11M0592,       //11.0592MHz 时钟输入

    input wire clock_btn,         //BTN5手动时钟按钮�?关，带消抖电路，按下时为1
    input wire reset_btn,         //BTN6手动复位按钮�?关，带消抖电路，按下时为1

    input  [3:0]  touch_btn,  //BTN1~BTN4，按钮开关，按下时为1
    input  wire[31:0] dip_sw,     //32位拨码开关，拨到“ON”时�?1
    output wire[15:0] leds,       //16位LED，输出时1点亮
    output wire[7:0]  dpy0,       //数码管低位信号，包括小数点，输出1点亮
    output wire[7:0]  dpy1,       //数码管高位信号，包括小数点，输出1点亮

    //CPLD串口控制器信�?
    output wire uart_rdn,         //读串口信号，低有�?
    output wire uart_wrn,         //写串口信号，低有�?
    input wire uart_dataready,    //串口数据准备�?
    input wire uart_tbre,         //发�?�数据标�?
    input wire uart_tsre,         //数据发�?�完毕标�?

    //BaseRAM信号
    inout wire[31:0] base_ram_data,  //BaseRAM数据，低8位与CPLD串口控制器共�?
    output wire[19:0] base_ram_addr, //BaseRAM地址
    output wire[3:0] base_ram_be_n,  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持�?0
    output wire base_ram_ce_n,       //BaseRAM片�?�，低有�?
    output wire base_ram_oe_n,       //BaseRAM读使能，低有�?
    output wire base_ram_we_n,       //BaseRAM写使能，低有�?

    //ExtRAM信号
    inout wire[31:0] ext_ram_data,  //ExtRAM数据
    output wire[19:0] ext_ram_addr, //ExtRAM地址
    output wire[3:0] ext_ram_be_n,  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持�?0
    output wire ext_ram_ce_n,       //ExtRAM片�?�，低有�?
    output wire ext_ram_oe_n,       //ExtRAM读使能，低有�?
    output wire ext_ram_we_n,       //ExtRAM写使能，低有�?

    //直连串口信号
    output wire txd,  //直连串口发�?�端
    input  wire rxd,  //直连串口接收�?

    //Flash存储器信号，参�?? JS28F640 芯片手册
    output wire [22:0]flash_a,      //Flash地址，a0仅在8bit模式有效�?16bit模式无意�?
    inout  wire [15:0]flash_d,      //Flash数据
    output wire flash_rp_n,         //Flash复位信号，低有效
    output wire flash_vpen,         //Flash写保护信号，低电平时不能擦除、烧�?
    output wire flash_ce_n,         //Flash片�?�信号，低有�?
    output wire flash_oe_n,         //Flash读使能信号，低有�?
    output wire flash_we_n,         //Flash写使能信号，低有�?
    output wire flash_byte_n,       //Flash 8bit模式选择，低有效。在使用flash�?16位模式时请设�?1

    //USB 控制器信号，参�?? SL811 芯片手册
    output wire sl811_a0,
    //inout  wire[7:0] sl811_d,     //USB数据线与网络控制器的dm9k_sd[7:0]共享
    output wire sl811_wr_n,
    output wire sl811_rd_n,
    output wire sl811_cs_n,
    output wire sl811_rst_n,
    output wire sl811_dack_n,
    input  wire sl811_intrq,
    input  wire sl811_drq_n,

    //网络控制器信号，参�?? DM9000A 芯片手册
    output wire dm9k_cmd,
    inout  wire[15:0] dm9k_sd,
    output wire dm9k_iow_n,
    output wire dm9k_ior_n,
    output wire dm9k_cs_n,
    output wire dm9k_pwrst_n,
    input  wire dm9k_int,

    //图像输出信号
    output wire[2:0] video_red,    //红色像素�?3�?
    output wire[2:0] video_green,  //绿色像素�?3�?
    output wire[1:0] video_blue,   //蓝色像素�?2�?
    output wire video_hsync,       //行同步（水平同步）信�?
    output wire video_vsync,       //场同步（垂直同步）信�?
    output wire video_clk,         //像素时钟输出
    output wire video_de           //行数据有效信号，用于区分消隐�?
);

/*assign leds[0] = uart_rdn;
assign leds[1] = uart_wrn;
assign leds[2] = uart_dataready;
assign leds[3] = uart_tbre;
assign leds[4] = uart_tsre;
assign leds[5] = uart_mode[0];
assign leds[6] = uart_mode[1];*/

//reg a = 1'b0;

reg clk_25M = 1'b0;
reg clk_125 = 1'b0;
//cpu导入
always @(negedge clk_50M) begin
    clk_25M <= ~clk_25M;
end
always @(negedge clk_25M) begin
    clk_125 <= ~clk_125;
end

Bit_t       need_inst;
Bit_t       need_data;


Inst_addr_t inst_addr_v;
Inst_addr_t data_addr_v;
Bit_t       inst_in_ext;
Bit_t       data_in_ext;

Bit_t       inst_in_base;
Bit_t       data_in_base;

//inst cannot be in flash
Bit_t       data_in_flash;

Bit_t       inst_in_bootrom;
Bit_t       data_in_bootrom;

Bit_t       data_in_uart_data;
Bit_t       data_in_uart_status;
Bit_t       data_in_vga;

Inst_addr_t inst_addr;
Inst_addr_t data_addr;

Bit_t       ext_read_op;
Bit_t       ext_write_op;
Inst_addr_t ext_addr;
Word_t      ext_data_read;
Word_t      ext_data_write;
Mask_t      ext_mask;

Bit_t       base_read_op;
Bit_t       base_write_op;
Inst_addr_t base_addr;
Word_t      base_data_read;
Word_t      base_data_write;
Mask_t      base_mask;

Bit_t       ext_read_op_ex;
Bit_t       ext_write_op_ex;
Inst_addr_t ext_addr_ex;
Word_t      ext_data_read_ex;
Word_t      ext_data_write_ex;
Mask_t      ext_mask_ex;

Bit_t       base_read_op_ex;
Bit_t       base_write_op_ex;
Inst_addr_t base_addr_ex;
Word_t      base_data_read_ex;
Word_t      base_data_write_ex;
Mask_t      base_mask_ex;

Bit_t       flash_read_op;
Word_t      flash_addr;
Word_t      flash_data_read;


Bit_t       uart_read_op;
Bit_t       uart_write_op;
Byte_t      uart_data_read;
Byte_t      uart_data_write;
Serial_mode_t   uart_mode;

Bit_t       vga_write_op;
Word_t      vga_data_write;
Word_t      vga_addr;


Bit_t       inst_read_op;
Word_t      inst_data;

Bit_t       data_read_op;
Bit_t       data_write_op;
Word_t      data_data_read;
Word_t      data_data_write;
Mask_t      data_mask;

Bit_t       ext_stallreq;
Bit_t       base_stallreq;
Bit_t       stallreq;




Bit_t   bootrom_read_op;
Word_t  bootrom_addr;
Word_t  bootrom_data_read;

Bit_t   bootrom_read_op_ex;
Word_t  bootrom_addr_ex;
Word_t  bootrom_data_read_ex;



assign inst_addr = {10'b0, inst_addr_v[21:0]};
assign data_addr = {10'b0, data_addr_v[21:0]};

always_comb begin
    inst_in_ext <= `ADDR_IN_EXT(inst_addr_v);
    inst_in_base <= `ADDR_IN_BASE(inst_addr_v);
    inst_in_bootrom <= `ADDR_IN_BOOTROM(inst_addr_v);
    data_in_ext <= `ADDR_IN_EXT(data_addr_v);
    data_in_base <= `ADDR_IN_BASE(data_addr_v);
    data_in_uart_data <= `ADDR_IN_UART_DATA(data_addr_v);
    data_in_uart_status <= `ADDR_IN_UART_STATUS(data_addr_v);
    data_in_vga <= `ADDR_IN_VGA(data_addr_v);
    data_in_bootrom <= `ADDR_IN_BOOTROM(data_addr_v);
    data_in_flash <= `ADDR_IN_FLASH(data_addr_v);
end

always_comb begin
    uart_read_op <= `DISABLE;
    uart_write_op <= `DISABLE;
    uart_data_write <= `ZERO_WORD;

    ext_read_op <= `DISABLE;
    ext_write_op <= `DISABLE;
    ext_addr <= `ZERO_WORD;
    ext_data_write <= `ZERO_WORD;
    ext_mask <= 4'b0000;

    base_read_op <= `DISABLE;
    base_write_op <= `DISABLE;
    base_addr <= `ZERO_WORD;
    base_data_write <= `ZERO_WORD;
    base_mask <= 4'b0000;

    ext_read_op_ex <= `DISABLE;
    ext_write_op_ex <= `DISABLE;
    ext_addr_ex <= `ZERO_WORD;
    ext_data_write_ex <=  `ZERO_WORD;
    ext_mask_ex <= 4'b0000;

    base_read_op_ex <= `DISABLE;
    base_write_op_ex <= `DISABLE;
    base_addr_ex <= `ZERO_WORD;
    base_data_write_ex <=  `ZERO_WORD;
    base_mask_ex <= 4'b0000;

    flash_read_op <= `DISABLE;
    flash_addr <= `ZERO_WORD;

    stallreq <= `DISABLE;

    vga_write_op <= `DISABLE;
    vga_data_write <= `HIGH_BYTE;
    vga_addr <= `ZERO_WORD;

    
    if (data_in_uart_data || data_in_uart_status || data_in_vga) begin
        if (inst_in_ext) begin
            ext_read_op <= inst_read_op;
            ext_write_op <= `DISABLE;
            ext_addr <= inst_addr;
            ext_data_write <= `ZERO_WORD;
            ext_mask <= 4'b1111;
            inst_data <= ext_data_read;
        end else if (inst_in_base) begin
            base_read_op <= inst_read_op;
            base_write_op <= `DISABLE;
            base_addr <= inst_addr;
            base_data_write <= `ZERO_WORD;
            base_mask <= 4'b1111;
            inst_data <= base_data_read;
        end


        if (data_in_uart_data) begin
            uart_read_op <= data_read_op;
            uart_write_op <= data_write_op;
            uart_data_write <= data_data_write;
            data_data_read <= uart_data_read;
        end else if (data_in_uart_status) begin
            uart_read_op <= `DISABLE;
            uart_write_op <= `DISABLE;
            uart_data_write <= `ZERO_WORD;
            data_data_read <= {30'b0, uart_mode};
        end else begin
            //vga
            vga_write_op <= data_write_op;
            vga_data_write <= data_data_write;
            vga_addr <= data_addr_v & 32'h000fffff;
        end
    end else if ((inst_in_ext ^ data_in_ext) && (inst_in_base ^ data_in_base)) begin

        ext_read_op <= inst_in_ext ? inst_read_op : data_read_op;
        ext_write_op <= inst_in_ext ? `DISABLE : data_write_op;
        ext_addr <= inst_in_ext ? inst_addr : data_addr;
        ext_data_write <= inst_in_ext ? `ZERO_WORD : data_data_write;
        ext_mask <= inst_in_ext ? 4'b1111 : data_mask;
        
        base_read_op <= data_in_ext ? inst_read_op : data_read_op;
        base_write_op <= data_in_ext ? `DISABLE : data_write_op;
        base_addr <= data_in_ext ? inst_addr : data_addr;
        base_data_write <= data_in_ext ? `ZERO_WORD : data_data_write;
        base_mask <= data_in_ext ? 4'b1111 : data_mask;

        inst_data <= inst_in_ext ? ext_data_read : base_data_read;
        data_data_read <= data_in_ext ? ext_data_read : base_data_read;
        
    end else if ((inst_in_ext && data_in_ext) || (inst_in_base && data_in_base)) begin
        ext_read_op <= inst_in_ext ? inst_read_op : `DISABLE;
        ext_write_op <= inst_in_ext ? `DISABLE : `DISABLE;
        ext_addr <= inst_in_ext ? inst_addr : `ZERO_WORD;
        ext_data_write <= inst_in_ext ? `ZERO_WORD : `ZERO_WORD;
        ext_mask <= inst_in_ext ? 4'b1111 : 4'b0000;
        
        
        ext_read_op_ex <= data_in_ext ? data_read_op : `DISABLE;
        ext_write_op_ex <= data_in_ext ? data_write_op : `DISABLE;
        ext_addr_ex <= data_in_ext ? data_addr : `ZERO_WORD;
        ext_data_write_ex <= data_in_ext ? data_data_write : `ZERO_WORD;
        ext_mask_ex <= data_in_ext ? data_mask : 4'b0000;

        base_read_op <= inst_in_base ? inst_read_op : `DISABLE;
        base_write_op <= inst_in_base ? `DISABLE : `DISABLE;
        base_addr <= inst_in_base ? inst_addr : `ZERO_WORD;
        base_data_write <= inst_in_base ? `ZERO_WORD : `ZERO_WORD;
        base_mask <= inst_in_base ? 4'b1111 : 4'b0000;
        
        
        base_read_op_ex <= data_in_base ? data_read_op : `DISABLE;
        base_write_op_ex <= data_in_base ? data_write_op : `DISABLE;
        base_addr_ex <= data_in_base ? data_addr : `ZERO_WORD;
        base_data_write_ex <= data_in_base ? data_data_write : `ZERO_WORD;
        base_mask_ex <= data_in_base ? data_mask : 4'b0000;

        /*base_read_op <= inst_in_base ? `DISABLE : inst_read_op;
        base_write_op <= inst_in_base ? `DISABLE : `DISABLE;
        base_addr <= inst_in_base ? `ZERO_WORD : inst_addr;
        base_data_write <= inst_in_base ? `ZERO_WORD : `ZERO_WORD;
        base_mask <= inst_in_base ? 4'b0000 : 4'b1111;

        
        base_read_op_ex <= data_in_base ? `DISABLE : data_read_op;
        base_write_op_ex <= data_in_base ? `DISABLE : data_write_op;
        base_addr_ex <= data_in_base ? `ZERO_WORD : data_addr;
        base_data_write_ex <= data_in_base ? `ZERO_WORD : data_data_write;
        base_mask_ex <= data_in_base ? 4'b0000 : data_mask;*/
            
        inst_data <= inst_in_ext ? ext_data_read : base_data_read;
        data_data_read <= data_in_ext ? ext_data_read_ex : base_data_read_ex;

        stallreq <= inst_in_ext ? ext_stallreq : base_stallreq;
    end else begin

        ext_read_op <= inst_in_ext ? inst_read_op : (data_in_ext ? data_read_op : `DISABLE);
        ext_write_op <= inst_in_ext ? `DISABLE : (data_in_ext ? data_write_op : `DISABLE);
        ext_addr <= inst_in_ext ? inst_addr : (data_in_ext ? data_addr : `ZERO_WORD);
        ext_data_write <= inst_in_ext ? `ZERO_WORD : (data_in_ext ? data_data_write : `ZERO_WORD);
        ext_mask <= inst_in_ext ? 4'b1111 : (data_in_ext ? data_mask : 4'b0000);
        
        base_read_op <= inst_in_base ? inst_read_op : (data_in_base ? data_read_op : `DISABLE);
        base_write_op <= inst_in_base ? `DISABLE : (data_in_base ? data_write_op : `DISABLE);
        base_addr <= inst_in_base ? inst_addr : (data_in_base ? data_addr : `ZERO_WORD);
        base_data_write <= inst_in_base ? `ZERO_WORD : (data_in_base ? data_data_write : `ZERO_WORD);
        base_mask <= inst_in_base ? 4'b1111 : (data_in_base ? data_mask : 4'b0000);

        inst_data <= inst_in_ext ? ext_data_read : (inst_in_base ? base_data_read : `ZERO_WORD);
        data_data_read <= data_in_ext ? ext_data_read : (data_in_base ? base_data_read : `ZERO_WORD);
        

        if (data_in_flash) begin
            //data in flash
            //inst must be in ext_ram or base_ram or bootrom
            //can only use "lb"
            flash_read_op <= data_read_op;
            flash_addr <= data_addr;
            data_data_read <= flash_data_read;
        end
    end


    if (inst_in_bootrom) begin
        bootrom_read_op <= inst_read_op;
        bootrom_addr <= { 4'b0001, inst_addr_v[27:0] };
        inst_data <= bootrom_data_read;
    end

    if (data_in_bootrom) begin
        bootrom_read_op_ex <= data_read_op;
        bootrom_addr_ex <= { 4'b0001, data_addr_v[27:0] };
        data_data_read <= bootrom_data_read_ex;
    end

end


cpu cpu_instance(
    .clk(clk_125),
    .rst(reset_btn),
    .rom_data_i(inst_data),
    .rom_addr_o(inst_addr_v),
    .rom_ce_o(inst_read_op),
    .ram_data_i(data_data_read),
    .ram_addr_o(data_addr_v),
    .ram_data_o(data_data_write),
    .ram_re_o(data_read_op),
    .ram_we_o(data_write_op),
    .ram_mask_o(data_mask),
    .stallreq_from_bus(stallreq),
    .int_i({3'b0, uart_mode[1], 2'b0})
    //.timer_int_o
);


bootrom_controller bootrom_controller_instance (
    .clk(clk_25M),
    .rst(reset_btn),

    .read_op(bootrom_read_op),
    .bus_addr(bootrom_addr),
    .bus_data_read(bootrom_data_read),

    .read_op_ex(bootrom_read_op_ex),
    .bus_addr_ex(bootrom_addr_ex),
    .bus_data_read_ex(bootrom_data_read_ex) 
);






//base ram
sram_controller base_sram_controller(
    .clk(clk_25M),
    .rst(reset_btn),
    .read_op(base_read_op),
    .write_op(base_write_op),
    .bus_data_write(base_data_write),
    .bus_data_read(base_data_read),
    .bus_addr(base_addr),
    .byte_mask(base_mask),
    .read_op_ex(base_read_op_ex),
    .write_op_ex(base_write_op_ex),
    .bus_data_write_ex(base_data_write_ex),
    .bus_data_read_ex(base_data_read_ex),
    .bus_addr_ex(base_addr_ex),
    .byte_mask_ex(base_mask_ex),
    .bus_stall(base_stallreq),
    //.bus_stall
    .ram_data(base_ram_data),
    .ram_addr(base_ram_addr),
    .ram_be_n(base_ram_be_n),
    .ram_ce_n(base_ram_ce_n),
    .ram_oe_n(base_ram_oe_n),
    .ram_we_n(base_ram_we_n)
);



//ext ram store instructions
sram_controller ext_ram_controller(
    .clk(clk_25M),
    .rst(reset_btn),
    .read_op(ext_read_op),
    .write_op(ext_write_op),
    .bus_data_write(ext_data_write),
    .bus_data_read(ext_data_read),
    .bus_addr(ext_addr),
    .byte_mask(ext_mask),
    .read_op_ex(ext_read_op_ex),
    .write_op_ex(ext_write_op_ex),
    .bus_data_write_ex(ext_data_write_ex),
    .bus_data_read_ex(ext_data_read_ex),
    .bus_addr_ex(ext_addr_ex),
    .byte_mask_ex(ext_mask_ex),
    .bus_stall(ext_stallreq),
    //.bus_stall
    .ram_data(ext_ram_data),
    .ram_addr(ext_ram_addr),
    .ram_be_n(ext_ram_be_n),
    .ram_ce_n(ext_ram_ce_n),
    .ram_oe_n(ext_ram_oe_n),
    .ram_we_n(ext_ram_we_n)
);

flash_controller flash_controller_instance (
    .clk(clk_25M),
    .rst(reset_btn),
    .bus_addr(flash_addr),
    .read_op(flash_read_op),
    .bus_data_read(flash_data_read),
    .flash_a,
    .flash_d,
    .flash_rp_n,
    .flash_vpen,
    .flash_ce_n,
    .flash_oe_n,
    .flash_we_n,
    .flash_byte_n
);

/*
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
*/

//assign uart_mode = 2'b01;

assign leds[0] = uart_mode[0];
assign leds[1] = uart_mode[1];

ext_serial_controller serial_controller_instance(
    .clk(clk_50M), 
    .read_op(uart_read_op), 
    .write_op(uart_write_op),
    .bus_data_write(uart_data_write),
    .bus_data_read(uart_data_read),
    .mode(uart_mode),

    .txd,
    .rxd
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
