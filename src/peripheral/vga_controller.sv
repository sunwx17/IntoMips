`include "defines.svh"

module vga_controller(
    input clk_25M, clk_50M, rst,


    input Bit_t         write_op, //1为有效
    input Word_t        bus_addr, 
    input Word_t        bus_data,

    //图像输出信号
    output Triblebit_t  video_red,          //红色像素，3位
    output Triblebit_t  video_green,        //绿色像素，3位
    output Doublebit_t  video_blue,         //蓝色像素，2位
    output Bit_t        video_hsync,        //行同步（水平同步）信号
    output Bit_t        video_vsync,        //场同步（垂直同步）信号
    output Bit_t        video_clk,          //像素时钟输出
    output Bit_t        video_de            //行数据有效信号，用于区分消隐区
);

//高/宽
logic[11:0] hdata;
logic[11:0] vdata;
//像素时钟为50MHz
assign video_clk = clk_50M;


Byte_t pixel;
assign video_red = pixel[2:0];
assign video_green = pixel[5:3];
assign video_blue = pixel[7:6];


/*
assign video_red = hdata < 266 ? 3'b111 : 0; //红色竖条
assign video_green = hdata < 532 && hdata >= 266 ? 3'b111 : 0; //绿色竖条
assign video_blue = hdata >= 532 ? 2'b11 : 0; //蓝色竖条
*/


Word_t cur_addr;

assign cur_addr = (hdata < `VGA_HSIZE && vdata < `VGA_VSIZE)? (vdata * `VGA_HSIZE + hdata): 0;

// hdata
always @ (posedge clk_50M or posedge rst) begin
    if (rst) begin
        hdata <= 0;
    end else if (hdata == `VGA_HMAX) begin
        hdata <= 0;
    end else begin
        hdata <= hdata + 1;
    end
end

// vdata
always @ (posedge clk_50M or posedge rst) begin
    if (rst) begin
        vdata <= 0;
    end else if (hdata == `VGA_HMAX) begin
        if (vdata == `VGA_VMAX) begin
            vdata <= 0;
        end else begin
            vdata <= vdata + 1;
        end
    end
end

/*
always_ff @ (posedge clk_50M or posedge rst) begin
    if (rst) begin
        cur_addr <= 0;
    end else if (cur_addr == `VGA_HEIGHT * `VGA_WIDTH) begin
        cur_addr <= 0;
    end else begin
        cur_addr <= cur_addr + 1;
    end
end
*/
 
assign video_hsync = ((hdata >= `VGA_HFP) && (hdata < `VGA_HSP)) ? 1'b1: 1'b0;
assign video_vsync = ((vdata >= `VGA_VFP) && (vdata < `VGA_VSP)) ? 1'b1: 1'b0;
assign video_de = ((hdata < `VGA_HSIZE) & (vdata < `VGA_VSIZE));


//内部使用ip核 block memory generator
//addr: 19bit
//data: 32bit
blk_mem_gen_0 blk_mem_gen_instance(
    //write port
    .clka(clk_25M),
    .wea(write_op),
    .addra(bus_addr[18:0]),
    .dina(bus_data[7:0]),
    //read port
    .clkb(clk_50M),
    .addrb(cur_addr[18:0]),
    .doutb(pixel)
);


endmodule