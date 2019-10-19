`include "defines.svh"

module serial_controller(
    input clk, rst,
    input Bit_t     read_op,
    input Bit_t     write_op,
    inout Byte_t    bus_data,
    


    //CPLD串口控制器信号
    output Bit_t    uart_rdn,         //读串口信号，低有效
    output Bit_t    uart_wrn,         //写串口信号，低有效

    input Bit_t     uart_dataready,    //串口数据准备好
    input Bit_t     uart_tbre,         //发送数据标志
    input Bit_t     uart_tsre,         //数据发送完毕标志

    //数据线 与BaseRam共享
    inout Byte_t    uart_data
);
    typedef enum{IDLE, WRITE_0, WRITE_1, WRITE_2, WRITE_3, READ_0, READ_1, READ_2} state_t;
    state_t cur_state;
    Byte_t data_write, data_read;
    assign uart_data = write_op? data_write: `HIGH_BYTE;
    assign data_read = read_op? uart_data: `HIGH_BYTE;

    assign bus_data = data_read;
    assign data_write = bus_data;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            cur_state <= IDLE;
            uart_rdn <= 1'b1;
            uart_wrn <= 1'b1;
        end else begin
            case(cur_state)
                IDLE: begin
                    cur_state <= write_op? WRITE_0: (read_op? READ_0: IDLE);
                    uart_rdn <= ~read_op;
                    uart_wrn <= ~write_op;
                end
                WRITE_0: begin
                    cur_state <= WRITE_1;
                    uart_wrn <= 1'b0;
                end
                WRITE_1: begin
                    cur_state <= WRITE_2;
                    uart_wrn <= 1'b1;
                end
                WRITE_2: begin
                    cur_state <= uart_tbre? WRITE_3: WRITE_2;
                end
                WRITE_3: begin
                    cur_state <= uart_tsre? IDLE: WRITE_3;
                end
                READ_0: begin
                    if (uart_dataready) begin
                        uart_rdn <= 1'b0;
                        cur_state <= READ_1;
                    end else begin
                        cur_state <= IDLE;
                    end
                end
                READ_1: begin
                    cur_state <= IDLE;
                end
            endcase
        end
    end
endmodule