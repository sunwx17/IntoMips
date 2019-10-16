`include "cpu_defines.svh"

module cpu_test_tb();

Bit_t clock_50;
Bit_t rst;
Bit_t       reg_write_enable;
Reg_addr_t  reg_write_addr;
Reg_data_t  reg_write_data;

assign reg_write_enable = cpu_test_instance.cpu_instance.reg_write_enable;
assign reg_write_addr = cpu_test_instance.cpu_instance.reg_write_addr;
assign reg_write_data = cpu_test_instance.cpu_instance.reg_write_data;

initial begin
    clock_50 = 1'b0;
    forever #10 clock_50 = ~ clock_50;
end

initial begin
    rst = `ENABLE;
    #200 rst = `DISABLE;
    #5600 rst = `ENABLE;
    #6000 $stop;
end

cpu_test cpu_test_instance(
    .clk(clock_50),
    .rst
);


task unittest(
    input [128 * 8 - 1:0] name
);

logic is_ok;
integer i, ans, count;
string line, out;

for (i = 0; i < $size(cpu_test_instance.fake_rom_instance.inst_mem); i = i + 1) begin
    cpu_test_instance.fake_rom_instance.inst_mem[i] = `ZERO_WORD;
end

ans = $fopen({name, ".ans"}, "r");

$readmemh({name, ".mem"}, cpu_test_instance.fake_rom_instance.inst_mem);

begin
    rst = `ENABLE;
    #100 rst = `DISABLE;
end

$display("----------------unittest: %0s----------------", name);

count = 0;
is_ok = 1'b1;
while(!$feof(ans)) begin @ (negedge clock_50)
    count = count + 1;
    if (count > 4) begin
        $fscanf(ans, "%s\n", line);   
        if (reg_write_enable == `ENABLE) begin
            $sformat(out, "$%0d=0x%x", reg_write_addr, reg_write_data);
            if (out == line) begin
                $display("[pass] %0s", out);
            end else begin
                $display("[Fail] Expected: %0s, Got: %0s", line, out);
                is_ok = 1'b0;
            end
        end
    end
end

if (is_ok == 1'b1) begin
    $display("----------------Pass unittest: %0s----------------", name);
end else begin
    $display("----------------Fail unittest: %0s----------------", name);
end

endtask

initial begin
    wait (rst == `ENABLE);
    unittest("ori0");
    unittest("ori1");
    unittest("ori2");
    $finish;
end


    
endmodule