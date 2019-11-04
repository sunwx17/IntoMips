`include "defines.svh"
module sram_controller_cloud_tb(
    //时钟信号
    input Bit_t clock_btn,
    input Bit_t reset_btn, 
    //BaseRAM信号
    inout wire[31:0] base_ram_data,  //BaseRAM数据，低8位与CPLD串口控制器共享
    output wire[19:0] base_ram_addr, //BaseRAM地址
    output wire[3:0] base_ram_be_n,  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持为0
    output wire base_ram_ce_n,       //BaseRAM片选，低有效
    output wire base_ram_oe_n,       //BaseRAM读使能，低有效
    output wire base_ram_we_n,       //BaseRAM写使能，低有效


    input wire[3:0] dip_sw,        //拨码开关，用于控制mask

    //数码管信号
    output wire[15:0] leds,       //16位LED，输出时1点亮
    output wire[7:0]  dpy0,       //数码管低位信号，包括小数点，输出1点亮
    output wire[7:0]  dpy1       //数码管高位信号，包括小数点，输出1点
);

wire read_op, write_op;
assign read_op = 1'b0;
assign write_op = 1'b1;

wire [31:0] data_w, data_r;
assign data_w = 32'hffff;
assign data_r = 32'h0000;
assign leds = {data_r[7:0],8'h0};

wire [19:0] addr;
assign addr = 20'b0;
wire [3:0] mask;
//assign mask = 4'b1111;
wire stall;


sram_controller ctl(
    .clk(clock_btn),
    .rst(reset_btn),
    .read_op(read_op),
    .write_op(write_op),
    .bus_data_write(data_w),
    .bus_data_read(data_r),
    .bus_addr(addr),
    .byte_mask(dip_sw),
    .bus_stall(stall),
    .ram_data(base_ram_data),
    .ram_addr(base_ram_addr),
    .ram_be_n(base_ram_be_n),
    .ram_ce_n(base_ram_ce_n),
    .ram_oe_n(base_ram_oe_n),
    .ram_we_n(base_ram_we_n)
);

reg [7:0] num;
seg7_lut segl(.oSEG1(dpy0), .iDIG(num[3:0]));
seg7_lut segh(.oSEG1(dpy1), .iDIG(num[7:4]));

always@(posedge clock_btn or posedge reset_btn) begin
    if(reset_btn) begin
        num <= 0;
    end
    else begin
        num <= num+1;
    end
end

endmodule