`include "peripheral_defines.svh"

module flash_controller(
    input clk, rst,

    input Word_t        bus_addr,       //总线地址
    input Bit_t         read_op,        //读信号 1为读
    input Bit_t         write_op,
    output Word_t       bus_data_read,  //总线从flash读入数据 一个word
    input Word_t        bus_data_write, //总线向flash写一个半字， 取bus_data_write[15:0]
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

Flash_addr_t flash_addr_inner;
assign flash_a = flash_addr_inner; //为了满足时序

assign flash_rp_n = 1'b1; //防止不必要延迟
assign flash_vpen = 1'b1;
assign flash_byte_n = 1'b1; //使用16bit模式(halfword)

Bit_t write_op_inner;
Halfword_t data_write_inner;
assign flash_d = write_op_inner?  data_write_inner: `HIGH_WORD;

typedef enum {
    RESTART,
    IDLE,
    READ_WORD_LOW_[`FLASH_WAIT_CYCLE],
    READ_WORD_HIGH_[`FLASH_WAIT_CYCLE],
    WRITE_HWORD_[`FLASH_WAIT_CYCLE],
    NOP //necessary for cpu
} State_t;
State_t cur_state;

`define RESET \
    flash_ce_n <= 1'b1; \
    flash_oe_n <= 1'b1; \
    flash_we_n <= 1'b1; \
    flash_addr_inner <= `ZERO_WORD; \
    write_op_inner <= 1'b0; \
    bus_stall <= 1'b0;

always_ff @ (posedge clk or posedge rst) begin
    if (rst) begin
        cur_state <= RESTART;
        `RESET
    end else begin
        case(cur_state)
            RESTART: begin
                //设置read mode
                flash_ce_n <= 1'b0;
                flash_oe_n <= 1'b1;
                flash_we_n <= 1'b0;
                write_op_inner <= 1'b1;
                flash_addr_inner <= 0;
                data_write_inner <= 4'h00ff;
                cur_state <= WRITE_HWORD_0;
            end

            IDLE: begin
                `RESET
                cur_state <= IDLE;
                if (read_op) begin
                    cur_state <= READ_WORD_LOW_0;
                    flash_ce_n <= 1'b0;
                    flash_oe_n <= 1'b0;
                    flash_addr_inner <= bus_addr;
                    bus_stall <= 1'b1;
                end else if (write_op) begin
                    cur_state <= WRITE_HWORD_0;
                    flash_ce_n <= 1'b0;
                    flash_we_n <= 1'b0;
                    flash_addr_inner <= bus_addr;
                    write_op_inner <= 1'b1;
                    data_write_inner <= bus_data_write[15:0];
                    bus_stall <= 1'b1;
                end 
            end

            //read
            `FLASH_WAIT_STATES(cur_state, READ_WORD_LOW)
            
            `FLASH_LAST_WAIT_STATE(READ_WORD_LOW): begin
                cur_state <= READ_WORD_HIGH_0;
                bus_data_read[15:0] <= flash_d;
                flash_addr_inner <= bus_addr + 2'h2;
            end

            `FLASH_WAIT_STATES(cur_state, READ_WORD_HIGH)

            `FLASH_LAST_WAIT_STATE(READ_WORD_HIGH): begin
                cur_state <= NOP;
                bus_data_read[31: 16] <= flash_d;
                `RESET
            end

            //write
            `FLASH_WAIT_STATES(cur_state, WRITE_HWORD)

            `FLASH_LAST_WAIT_STATE(WRITE_HWORD): begin
                cur_state <= NOP;
                `RESET
            end

            NOP: begin
                cur_state <= IDLE;
            end
        endcase
    end
end

`undef RESET
endmodule