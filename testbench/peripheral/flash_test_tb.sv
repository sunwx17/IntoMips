`include "defines.svh"
module flash_test_tb();
Bit_t clk_10, clk_40, rst;

Flash_addr_t    bus_addr;
Bit_t           read_op;
wire [31:0]    bus_data;



flash_test flash_test_instance(
    .clk(clk_40),
    .rst(rst),
    .bus_addr(bus_addr),
    .read_op(read_op),
    .bus_data(bus_data)
);


initial begin
    clk_10 = 1'b0;
    forever #50 clk_10 = ~clk_10;
end

initial begin
    clk_40 = 1'b0;
    forever #12.5 clk_40 = ~clk_40;
end

initial begin
    rst = 1'b1;
    #200 rst = 1'b0;
end

initial begin
    read_op = 1'b0;
    bus_addr = 0;
end

task unittest();
//读 测试
logic is_ok;
logic read_flag;
integer ans;
integer addr;
Word_t content;

ans = $fopen("flash.ans", "r");

$display("---------------unittest: flash read------------------");
is_ok = 1'b1;
read_flag = 1'b0;
read_op = 1'b0;
while(1) begin @(negedge clk_10)
    if (read_flag == 1'b0) begin
        $fscanf(ans, "addr:%d=%h\n", addr, content);
        //$display("addr = %d, content = %h", addr, content);
        bus_addr = addr;
        read_op = 1'b1;
        
        read_flag = 1'b1;
    end else begin
        if (bus_data == content) begin
            $display("[Pass] Addr: %d", addr);
        end else begin
            $display("[Fail] Addr: %d, Expected:%h, Got:%h", addr, content, bus_data);
            is_ok = 1'b0;
        end
        read_op = 1'b0;
        read_flag = 1'b0;
        if ($feof(ans)) break;
    end
end
 

if (is_ok == 1'b1) begin
    $display("---------------Pass unittest: flash read------------------");
end else begin
    $display("---------------Fail unittest: flash read------------------");
end

endtask




initial begin
    wait (rst == 1'b0)
    unittest();
    $finish;
end
endmodule