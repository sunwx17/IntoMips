`include "defines.svh"

//统一所有peripheral下的测试
module peripheral_test_tb();

Bit_t clk_10, clk_25, clk_50, clk_40, rst;

initial begin
    clk_10 = 1'b0;
    forever #50 clk_10 = ~clk_10;
end

initial begin
    clk_25 = 1'b0;
    forever #20 clk_25 = ~clk_25;
end


initial begin
    clk_40 = 1'b0;
    forever #12.5 clk_40 = ~clk_40;
end

initial begin
    clk_50 = 1'b0;
    forever #10 clk_50 = ~clk_50;
end


initial begin
    rst = 1'b1;
    #200 rst = 1'b0;
end


flash_test_tb flash_test_instance(
    .clk(clk_25),
    .clk_ram(clk_50),
    .rst
);

sram_test_tb sram_test_instance(
    .clk(clk_25),
    .clk_ram(clk_50),
    .rst
);


initial begin
    wait (rst == 1'b0)
    //flash_test_instance.unittest();
    sram_test_instance.unittest();
    $finish;
    $stop;
end

endmodule

