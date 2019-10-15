`include "cpu_defines.svh"

module cpu_test_tb();

Bit_t clock_50;
Bit_t rst;

initial begin
    clock_50 = 1'b0;
    forever #10 clock_50 = ~ clock_50;
end

initial begin
    rst = `ENABLE;
    #200 rst = `DISABLE;
    #600 rst = `ENABLE;
    #1000 $stop;
end

cpu_test cpu_test_instance(
    .clk(clock_50),
    .rst
);
    
endmodule