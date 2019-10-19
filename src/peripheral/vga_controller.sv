`include "defines.svh"

module vga_controller(
    input clk_25, clk_50, rst,


    input Bit_t         write_en, //1为有效
    input Vga_addr_t    bus_addr,
    input Byte_t        bus_data,

    //图像输出信号
    output Triblebit_t  video_red,          //红色像素，3位
    output Triblebit_t  video_green,        //绿色像素，3位
    output Doublebit_t  video_blue,         //蓝色像素，2位
    output Bit_t        video_hsync,        //行同步（水平同步）信号
    output Bit_t        video_vsync,        //场同步（垂直同步）信号
    output Bit_t        video_clk,          //像素时钟输出
    output Bit_t        video_de            //行数据有效信号，用于区分消隐区
);

//50MHz的刷新频率
assign video_clk = clk_50;

Byte_t pixel = 0;
assign video_red = pixel[2:0];
assign video_green = pixel[5:0];
assign video_blue = pixel[7:6];


//高/宽
logic hdata, vdata;


Vga_addr_t cur_addr = 0;

always_ff @ (posedge clk_50) begin
    cur_addr <= cur_addr + 1;
    if (cur_addr == 800 * 600) begin
        cur_addr <= 0;
    end 
end


always_ff @ (posedge clk_50) begin
    if (hdata == (`VGA_HEIGHT - 1))
        hdata <= 0;
    else 
        hdata <= hdata + 1;
end

always_ff @ (posedge clk_50) begin
    if (vdata == (`VGA_WIDTH - 1)) vdata <= 0;
    else vdata <= vdata + 1;
end

assign video_hsync = ((hdata >= `VGA_HFP) && (hdata < `VGA_HSP)) ? 1'b1: 1'b0;
assign video_vsync = ((vdata >= `VGA_VFP) && (vdata < `VGA_VSP)) ? 1'b1: 1'b0;
//???
assign video_de = ((hdata < `VGA_HEIGHT) & (vdata < `VGA_WIDTH));

//内部使用ip核 block memory generator
//addr: 19bit
//data: 32bit
blk_mem_gen_0 blk_mem_gen_instance(
    //write port
    .clka(clk_25),
    .wea(write_en),
    .addra(bus_addr),
    .dina(bus_data),
    //read port
    .clkb(clk_50),
    .enb(1'b1),
    .addrb(cur_addr),
    .doutb(pixel)
);

endmodule