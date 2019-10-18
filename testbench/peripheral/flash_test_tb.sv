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
integer count;
logic is_ok;
logic read_flag;
integer ans;
integer addr0, addr1;
Halfword_t content0, content1;

ans = $fopen("flash.ans", "r");

$display("---------------unittest: flash read------------------");
count = 0;
is_ok = 1'b1;
read_flag = 1'b0;
read_op = 1'b0;
while(!$feof(ans)) begin @(negedge clk_10)
    count = count + 1;
    if (read_flag == 1'b0) begin
        $fscanf(ans, "addr:%d=%h\n", addr0, content0);
        //$display("addr = %d, content = %b", addr, content);
        bus_addr = addr0;
        read_op = 1'b1;
        
        read_flag = 1'b1;
    end else begin
        $fscanf(ans, "addr:%d=%h\n", addr1, content1);
        if (bus_data == {content1, content0}) begin
            $display("[Pass] Addr: %d", addr0);
        end else begin
            $display("[Fail] Addr: %d, Expected:%h, Got:%h", addr0, {content1, content0}, bus_data);
            is_ok = 1'b0;
        end
        read_op = 1'b0;
        
        read_flag = 1'b0;
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