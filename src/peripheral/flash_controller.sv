`include "defines.svh"

module flash_controller(
    input clk, rst,

    input Flash_addr_t  bus_addr,       //总线地址
    input Bit_t         read_op,        //读信号 1为读
    input Word_t        bus_data_write, //总线向flash写入数据(TODO)
    output Word_t       bus_data_read,  //总线从flash读入数据
    output Bit_t        bus_stall,


    output Flash_addr_t flash_a,        //Flash地址，a0仅在8bit模式有效，16bit模式无意义
    inout  Halfword_t   flash_d,        //Flash数据
    output Bit_t        flash_rp_n,     //Flash复位信号，低有效
    output Bit_t        flash_vpen,     //Flash写保护信号，低电平时不能擦除、烧写
    output Bit_t        flash_ce_n,     //Flash片选信号，低有效
    output Bit_t        flash_oe_n,     //Flash读使能信号，低有效
    output Bit_t        flash_we_n,     //Flash写使能信号，低有效
    output Bit_t        flash_byte_n    //Flash 8bit模式选择，低有效。在使用flash的16位模式时请设为1
);

assign flash_rp_n = 1'b1; //防止不必要延迟
assign flash_vpen = 1'b1;
assign flash_byte_n = 1'b1; //使用16bit模式(halfword)
assign flash_ce_n = 1'b0; //可以?

//不支持写
assign flash_we_n = 1'b1;

Flash_addr_t inner_addr; //存储读取的addr
assign flash_a = inner_addr;

typedef enum {IDLE, READ_0, READ_1} state_t;

state_t cur_state = IDLE;

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        flash_oe_n <= 1'b0;
        inner_addr <= `ZERO_WORD;
        cur_state <= IDLE;
        bus_data_read <= `ZERO_WORD;

        bus_stall <= 1'b0;
    end else begin
        case(cur_state)
            IDLE: begin
                if (read_op) begin
                    flash_oe_n <= 1'b0;
                    inner_addr <= bus_addr;
                    cur_state <= READ_0;

                    bus_stall <= 1'b1;
                end else begin
                    flash_oe_n <= 1'b1;
                    inner_addr <= `ZERO_WORD;
                    cur_state <= IDLE;

                    bus_stall <= 1'b0;
                end
            end
            READ_0: begin
                bus_data_read[15:0] <= flash_d;
                inner_addr <= bus_addr + 2'h2;
                cur_state <= READ_1;
            end
            READ_1: begin
                bus_data_read[31:16] <= flash_d;
                flash_oe_n <= 1'b0;
                cur_state <= IDLE;

                bus_stall <= 1'b0;
            end
        endcase
    end
end
endmodule