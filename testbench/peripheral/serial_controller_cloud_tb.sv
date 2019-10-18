`include "defines.svh"
module serial_controller_cloud_tb(
    input rst, clk,
    
    //CPLD串口控制器信号
    output Bit_t    uart_rdn,         //读串口信号，低有效
    output Bit_t    uart_wrn,         //写串口信号，低有效
    input Bit_t     uart_dataready,    //串口数据准备好
    input Bit_t     uart_tbre,         //发送数据标志
    input Bit_t     uart_tsre,         //数据发送完毕标

    inout Byte_t    uart_data,

    input  wire[31:0] dip_sw,     //32位拨码开关，拨到“ON”时为1
    output wire[15:0] leds,       //16位LED，输出时1点亮
    output wire[7:0]  dpy0,       //数码管低位信号，包括小数点，输出1点亮
    output wire[7:0]  dpy1       //数码管高位信号，包括小数点，输出1点亮
);

//串口写入测试
//通过32位拨码开关低8位，向串口写入
//手动clk运行状态机

Bit_t read_op, write_op;
assign read_op = 1'b0;
assign write_op = 1'b1;

wire[7:0] bus_data;
assign bus_data = dip_sw[7:0];


serial_controller serial_controller_instance(
    .clk(clk),
    .rst(rst),
    .read_op(read_op),
    .write_op(write_op),
    .bus_data(bus_data),
    .uart_rdn(uart_rdn),
    .uart_wrn(uart_wrn),
    .uart_dataready(uart_dataready),
    .uart_tbre(uart_tbre),
    .uart_tsre(uart_tsre)
);

reg [7:0] num;
seg7_lut segl(.oSEG1(dpy0), .iDIG(num[3:0]));
seg7_lut segh(.oSEG1(dpy1), .iDIG(num[7:4]));

always@(posedge clk or posedge rst) begin
    if(rst) begin
        num <= 0;
    end
    else begin
        num <= num+1;
    end
end

endmodule