`include "defines.svh"

module flash_controller(
    input logic clk,
    input logic rst,

    input Flash_addr_t bus_addr,    //总线地址
    input logic read_op, //读信号
    inout Word_t buf_data, //总线数据(32位)

    //Flash存储器信号，参考 JS28F640 芯片手册
    output Flash_addr_t flash_a,      //Flash地址，a0仅在8bit模式有效，16bit模式无意义
    inout  Halfword_t flash_d,      //Flash数据
    output logic flash_rp_n,         //Flash复位信号，低有效
    output logic flash_vpen,         //Flash写保护信号，低电平时不能擦除、烧写
    output logic flash_ce_n,         //Flash片选信号，低有效
    output logic flash_oe_n,         //Flash读使能信号，低有效
    output logic flash_we_n,         //Flash写使能信号，低有效
    output logic flash_byte_n       //Flash 8bit模式选择，低有效。在使用flash的16位模式时请设为1
);

    assign flash_rp_n = 1'b1; //防止不必要延迟
    assign flash_vpen = 1'b0;
    assign flash_byte_n = 1'b1; //使用16bit模式(halfword)
    
    //不支持写
    assign flash_we_n = 1'b1;

    Word_t data_read; //存储读取的data
    logic read_prepared = 1'b0; //是否以准备好数据
    assign buf_data = read_prepared? data_read: `HIGH_WORD;    

    Flash_addr_t inner_addr; //存储读取的addr

    typedef enum {IDLE, PREPARE, READ_0, READ_1} state_t;

    state_t cur_state = IDLE, nxt_state = IDLE;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            cur_state <= IDLE;
        end else begin
            cur_state <= nxt_state;
        end
    end

    //次态逻辑
    always @ (cur_state or read_op) begin
        case(cur_state)
            IDLE: begin
                nxt_state <= read_op? PREPARE: IDLE;
            end
            PREPARE: begin
                nxt_state <= READ_0;
            end
            READ_0: begin
                nxt_state <= READ_1;
            end
            READ_1: begin
                nxt_state <= IDLE;
            end
        endcase
    end

    //输出逻辑
    always @ (cur_state) begin
        case(cur_state)
            IDLE: begin
                flash_ce_n <= 1'b1;
                flash_oe_n <= 1'b1;

                flash_a <= 23'bZ;
            end
            PREPARE: begin
                flash_a <= bus_addr;
                flash_ce_n <= 1'b0;
                flash_oe_n <= 1'b0;
                read_prepared <= 1'b0;
            end
            READ_0: begin
                 //读取第一个halfword
                data_read[15:0] <= flash_d;
                //更新地址
                flash_a <= bus_addr + 2'h2;
            end
            READ_1: begin
                //读取第二个halfword
                data_read[31:16] <= flash_d;
                //可以读取
                read_prepared <= 1'b1;
            end
        endcase
    end
endmodule