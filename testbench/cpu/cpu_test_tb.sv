`include "cpu_defines.svh"

module cpu_test_tb();

Bit_t clock_50;
Bit_t rst;
Bit_t       reg_write_enable;
Reg_addr_t  reg_write_addr;
Reg_data_t  reg_write_data;

Bit_t       hilo_we;
Reg_data_t  hi_data;
Reg_data_t  lo_data;

Bit_t       cp0_we;
Reg_addr_t  cp0_waddr;
Reg_data_t  cp0_wdata;

assign reg_write_enable = cpu_test_instance.cpu_instance.reg_write_enable;
assign reg_write_addr = cpu_test_instance.cpu_instance.reg_write_addr;
assign reg_write_data = cpu_test_instance.cpu_instance.reg_write_data;

assign hilo_we = cpu_test_instance.cpu_instance.hilo_we;
assign hi_data = cpu_test_instance.cpu_instance.hi_i;
assign lo_data = cpu_test_instance.cpu_instance.lo_i;

assign cp0_we = cpu_test_instance.cpu_instance.cp0_we_i;
assign cp0_waddr = cpu_test_instance.cpu_instance.cp0_waddr_i;
assign cp0_wdata = cpu_test_instance.cpu_instance.cp0_wdata_i;

initial begin
    clock_50 = 1'b0;
    forever #10 clock_50 = ~ clock_50;
end

initial begin
    rst = `ENABLE;
    #200 rst = `DISABLE;
    #100000 rst = `ENABLE;
    #100200 $stop;
end

cpu_test cpu_test_instance(
    .clk(clock_50),
    .rst
);


task unittest(
    input [128 * 8 - 1:0] name
);

logic is_ok;
integer i, ans, count, true_count;
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
true_count = 0;
is_ok = 1'b1;
while(!$feof(ans)) begin @ (negedge clock_50)
    count = count + 1;
    if (count > 5) begin
        true_count = true_count + 1;
        $fscanf(ans, "%s\n", line);   
        if (reg_write_enable == `ENABLE) begin
            $sformat(out, "%0d:$%0d=0x%x", true_count, reg_write_addr, reg_write_data);
            if (out == line) begin
                $display("[pass] %0s", out);
            end else begin
                $display("[Fail] Expected: %0s, Got: %0s", line, out);
                is_ok = 1'b0;
            end
        end else if (hilo_we == `ENABLE) begin
            $sformat(out, "%0d:hi=0x%x,lo=0x%x", true_count, hi_data, lo_data);
            if (out == line) begin
                $display("[pass] %0s", out);
            end else begin
                $display("[Fail] Expected: %0s, Got: %0s", line, out);
                is_ok = 1'b0;
            end
        end else if (cp0_we == `ENABLE) begin
            $sformat(out, "%0d:cp0.$%0d=0x%x", true_count, cp0_waddr, cp0_wdata);
            if (out == line) begin
                $display("[pass] %0s", out);
            end else begin
                $display("[Fail] Expected: %0s, Got: %0s", line, out);
                is_ok = 1'b0;
            end
        end else begin
            $sformat(out, "%0d:skip", true_count);
            if (line == out) begin
                $display("[pass] %0s", line);
            end else begin
                $display("[Fail] Expected: %0s, Got: %0d:skip", line, true_count);
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
    unittest("write_to_reg0");
    unittest("logic");
    unittest("shift");
    unittest("move");
    unittest("arithmetic_0");
    unittest("arithmetic_1");
    unittest("arithmetic_2");
    unittest("jump");
    unittest("branch");
    unittest("auto_ori");
    unittest("auto_lui");
    unittest("auto_mthi");
    unittest("memory");
    unittest("load");
    unittest("cp0");
    $finish;
end


    
endmodule