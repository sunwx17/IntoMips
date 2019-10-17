`include "defines.svh"
module sram_controller (
    //时钟信号
    input Bit_t clk,
    input Bit_t rst,

    //总线信号
    input Bit_t read_op, //是否读
    input Bit_t write_op, //是否写
    inout Word_t bus_data, //总线数据
    //inout wire[31:0] bus_data,
    input Ram_addr_t bus_addr, //数据地址
    input logic[3:0] byte_mask,
    output Bit_t bus_stall, //总线使能
    
    
    //RAM信号
    inout Word_t ram_data,
    //inout wire[31:0] ram_data,
    output Ram_addr_t ram_addr,
    output logic[3:0] ram_be_n,
    output logic ram_ce_n,
    output logic ram_oe_n,
    output logic ram_we_n

);
    typedef enum {IDLE, PREPARE, HOLD} State_t;
    State_t cur_state = IDLE, nxt_state = IDLE;

    assign ram_be_n = ~byte_mask;
    //assign ram_be_n = 4'b0000;
    
    Word_t data_read, data_write;
    assign bus_data = read_op ? data_read: `ZERO_WORD;
    assign ram_data = write_op ? data_write: `HIGH_WORD;

    Ram_addr_t inner_addr;
    assign inner_addr = bus_addr;


    //更新逻辑
    always_ff @(posedge clk or posedge rst) begin
        $display("into update $t=", $time);
        if (rst) begin
            cur_state <= IDLE;
            $display("rst to idle time = %t", $time);
        end else begin
            cur_state <= nxt_state;
            $display("cur_state = %b time = %t", cur_state, $time);
        end
    end
    
    //次态逻辑
    always_ff @(cur_state or read_op or write_op) begin
        case(cur_state)
            IDLE: begin
                //判断当前读写操作类型 转换状态
                nxt_state <= read_op | write_op? PREPARE: IDLE;
                $display("IDLE read_op/write_op = %b, %b, time = %t", read_op, write_op, $time);
            end                
            PREPARE: begin
                nxt_state <= HOLD;
            end
            HOLD: begin
                nxt_state <= IDLE;
            end
        endcase
    end
    
    //输出逻辑
    always_ff @(cur_state) begin
        case(cur_state)
            PREPARE: begin
                ram_ce_n <= ~(read_op | write_op);
                ram_addr <= read_op | write_op ? inner_addr: `HIGH_WORD;
          
                ram_oe_n <= ~read_op;
                ram_we_n <= ~write_op;
                $display("print IDLE read_op/write_op = %b, %b, time = %t", read_op, write_op, $time);
            end                
            HOLD: begin            
                if (read_op) data_read <= ram_data;
                if (write_op) data_write <= bus_data;
                $display("print PREPARE read_op/write_op = %b, %b, time = %t", read_op, write_op, $time);
            end
            IDLE: begin
                ram_ce_n <= 1'b1;
                ram_addr <= `HIGH_WORD;
                ram_oe_n <= 1'b1;
                ram_we_n <= 1'b1;
                $display("print HOLD read_op/write_op = %b, %b, time = %t", read_op, write_op, $time);
            end
        endcase
    end        
            
endmodule
