`include "peripheral_defines.svh"

module ext_serial_controller(
    input Bit_t             clk,
    input Bit_t             write_op,
    input Bit_t             read_op,
    output Serial_mode_t    mode,
    input Byte_t            bus_data_write,
    output Byte_t           bus_data_read,


    output Bit_t            txd,
    input Bit_t             rxd
);

Byte_t ext_uart_rx;
Byte_t ext_uart_buffer, ext_uart_tx;
Bit_t ext_uart_ready, ext_uart_clear, ext_uart_busy;
Bit_t ext_uart_start;

assign bus_data_read = ext_uart_buffer;
assign mode[0] = ~ext_uart_busy;
assign mode[1] = ext_uart_ready;

async_receiver #(.ClkFrequency(25000000),.Baud(115200)) //接收模块，9600无检验位
    ext_uart_r(
        .clk(clk),                       //外部时钟信号
        .RxD(rxd),                           //外部串行信号输入
        .RxD_data_ready(ext_uart_ready),  //数据接收到标志
        .RxD_clear(ext_uart_clear),       //清除接收标志
        .RxD_data(ext_uart_rx)             //接收到的一字节数据
    );

//assign ext_uart_clear = ext_uart_ready; 
always @(posedge clk) begin
    if(ext_uart_ready && read_op)begin
        ext_uart_buffer <= ext_uart_rx;
        ext_uart_clear <= 1'b1;
    end else begin
        ext_uart_clear <= 1'b0;
    end
end
always @(posedge clk) begin 
    if(!ext_uart_busy && write_op)begin 
        ext_uart_tx <= bus_data_write;
        ext_uart_start <= 1'b1;
    end else begin 
        ext_uart_start <= 1'b0;
    end
end

async_transmitter #(.ClkFrequency(25000000),.Baud(115200)) //发送模块，9600无检验位
    ext_uart_t(
        .clk(clk),                  //外部时钟信号
        .TxD(txd),                      //串行信号输出
        .TxD_busy(ext_uart_busy),       //发送器忙状态指示
        .TxD_start(ext_uart_start),    //开始发送信号
        .TxD_data(ext_uart_tx)        //待发送的数据
    );


endmodule