`include "defines.svh"
module sram_test_tb();
Bit_t clk_10 = 0, clk_40, rst;

Ram_addr_t  bus_addr;
Bit_t       read_op;
Bit_t       write_op = 0;
wire[31:0] bus_data;
Word_t      bus_data_assign = 0;

assign bus_data = write_op? bus_data_assign: `HIGH_WORD;

Bit_t       bus_stall;


sram_test sram_test_instance(
    .clk(clk_40),
    .rst(rst),
    .bus_addr(bus_addr),
    .read_op(read_op),
    .write_op(write_op),
    .bus_data(bus_data),
    .bus_stall(bus_stall)
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
    write_op = 1'b0;
    bus_addr = 0;
end


task unittest(
    input [128 * 5 - 1:0] name
);

logic is_ok;
logic flag;
integer ans;
integer addr;
Word_t content, written_content;
logic [128 * 8 - 0: 0] op;

ans = $fopen({name, ".ans"}, "r");
$readmemh({name, ".mem"}, sram_test_instance.fake_sram_instance.sram_mem);


$display("---------------unittest: %0s------------------", name);
is_ok = 1'b1;
flag = 1'b0;
read_op = 1'b0;
write_op = 1'b0;
written_content = 0;


while(1) begin @(negedge clk_10)
    if (flag == 1'b0) begin
        $fscanf(ans, "%s addr:%d=%h\n", op, addr, content);
        bus_data_assign = content;
        //$display("op = %s, addr = %d, content = %h", op, addr, content);
        bus_addr = addr;
        if (op == "read") begin
            read_op = 1'b1;
            write_op = 1'b0;
        end else begin
            assert(op == "write");
            //bus_data_assign = content;
            read_op = 1'b0;
            write_op = 1'b1;
        end
        
        flag = 1'b1;
    end else begin
        if (read_op == 1'b1) begin
            if (bus_data == content) begin
                $display("[Pass] Read Addr: %d", addr);
            end else begin
                $display("[Fail] Read Addr: %d, Expected:%h, Got:%h", addr, content, bus_data);
                is_ok = 1'b0;
            end
        end else begin
            assert(write_op == 1'b1);
            written_content = sram_test_instance.fake_sram_instance.sram_mem[addr];
            if (written_content == content) begin
                $display("[Pass] Write Addr: %d", addr);
            end else begin
                $display("[Fail] Write Addr: %d, Expected:%h, Got:%h", addr, content, written_content);
                is_ok = 1'b0;
            end
        end

        read_op = 1'b0;
        write_op = 1'b0;

        flag = 1'b0;
        if ($feof(ans)) break;
    end
end


if (is_ok == 1'b1) begin
    $display("----------------Pass unittest: %0s----------------", name);
end else begin
    $display("----------------Fail unittest: %0s----------------", name);
end

endtask


initial begin
    wait (rst == 1'b0)
    unittest("sram_read");
    unittest("sram_write");
    $finish;
end



endmodule