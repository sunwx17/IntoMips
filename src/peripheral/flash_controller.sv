`include "defines.svh"

module flash_controller(
    input clk, rst,

    input Word_t        bus_addr,       //总线地址
    input Bit_t         read_op,        //读信号 1为读
    output Word_t       bus_data_read,  //总线从flash读入数据 实际只有半字 两个半字拼在一起


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
//不支持写
assign flash_we_n = 1'b1;

enum {IDLE, READ} State_t;
State_t cur_state;

always_ff @ (posedge clk or posedge rst) begin
    if (rst) begin
        cur_state   <= IDLE;
        flash_ce_n  <= 1'b1;
        flash_oe_n  <= 1'b1;
        flash_a     <= `ZERO_WORD; 
    end else begin
        case(cur_state)
            IDLE: begin
                cur_state   <= IDLE;
                flash_ce_n  <= 1'b1;
                flash_oe_n  <= 1'b1;
                flash_d     <= `ZERO_WORD;
                if (read_op) begin
                    cur_state   <= READ;
                    flash_ce_n  <= 1'b0;
                    flash_oe_n  <= 1'b0;
                    flash_a     <= bus_addr;
                end
            end
            READ: begin
                cur_state   <= IDLE;
                flash_ce_n  <= 1'b1;
                flash_oe_n  <= 1'b1;
                flash_a     <= `ZERO_WORD;

                bus_data_read   <= {flash_d, flash_d};
            end
        endcase
    end
end

endmodule