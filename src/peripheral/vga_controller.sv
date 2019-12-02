`include "peripheral_defines.svh"

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


Bit_t inner_write_op, inner_color_write_op;
Word_t ascii_addr;
Ascii_data_t ascii_out;
Ascii_data_t graphics_in;
Color_t color_in;
Graphics_block_addr_t graphics_write_addr, color_write_addr;
Bit_t last_write_op;
Graphics_block_addr_t last_graphics_write_addr;

always_comb begin
    //write_op在下降沿给出
    if (write_op) begin
        ascii_addr <= bus_data[`VGA_TEXT_FIELD] >= 32? bus_data[`VGA_TEXT_FIELD] - 32: 0;
    end else begin
        ascii_addr <= `ZERO_WORD;
    end
end

always_ff @ (posedge clk_25M or posedge rst) begin
    if (rst) begin
        last_write_op <= 1'b0;
        last_graphics_write_addr <= `ZERO_WORD;

        color_in <= `ZERO_WORD;
        inner_color_write_op <= 1'b0;
        color_write_addr <= `ZERO_WORD;
    end else begin
        //write ascii of the last period
        last_write_op <= 1'b0;
        last_graphics_write_addr <= `ZERO_WORD;

        color_in <= `ZERO_WORD;
        inner_color_write_op <= 1'b0;
        color_write_addr <= `ZERO_WORD;
        if (write_op) begin
            last_write_op <= 1'b1;
            last_graphics_write_addr <= bus_addr;

            color_in <= bus_data[`VGA_COLOR_FIELD];
            inner_color_write_op <= 1'b1;
            color_write_addr <= bus_addr;
        end
    end
end


always_ff @ (posedge clk_25M) begin
    inner_write_op <= 1'b0;
    graphics_write_addr <= `ZERO_WORD;
    graphics_in <= `ZERO_WORD;

    if (last_write_op) begin
        inner_write_op <= 1'b1;
        graphics_write_addr <= last_graphics_write_addr;
        graphics_in <= ascii_out;
    end 
end
        

//高/宽
logic[11:0] hdata;
logic[11:0] vdata;

assign video_clk = clk_50M;


Ascii_data_t graphics_out;
Color_t color_out;
Block_bit_addr_t pixel_addr;

Vga_red_t red, red_in;
Vga_green_t green, green_in;
Vga_blue_t blue, blue_in;

assign video_red = red_in;
assign video_green = green_in;
assign video_blue = blue_in;

always_ff @ (posedge clk_50M or posedge rst) begin
    if (rst) begin
        red_in <= `ZERO_WORD;
        green_in <= `ZERO_WORD;
        blue_in <= `ZERO_WORD;
    end else begin
        red_in <= red;
        green_in <= green;
        blue_in <= blue;
    end
end



assign pixel_addr = hdata < `VGA_NORMAL_HSIZE && vdata < `VGA_NORMAL_VSIZE? {2'b00, vdata[3:0], hdata[2:0]}: 0;
always_comb begin
    if (graphics_out[pixel_addr]) begin
        //foregroud
        red <= ~color_out[`VGA_FG_RED];
        green <= ~color_out[`VGA_FG_GREEN];
        blue <= ~color_out[`VGA_FG_BLUE];
    end else begin
        //baskground:
        red <= color_out[`VGA_BG_RED];
        green <= color_out[`VGA_BG_GREEN];
        blue <= color_out[`VGA_BG_BLUE];
    end
end


Graphics_block_addr_t cur_block_addr, cur_block_addr_in;
Graphics_block_addr_t addr_4x;
assign addr_4x = (vdata >> 4) << 2;
assign cur_block_addr = (addr_4x << 4) + (addr_4x << 3) + addr_4x + (hdata >> 3);
assign cur_block_addr_in = cur_block_addr < `VGA_BLOCK_HNUM * `VGA_BLOCK_VNUM? cur_block_addr:0;


// hdata
always @ (posedge clk_50M or posedge rst) begin
    if (rst) begin
        hdata <= 0;
    end else if (hdata == (`VGA_HMAX - 1)) begin
        hdata <= 0;
    end else begin
        hdata <= hdata + 1;
    end
end

// vdata
always @ (posedge clk_50M or posedge rst) begin
    if (rst) begin
        vdata <= 0;
    end else if (hdata == (`VGA_HMAX - 1)) begin
        if (vdata == (`VGA_VMAX - 1)) begin
            vdata <= 0;
        end else begin
            vdata <= vdata + 1;
        end
    end
end

assign video_hsync = ((hdata >= `VGA_HFP) && (hdata < `VGA_HSP)) ? 1'b1: 1'b0;
assign video_vsync = ((vdata >= `VGA_VFP) && (vdata < `VGA_VSP)) ? 1'b1: 1'b0;
assign video_de = ((hdata < `VGA_HSIZE) & (vdata < `VGA_VSIZE));

//ascii rom
//addra: 7bit
//douta: 128bit
blk_mem_ascii_rom ascii_rom_instance(
    .clka(clk_50M),
    .addra(ascii_addr),
    .douta(ascii_out)
);



//it seems useless
//vga clk wiz
//clk_50M_in: 1bit
//clk_100M_out: 1bit
//locked
Bit_t clk_100M;
vga_clk_wiz vga_clk_wiz_instance(
    .clk_50M_in(clk_50M),
    .clk_100M_out(clk_100M)
    //.locked(???)
);


//graphics block ram
//addra: 12bit
//dina: 128bit
//addrb: 12bit
//doutb: 128bit
blk_mem_graphics graphics_instance(
    //write port
    .clka(clk_50M),
    .wea(inner_write_op),
    .addra(graphics_write_addr),
    .dina(graphics_in),
    //read port
    .clkb(clk_100M),
    .addrb(cur_block_addr_in),
    .doutb(graphics_out)
);

//color block ram
//addra: 12bit
//dina: 16bit
//addrb: 12bit
//doutb: 16bit
blk_mem_color color_instance(
    //write port
    .clka(clk_50M),
    .wea(inner_color_write_op),
    .addra(color_write_addr),
    .dina(color_in),
    //read port
    .clkb(clk_100M),
    .addrb(cur_block_addr_in),
    .doutb(color_out)
);


endmodule