`include "peripheral_defines.svh"

module usb_controller (
    input Bit_t     clk,
    input Bit_t     rst,

    input Bit_t     read_op,
    input Bit_t     write_op,

    input Word_t    bus_data_addr,
    input Word_t    bus_data_write,
    output Word_t   bus_data_read,
    output Bit_t    bus_stall,
    output Bit_t    usb_interrupt,
    

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

assign usb_interrupt = sl811_intrq;
assign sl811_dack_n = 1'b1;
assign sl811_rst_n = 1'b1;

Bit_t write_op_inner;
Byte_t data_write_inner;
assign sl811_d = write_op_inner? data_write_inner: `HIGH_WORD;

Word_t data_addr_inner;
assign data_addr_inner = bus_data_addr >> 2;
/*
实际usb只有两个地址0x???????0 和0x???????4
前者为地址寄存器的位置，后者为数据寄存器的位置
实质上将地址后移两位后取末尾位来满足usb的要求
*/

typedef enum {
    IDLE,
    READ_[`USB_WAIT_CYCLE],
    WRITE_[`USB_WAIT_CYCLE],
    HOLD_[`USB_WAIT_CYCLE],
    NOP
} State_t;

State_t cur_state;

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        cur_state <= IDLE;

        sl811_cs_n <= 1'b1;
        sl811_wr_n <= 1'b1;
        sl811_rd_n <= 1'b1;
        write_op_inner <= 1'b0;
        bus_data_read <= `ZERO_WORD;
        bus_stall <= 1'b0;
    end else begin
        case(cur_state)
            IDLE: begin
                cur_state <= IDLE;

                sl811_cs_n <= 1'b1;
                sl811_wr_n <= 1'b1;
                sl811_rd_n <= 1'b1;
                write_op_inner <= 1'b0;
                sl811_a0 <= data_addr_inner[0];
                if (read_op) begin
                    cur_state <= READ_0;

                    sl811_cs_n <= 1'b0;
                    sl811_rd_n <= 1'b0;
                    bus_stall <= 1'b1;
                end else if (write_op) begin
                    cur_state <= WRITE_0;

                    sl811_cs_n <= 1'b0;
                    sl811_wr_n <= 1'b0;
                    write_op_inner <= 1'b1;
                    data_write_inner <= bus_data_write[7:0];
                    bus_stall <= 1'b1;
                end
            end

            `USB_WAIT_STATES(cur_state, READ)

            `USB_LAST_WAIT_STATE(READ): begin
                cur_state <= HOLD_0;

                sl811_cs_n <= 1'b1;
                sl811_rd_n <= 1'b1;
                bus_data_read <= {24'b0, {sl811_d}};
            end

            `USB_WAIT_STATES(cur_state, WRITE)

            `USB_LAST_WAIT_STATE(WRITE): begin
                cur_state <= HOLD_0;

                sl811_cs_n <= 1'b1;
                sl811_wr_n <= 1'b1;
            end

            `USB_WAIT_STATES(cur_state, HOLD)

            `USB_LAST_WAIT_STATE(HOLD): begin
                cur_state <= NOP;

                write_op_inner <= 1'b0;
                bus_stall <= 1'b0;
            end
            NOP: begin
                cur_state <= IDLE;
            end
        endcase
    end
end
endmodule