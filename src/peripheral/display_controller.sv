`include "peripheral_defines.svh"
module display_controller (
    input Bit_t     clk,
    input Bit_t     rst,

    //总线信号
    input Bit_t     read_op,
    input Bit_t     write_op,
    input Word_t    bus_data_write,
    output Word_t   bus_data_read,
    input Word_t    bus_addr,

    input  Halfbyte_t   touch_btn,  //BTN1~BTN4，按钮开关，按下时为1
    input  Word_t       dip_sw,     //32位拨码开关，拨到“ON”时�??1
    output Halfword_t   leds,       //16位LED，输出时1点亮
    output Byte_t       dpy0,       //数码管低位信号，包括小数点，输出1点亮
    output Byte_t       dpy1       //数码管高位信号，包括小数点，输出1点亮
);

Halfbyte_t high_lut_in, low_lut_in;
Halfword_t leds_in;
assign leds = leds_in;


always_ff @ (posedge clk or posedge rst) begin
    if (rst) begin
        high_lut_in <= `ZERO_WORD;
        low_lut_in  <= `ZERO_WORD;

        bus_data_read <= `ZERO_WORD;
        low_lut_in <= `ZERO_WORD;
        high_lut_in <= `ZERO_WORD;
        leds_in <= `ZERO_WORD;
    end else begin
        if (read_op) begin
            if (`ADDR_IN_DIP_SW(bus_addr)) begin
                bus_data_read <= dip_sw;
            end else if (`ADDR_IN_TOUCH_BTN(bus_addr)) begin
                bus_data_read <= {8{touch_btn}};
            end 
        end else if (write_op) begin
            if (`ADDR_IN_NUM(bus_addr)) begin
                low_lut_in <= bus_data_write[3:0];
                high_lut_in <= bus_data_write[7:4];
            end else if (`ADDR_IN_LED(bus_addr)) begin
                leds_in <= bus_data_write[15:0];
            end
        end
    end
end



seg7_lut high_lut(
    .iDIG(high_lut_in),
    .oSEG1(dpy1)
);
seg7_lut low_lut(
    .iDIG(low_lut_in),
    .oSEG1(dpy0)
);

endmodule 