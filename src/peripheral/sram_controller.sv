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
    input Mask_t        byte_mask,

    output Bit_t        bus_stall,      //总线使能 1使能
    
    
    //RAM信号 连接到top模块对应位置
    inout Word_t        ram_data,
    output Ram_addr_t   ram_addr,
    output Mask_t       ram_be_n,
    output logic        ram_ce_n,
    output logic        ram_oe_n,
    output logic        ram_we_n

);
    Bit_t write_op_inner;


    typedef enum {IDLE, READ, WRITE} State_t;
    State_t cur_state;

    assign ram_be_n = ~byte_mask;
    
    Word_t data_read, data_write;
    assign bus_data_read = data_read;
    assign ram_data = write_op_inner ? data_write: `HIGH_WORD;

    Ram_addr_t inner_addr;
    assign inner_addr = bus_addr;


    always_ff @ (posedge clk or posedge rst) begin 
        if (rst) begin
            ram_addr <= `HIGH_WORD;
            ram_ce_n <= 1'b1;
            ram_oe_n <= 1'b1;
            ram_we_n <= 1'b1;

            write_op_inner <= 1'b0;

            bus_stall <= 1'b1;
            cur_state <= IDLE;
        end else begin 
            case(cur_state)
                IDLE: begin
                    if (read_op) begin
                        ram_addr <= inner_addr;
                        ram_ce_n <= 1'b0;
                        ram_oe_n <= 1'b0;
                        ram_we_n <= 1'b1;
                        ram_addr <= inner_addr;
                        cur_state <= READ;

                        write_op_inner <= 1'b0;
                    end else if (write_op) begin
                        write_op_inner <= write_op;
                        ram_addr <= inner_addr;
                        data_write <= bus_data_write;
                        ram_ce_n <= 1'b0;
                        ram_oe_n <= 1'b1;
                        ram_we_n <= 1'b0;
                        //$display("controller write %h at %h, time = %t, be = %b", bus_data_write, inner_addr, $time, ram_be_n);
                        cur_state <= WRITE;

                        read_op_inner <= 1'b0;
                    end else begin
                        ram_addr <= `HIGH_WORD;
                        ram_ce_n <= 1'b1;
                        ram_oe_n <= 1'b1;
                        ram_we_n <= 1'b1;

                        bus_stall <= 1'b1;
                        cur_state <= IDLE;

                        write_op_inner <= 1'b0;
                    end
                end
                READ: begin
                    data_read <= ram_data;

                    ram_ce_n <= 1'b1;
                    ram_oe_n <= 1'b1;
                    ram_we_n <= 1'b1;

                    cur_state <= IDLE;
                end
                WRITE: begin

                    ram_ce_n <= 1'b1;
                    ram_oe_n <= 1'b1;
                    ram_we_n <= 1'b1;

                    write_op_inner <= 1'b0;

                    bus_stall <= 1'b0;
                    cur_state <= IDLE;
                end
            endcase
        end
    end
        
    /*
    always_ff @ (posedge clk) begin
        $display("be = %b, time = %t", ram_be_n, $time);
    end
    */

  
endmodule
