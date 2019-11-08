`include "defines.svh"
module sram_test_tb(
    input clk, clk_ram, rst
);

Ram_addr_t  bus_addr;
Bit_t       read_op;
Bit_t       write_op = 0;
Word_t      bus_data_write, bus_data_read;


sram_test sram_test_instance(
    .clk(clk_ram),
    .rst(rst),
    .bus_addr(bus_addr),
    .read_op(read_op),
    .write_op(write_op),
    .bus_data_write(bus_data_write),
    .bus_data_read(bus_data_read)
);

task sram_unittest(
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


while(1) begin @(negedge clk)
    if (flag == 1'b0) begin
        $fscanf(ans, "%s addr:%d=%h\n", op, addr, content);
        bus_data_write = content;
        //$display("op = %s, addr = %d, content = %h", op, addr, content);
        bus_addr = addr;
        if (op == "read") begin
            read_op = 1'b1;
            write_op = 1'b0;
        end else begin
            assert(op == "write");
            read_op = 1'b0;
            write_op = 1'b1;
            //$display("op = %b, addr = %d, content = %h", write_op, addr, content);
        end

        flag = 1'b1;
    end else begin
        if (read_op == 1'b1) begin
            if (bus_data_read == content) begin
                $display("[Pass] Read Addr: %d", addr);
            end else begin
                $display("[Fail] Read Addr: %d, Expected:%h, Got:%h", addr, content, bus_data_read);
                is_ok = 1'b0;
            end
        end else begin
            assert(write_op == 1'b1);
            written_content = {sram_test_instance.fake_sram_instance.sram_mem[addr + 3],
                                sram_test_instance.fake_sram_instance.sram_mem[addr + 2],
                                sram_test_instance.fake_sram_instance.sram_mem[addr + 1],
                                sram_test_instance.fake_sram_instance.sram_mem[addr]};
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



task unittest();
    sram_unittest("sram_read");
    sram_unittest("sram_write");
endtask

endmodule