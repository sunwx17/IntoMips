`include "defines.svh"

module flash_controller(
    input clk, rst,

    input Flash_addr_t  bus_addr,       //总线地址
    input Bit_t         read_op,        //读信号
    inout Word_t        bus_data,       //总线数据(32位)

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
    assign flash_ce_n = 1'b0; //可以?
    
    //不支持写
    assign flash_we_n = 1'b1;

    Word_t data_read; //存储读取的data
    //Halfword_t data_read_low, data_read_high;
    //logic read_prepared; //是否以准备好数据
    //assign bus_data = read_prepared? data_read: `ZERO_WORD;
    //assign bus_data = (read_op == 1'b1)? data_read: `ZERO_WORD;
    assign bus_data = data_read;
    //assign bus_data = read_op? {data_read_high, data_read_low}: `ZERO_WORD;
    //assign data_read = read_prepared? bus_data: `ZERO_WORD;
    //assign bus_data = data_read;

    Flash_addr_t inner_addr; //存储读取的addr
    //assign inner_addr = bus_addr;
    assign flash_a = inner_addr;

    typedef enum {IDLE, PREPARE, READ_0, READ_1} state_t;

    state_t cur_state = IDLE, nxt_state = IDLE;
    
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            cur_state <= IDLE;
            flash_oe_n <= 1'b1;
            inner_addr <= 0;
            data_read <= 0;
             //$display("in rst time = %t", $time);
        end else begin
            case(cur_state)
                IDLE: begin
                    flash_oe_n <= read_op? 1'b0: 1'b1;
                    inner_addr <= read_op? bus_addr: 0;
                    cur_state <= read_op? READ_0: IDLE;
                end
                READ_0: begin
                    data_read[15:0] <= flash_d;
                    inner_addr <= bus_addr + 2'h2;
                    cur_state <= READ_1;
                end
                READ_1: begin
                    data_read[31:16] <= flash_d;
                    //???
                    cur_state <= IDLE;
                end
            endcase
        end
    end
    /*

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            cur_state <= IDLE;
            flash_ce_n <= 1'b1;
            flash_oe_n <= 1'b0;
            $display("in rst time = %t", $time);
        end else begin
            if (clk) begin
                case(cur_state)
                    IDLE: begin
                        flash_ce_n <= 1'b0;
                        flash_oe_n <= 1'b1;
                        
                        inner_addr <= 0;
                        cur_state <= read_op? PREPARE: IDLE;
                        #(50)$display("in IDLE time = %t read_op = %b", $time, read_op);
                    end
                    PREPARE: begin
                        inner_addr <= bus_addr;
                        flash_oe_n <= 1'b0;
                        cur_state <= READ_0;
                        #(50)$display("in PREPARE time = %t inner_addr = %b bus_addr = %b", $time, inner_addr, bus_addr);
                    end
                    READ_0: begin
                        data_read[15:0] <= flash_d;
                        inner_addr <= bus_addr + 2'h2;
                        cur_state <= READ_1;
                        #(50)$display("in READ_0 time = %t inner_addr = %b", $time, inner_addr);
                    end
                    READ_1: begin
                        data_read[31:16] <= flash_d;
                        cur_state <=IDLE;
                        #(50)$display("in READ_1 time = %t", $time);
                    end
                endcase
            end
        end
    end
                        
    */

    /*
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            cur_state <= IDLE;
            $display("state change (rst) time = %t", $time);
        end else begin
            cur_state <= nxt_state;
            $display("state change (else) time = %t", $time);
        end
    end

    //次态逻辑
    always @ (cur_state or read_op) begin
        case(cur_state)
            IDLE: begin
                nxt_state <= read_op? PREPARE: IDLE;
                $display("nxt in IDLE time = %t", $time);
            end
            PREPARE: begin
                nxt_state <= READ_0;
                $display("nxt in PREPARE time = %t", $time);
            end
            READ_0: begin
                nxt_state <= READ_1;
                $display("nxt in READ_0 time = %t", $time);
            end
            READ_1: begin
                nxt_state <= IDLE;
                $display("nxt in READ_1 time = %t", $time);
            end
        endcase
    end

    //输出逻辑
    always @ (cur_state) begin
        case(cur_state)
            IDLE: begin
                flash_ce_n <= 1'b1;
                flash_oe_n <= 1'b1;

                //flash_a <= 23'b0;
                inner_addr <= 23'b0;
                
                data_read <= `ZERO_WORD;
            end
            PREPARE: begin
                //flash_a <= inner_addr;
                inner_addr <= bus_addr;
                //flash_a <= bus_addr;
                flash_ce_n <= 1'b0;
                flash_oe_n <= 1'b0;
                //read_prepared <= 1'b0;
                #(50)$display("PREPARE flash_a = %b inner_addr = %b bus_addr = %b", flash_a, inner_addr, bus_addr);
            end
            READ_0: begin
                 //读取第一个halfword
                data_read[15:0] <= flash_d;
                //data_read_low <= flash_d;
                //更新地址
                //flash_a <= inner_addr + 2'h2;
                inner_addr <= bus_addr + 2'h2;
                //inner_addr <= 23'b11111111111111111111111;
                //flash_a <= bus_addr + 2'b10;
                #(50)$display("READ_0 flash_a = %b", flash_a);
            end
            READ_1: begin
                //读取第二个halfword
                //data_read_high <= flash_d;
                data_read[31:16] <= flash_d;
                //可以读取
                //read_prepared <= 1'b1;
            end
        endcase
    end
    */
endmodule