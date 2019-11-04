`include "defines.svh"
module flash_test_tb(
    input clk, clk_ram, rst
);

Flash_addr_t    bus_addr = 0;
Bit_t           read_op = 0;
Word_t          bus_data_read, bus_data_write;



flash_test flash_test_instance(
    .clk(clk_ram),
    .rst(rst),
    .bus_addr(bus_addr),
    .read_op(read_op),
    .bus_data_read(bus_data_read),
    .bus_data_write(bus_data_write)
);

task unittest();
//读 测试
logic is_ok;
logic read_flag;
integer ans;
integer addr;
Word_t content;

ans = $fopen("flash.ans", "r");

$display("---------------unittest: flash_read------------------");
is_ok = 1'b1;
read_flag = 1'b0;
read_op = 1'b0;
while(1) begin @(negedge clk)
    if (read_flag == 1'b0) begin
        $fscanf(ans, "addr:%d=%h\n", addr, content);
        //$display("addr = %d, content = %h", addr, content);
        bus_addr = addr;
        read_op = 1'b1;
        
        read_flag = 1'b1;
    end else begin
        if (bus_data_read == content) begin
            $display("[Pass] Addr: %d", addr);
        end else begin
            $display("[Fail] Addr: %d, Expected:%h, Got:%h", addr, content, bus_data_read);
            is_ok = 1'b0;
        end
        read_op = 1'b0;
        read_flag = 1'b0;
        if ($feof(ans)) break;
    end
end
 

if (is_ok == 1'b1) begin
    $display("---------------Pass unittest: flash_read------------------");
end else begin
    $display("---------------Fail unittest: flash_read------------------");
end

endtask

endmodule