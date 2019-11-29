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

Graphics_block_addr_t display_row_offset;

typedef enum {IDLE, WRITE} State_t;
State_t cur_state;

Bit_t inner_write_op;
Word_t ascii_addr;
Ascii_data_t ascii_out;
Ascii_data_t graphics_in;
Graphics_block_addr_t graphics_write_addr;
Bit_t last_write_op;
Graphics_block_addr_t last_graphics_write_addr;

always_comb begin
    //write_op在下降沿给出
    if (write_op) begin
        if (bus_addr == `VGA_OFFSET_REG) begin
            ascii_addr <= `ZERO_WORD;
        end else begin
            ascii_addr <= bus_data - 32;
        end
    end else begin
        ascii_addr <= `ZERO_WORD;
    end
end

always_ff @ (posedge clk_50M or posedge rst) begin
    if (rst) begin
        last_write_op <= 1'b0;
        display_row_offset <= `ZERO_WORD;
    end else begin
        //write ascii of the last period
        last_write_op <= 1'b0;
        last_graphics_write_addr <= `ZERO_WORD;
        if (write_op) begin
            if (bus_addr == `VGA_OFFSET_REG) begin
                display_row_offset <= bus_data[7:0];
            end else begin
                last_write_op <= 1'b1;
                last_graphics_write_addr <= bus_addr;
            end
        end
    end
end


assign graphics_in = ascii_out;

always_ff @ (posedge clk_50M) begin
    inner_write_op <= 1'b0;
    graphics_write_addr <= `ZERO_WORD;
    if (last_write_op) begin
        inner_write_op <= 1'b1;
        graphics_write_addr <= last_graphics_write_addr;
    end 
end
        

        


//高/宽
logic[11:0] hdata;
logic[11:0] vdata;

assign video_clk = clk_25M;


Ascii_data_t graphics_out, graphics_out_inner;
Block_bit_addr_t pixel_addr;
//assign pixel_addr = hdata < `VGA_NORMAL_HSIZE && vdata < `VGA_NORMAL_VSIZE? (hdata & 6'b111) + (vdata & 4'b1111) * `VGA_BLOCK_HSIZE: 0;
//assign pixel_addr = hdata < `VGA_NORMAL_HSIZE && vdata < `VGA_NORMAL_VSIZE? {6'b000000, hdata[2:0]} + {2'b00, vdata[3:0], 3'b000}: 0;
assign pixel_addr = hdata < `VGA_NORMAL_HSIZE && vdata < `VGA_NORMAL_VSIZE? {2'b00, vdata[3:0], hdata[2:0]}: 0;
assign video_red = {3{graphics_out[pixel_addr]}};
assign video_green = {3{graphics_out[pixel_addr]}};
assign video_blue = {2{graphics_out[pixel_addr]}};




Graphics_block_addr_t cur_block_addr, cur_block_addr_inner;
//cannot work in 25MHz
//assign cur_block_addr_inner = (vdata >> 4) * `VGA_BLOCK_HNUM + (hdata >> 3);
Graphics_block_addr_t addr_4x;
assign addr_4x = (vdata >> 4) << 2;
assign cur_block_addr = (addr_4x << 4) + (addr_4x << 3) + addr_4x + (hdata >> 3);
assign cur_block_addr_inner = cur_block_addr < `VGA_BLOCK_HNUM * `VGA_BLOCK_VNUM? cur_block_addr: (cur_block_addr < 2 * `VGA_BLOCK_HNUM * `VGA_BLOCK_VNUM? cur_block_addr - `VGA_BLOCK_HNUM * `VGA_BLOCK_VNUM: 0);


always @ (posedge clk_25M or posedge rst) begin
    if (rst) begin
        graphics_out <= `ZERO_WORD;
    end else begin
        graphics_out <= graphics_out_inner;
    end
end

// hdata
always @ (posedge clk_25M or posedge rst) begin
    if (rst) begin
        hdata <= 0;
    end else if (hdata == `VGA_HMAX) begin
        hdata <= 0;
    end else begin
        hdata <= hdata + 1;
    end
end

// vdata
always @ (posedge clk_25M or posedge rst) begin
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

//graphics block rom
//addra: 12bit
//dina: 128bit
//addrb: 12bit
//doutb: 128bit
blk_mem_graphics graphics_instrance(
    //write port
    .clka(clk_50M),
    .wea(inner_write_op),
    .addra(graphics_write_addr),
    .dina(graphics_in),
    //read port
    .clkb(clk_50M),
    .addrb(cur_block_addr_inner),
    .doutb(graphics_out_inner)
);


endmodule