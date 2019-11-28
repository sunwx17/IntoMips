`include "defines.svh"

module usb_controler (
    input clk, rst,

    input Bit_t     read_op,
    input Bit_t     write_op,

    input Byte_t    bus_data_write,
    output Byte_t   bus_data_read,
    output Bit_t    bus_stall,
    

    output Bit_t    sl811_a0,
    inout  Byte_t   sl811_d,     //USB数据线与网络控制器的dm9k_sd[7:0]共享
    output Bit_t    sl811_wr_n,
    output Bit_t    sl811_rd_n,
    output Bit_t    sl811_cs_n,
    output Bit_t    sl811_rst_n,
    output Bit_t    sl811_dack_n,
    input  Bit_t    sl811_intrq,
    input  Bit_t    sl811_drq_n
);

//TODO: 中断

Bit_t write_op_inner;
Byte_t data_write_inner;
assign sl811_d = write_op_inner? data_write_inner: `HIGH_BYTE;

#define `WAIT_CYCLES 3
typedef enum {
    IDLE,
    READ_[`WAIT_CYCLES],
    WRITE_[`WAIT_CYCLES],
    HOLD_[`WAIT_CYCLES]
} State_t;

State_t cur_state;

`define WAIT_STATE(NAME, A, B) NAME``_``A: begin \
    cur_state <= NAME``_``B; \
end

`define WAIT_STATES(NAME, A, B) `WAITE_STATE(NAME, 0, 1) \
    `WAITE_STATE(NAME, 1, 2) \
    `WAITE_STATE(NAME, 2, 3) 

`define RESET \
    sl811_a0 <= 1'b0;


always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        write_op_inner <= 1'b0;
        bus_data_read <= `ZERO_WORD;
        bus_stall <= 1'b0;

        cur_state <= IDLE;
    end begin
        case(cur_state)
            IDLE: begin
                sl811_cs_n <= 1'b1;
                sl811_wr_n <= 1'b1;
                sl811_rd_n <= 1'b1;
                write_op_inner <= 1'b0;
                sl811_a0 <= bus_data_addr[0];
                if (read_op) begin
                    sl811_cs_n <= 1'b0;
                    sl811_rd_n <= 1'b0;
                    bus_stall <= 1'b1;
                    cur_state <= READ_0;
                end else if (write_op) begin
                    sl811_cs_n <= 1'b0;
                    sl811_wr_n <= 1'b0;
                    write_op <= 1'b1;
                    data_write_inner <= bus_data_write;
                    bus_stall <= 1'b1;
                    cur_state <= WRITE_0;
                end
            end

            `WAIT_STATES(READ)

            READ_3: begin
                sl811_cs_n <= 1'b1;
                sl811_rd_n <= 1'b1;
                bus_data_read <= sl811_d;
                cur_state <= HOLD_0;
            end

            `WAIT_STATES(WRITE)

            WRITE_3: begin
                sl811_cs_n <= 1'b1;
                sl811_wr_n <= 1'b1;
                cur_state <= HOLD_0;
            end

            `WAIT_STATES(HOLD)

            HOLD_3: begin
                inner_write_op <= 1'b0;
                bus_stall <= 1'b0;
                cur_state <= IDLE;
            end
        endcase
    end
end
endmodule