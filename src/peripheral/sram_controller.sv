`include "cpu_defines.svh"
module sram_controller (
    //时钟信号
    input Bit_t     clk,
    input Bit_t     rst,

    //总线信号
    input Bit_t         read_op,        //读信号 1为读
    input Bit_t         write_op,       //写信号 1为写
    input Word_t        bus_data_write, //总线向sram写入的数据
    output Word_t       bus_data_read,  //总线从sram读入的数据
    input Ram_addr_t    bus_addr,       //数据地址
    input Mask_t        byte_mask,      //1有效

    output Bit_t        bus_stall,      //总线使能 0:需保持数据总线 1:可更改
    
    
    //RAM信号 连接到top模块对应位置
    inout Word_t        ram_data,
    output Ram_addr_t   ram_addr,
    output Mask_t       ram_be_n,
    output Bit_t        ram_ce_n,
    output Bit_t        ram_oe_n,
    output Bit_t        ram_we_n

);
    //typedef enum {IDLE, PREPARE, HOLD} State_t;
    //State_t cur_state = IDLE, nxt_state = IDLE;
    typedef enum {IDLE, READ, WRITE} State_t;
    State_t cur_state = IDLE;

    assign ram_be_n = ~byte_mask;

    Word_t data_read, data_write;
    assign bus_data_read = read_op ? data_read: `HIGH_WORD;
    assign ram_data = write_op ? data_write: `HIGH_WORD;

    Ram_addr_t inner_addr;
    assign inner_addr = bus_addr;

    always_ff @ (posedge clk or posedge rst) begin
        if (rst) begin
            cur_state <= IDLE;

            ram_ce_n <= 1'b1;
            ram_addr <= `HIGH_WORD;
            ram_oe_n <= 1'b1;
            ram_we_n <= 1'b1;

            bus_stall <= 1'b1;
        end else begin
            case(cur_state)
                IDLE: begin
                    bus_stall <= 1'b1;
                    if (read_op) begin
                        ram_ce_n <= 1'b0;
                        ram_addr <= inner_addr;
                        ram_oe_n <= 1'b0;
                        ram_we_n <= 1'b1;

                        cur_state <= READ;
                    end else if (write_op) begin
                        ram_ce_n <= 1'b0;
                        ram_addr <= inner_addr;
                        ram_oe_n <= 1'b1;
                        ram_we_n <= 1'b0;
                        
                        data_write <= bus_data_write;
                        cur_state <= WRITE;
                        //$display("controller write prepared, time = %t", $time);
                    end else begin
                        ram_ce_n <= 1'b1;
                        ram_addr <= `HIGH_WORD;
                        ram_oe_n <= 1'b1;
                        ram_we_n <= 1'b1;

                        cur_state <= IDLE;
                    end
                end
                READ: begin
                    data_read <= ram_data;


                    ram_ce_n <= 1'b1;
                    ram_addr <= `HIGH_WORD;
                    ram_oe_n <= 1'b1;
                    ram_we_n <= 1'b1;
                    cur_state <= IDLE;
                end
                WRITE: begin
                    bus_stall <= 1'b0;
                    //$display("controller write done, then reset, time = %t", $time);
                    ram_ce_n <= 1'b1;
                    ram_addr <= `HIGH_WORD;
                    ram_oe_n <= 1'b1;
                    ram_we_n <= 1'b1;
                    cur_state <= IDLE;
                end
            endcase
        end
    end
endmodule
