`include "defines.svh"
module fake_flash(
    //Flash存储器信号，参考 JS28F640 芯片手册
    input Flash_addr_t  flash_a,            //Flash地址，a0仅在8bit模式有效，16bit模式无意义
    inout Halfword_t    flash_d,            //Flash数据
    input Bit_t         flash_ce_n,         //Flash片选信号，低有效
    input Bit_t         flash_oe_n,         //Flash读使能信号，低有效
    input Bit_t         flash_we_n,         //Flash写使能信号，低有效


    //无用信号
    input Bit_t         flash_rp_n,         //Flash复位信号，低有效
    input Bit_t         flash_vpen,         //Flash写保护信号，低电平时不能擦除、烧写
    input Bit_t         flash_byte_n       //Flash 8bit模式选择，低有效。在使用flash的16位模式时请设为1
);
    Halfword_t flash_mem[0: 16384];
    Halfword_t data;
    assign flash_d = data;

    //只考虑读
    initial $readmemh ("flash.mem", flash_mem);

    always_comb begin
        if (flash_ce_n == 1'b1) begin
            data <= 16'b0;
        end else begin
            if (flash_oe_n == 1'b0 && flash_we_n == 1'b1) begin
                //读出
                data <= flash_mem[flash_a[22:1]];
            end else begin
                data <= 16'b0;
            end
        end
    end
endmodule