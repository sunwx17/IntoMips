`include "peripheral_defines.svh"
module sram_controller (
    //时钟信号
    input Bit_t     clk,
    input Bit_t     rst,

    //总线信号
    input Bit_t         read_op,        //读信号 1为读
    input Bit_t         write_op,       //写信号 1为写
    input Word_t        bus_data_write, //总线向sram写入的数据
    output Word_t       bus_data_read,  //总线从sram读入的数据
    input Word_t        bus_addr,       //数据地址
    input Sram_Mask_t   byte_mask,

    input Bit_t         read_op_ex,        //读信号 1为读
    input Bit_t         write_op_ex,       //写信号 1为写
    input Word_t        bus_data_write_ex, //总线向sram写入的数据
    output Word_t       bus_data_read_ex,  //总线从sram读入的数据
    input Word_t        bus_addr_ex,       //数据地址
    input Sram_Mask_t   byte_mask_ex,

    output Bit_t        bus_stall,      //总线使能 1使能
    
    
    //RAM信号 连接到top模块对应位置
    inout Word_t        ram_data,
    output Ram_addr_t   ram_addr,
    output Sram_Mask_t  ram_be_n,
    output logic        ram_ce_n,
    output logic        ram_oe_n,
    output logic        ram_we_n

);

Bit_t write_op_inner;


typedef enum {IDLE, READ, WRITE, READ_EX, WRITE_EX, NOP} State_t;
State_t cur_state;

//assign ram_be_n = ~byte_mask;

Word_t data_write;
assign ram_data = write_op_inner ? data_write: `HIGH_WORD;

Ram_addr_t inner_addr, inner_addr_ex;

assign inner_addr = (bus_addr >> 2);
assign inner_addr_ex = (bus_addr_ex >> 2);


always_ff @ (posedge clk or posedge rst) begin 
    if (rst) begin
        ram_addr <= `HIGH_WORD;
        ram_ce_n <= 1'b1;
        ram_oe_n <= 1'b1;
        ram_we_n <= 1'b1;

        write_op_inner <= 1'b0;

        cur_state <= IDLE;
        bus_stall <= 1'b0;
    end else begin 
        case(cur_state)
            IDLE: begin
                if (read_op) begin
                    write_op_inner <= 1'b0;
                    ram_addr <= inner_addr;
                    ram_ce_n <= 1'b0;
                    ram_oe_n <= 1'b0;
                    ram_we_n <= 1'b1;
                    ram_be_n = ~byte_mask;
                    cur_state <= READ;
                end else if (write_op) begin
                    write_op_inner <= 1'b1;
                    ram_addr <= inner_addr;
                    data_write <= bus_data_write;
                    ram_ce_n <= 1'b0;
                    ram_oe_n <= 1'b1;
                    ram_we_n <= 1'b0;
                    ram_be_n = ~byte_mask;
                    cur_state <= WRITE;
                end else begin
                    write_op_inner <= 1'b0;
                    ram_addr <= `HIGH_WORD;
                    ram_ce_n <= 1'b1;
                    ram_oe_n <= 1'b1;
                    ram_we_n <= 1'b1;

                    cur_state <= IDLE;
                end
            end
            READ: begin
                bus_data_read <= ram_data;
                ram_ce_n <= 1'b1;
                ram_oe_n <= 1'b1;
                ram_we_n <= 1'b1;

                

                if (read_op_ex) begin
                    write_op_inner <= 1'b0;
                    ram_addr <= inner_addr_ex;
                    ram_ce_n <= 1'b0;
                    ram_oe_n <= 1'b0;
                    ram_we_n <= 1'b1;
                    ram_be_n = ~byte_mask_ex;
                    cur_state <= READ_EX;
                    bus_stall <= 1'b1;
                end else if (write_op_ex) begin
                    write_op_inner <= 1'b1;
                    ram_addr <= inner_addr_ex;
                    data_write <= bus_data_write_ex;
                    ram_ce_n <= 1'b0;
                    ram_oe_n <= 1'b1;
                    ram_we_n <= 1'b0;
                    cur_state <= WRITE_EX;
                    ram_be_n = ~byte_mask_ex;
                    bus_stall <= 1'b1;
                end else begin
                    cur_state <= IDLE;
                end
                //$display("controller read read %h at %h, time = %t, be = %b", bus_data_write, inner_addr, $time, ram_be_n);
            end
            WRITE: begin

                ram_ce_n <= 1'b1;
                ram_oe_n <= 1'b1;
                ram_we_n <= 1'b1;

                write_op_inner <= 1'b0;

                if (read_op_ex) begin
                    write_op_inner <= 1'b0;
                    ram_addr <= inner_addr_ex;
                    ram_ce_n <= 1'b0;
                    ram_oe_n <= 1'b0;
                    ram_we_n <= 1'b1;
                    ram_be_n = ~byte_mask_ex;
                    cur_state <= READ_EX;
                    bus_stall <= 1'b1;
                end else if (write_op_ex) begin
                    write_op_inner <= 1'b1;
                    ram_addr <= inner_addr_ex;
                    data_write <= bus_data_write_ex;
                    ram_ce_n <= 1'b0;
                    ram_oe_n <= 1'b1;
                    ram_we_n <= 1'b0;
                    ram_be_n = ~byte_mask_ex;
                    cur_state <= WRITE_EX;
                    bus_stall <= 1'b1;
                end else begin
                    cur_state <= IDLE;
                end
                //$display("controller read write %h at %h, time = %t, be = %b", bus_data_write, inner_addr, $time, ram_be_n);
            end
            READ_EX: begin
                bus_data_read_ex <= ram_data;
                ram_ce_n <= 1'b1;
                ram_oe_n <= 1'b1;
                ram_we_n <= 1'b1;     
                cur_state <= NOP;  
                bus_stall <= 1'b0;
            end
            WRITE_EX: begin
                ram_ce_n <= 1'b1;
                ram_oe_n <= 1'b1;
                ram_we_n <= 1'b1;

                write_op_inner <= 1'b0;
                cur_state <= NOP;
                bus_stall <= 1'b0;
            end     
            NOP: begin
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
