module flash_test(
    input clk, rst,
    input Flash_addr_t    bus_addr,
    input Bit_t           read_op, 
    output Word_t         bus_data_read,
    input Word_t          bus_data_write
);


flash_controller flash_ctl_instance(
    .clk(clk),
    .rst(rst),

    .bus_addr(bus_addr),    //总线地址
    .read_op(read_op),      //读信号
    .bus_data_read(bus_data_read),
    .bus_data_write(bus_data_write),

    //Flash存储器信号，参考 JS28F640 芯片手册
    .flash_a(fake_flash_instance.flash_a),      //Flash地址，a0仅在8bit模式有效，16bit模式无意义
    .flash_d(fake_flash_instance.flash_d),      //Flash数据
    .flash_rp_n(fake_flash_instance.flash_rp_n),         //Flash复位信号，低有效
    .flash_vpen(fake_flash_instance.flash_vpen),         //Flash写保护信号，低电平时不能擦除、烧写
    .flash_ce_n(fake_flash_instance.flash_ce_n),         //Flash片选信号，低有效
    .flash_oe_n(fake_flash_instance.flash_oe_n),         //Flash读使能信号，低有效
    .flash_we_n(fake_flash_instance.flash_we_n),         //Flash写使能信号，低有效
    .flash_byte_n(fake_flash_instance.flash_byte_n)      //Flash 8bit模式选择，低有效。在使用flash的16位模式时请设为1
);


fake_flash fake_flash_instance(
    .flash_a(flash_ctl_instance.flash_a),
    .flash_d(flash_ctl_instance.flash_d),
    .flash_rp_n(flash_ctl_instance.flash_rp_n),         //Flash复位信号，低有效
    .flash_vpen(flash_ctl_instance.flash_vpen),         //Flash写保护信号，低电平时不能擦除、烧写
    .flash_ce_n(flash_ctl_instance.flash_ce_n),         //Flash片选信号，低有效
    .flash_oe_n(flash_ctl_instance.flash_oe_n),         //Flash读使能信号，低有效
    .flash_we_n(flash_ctl_instance.flash_we_n),         //Flash写使能信号，低有效
    .flash_byte_n(flash_ctl_instance.flash_byte_n)      //Flash 8bit模式选择，低有效。在使用flash的16位模式时请设为1
);
endmodule