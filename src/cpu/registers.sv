`include "defines.svh"

module registers(
    // clock
    input   Bit_t    clk,
    input   Bit_t    rst,

    // write
    input   Bit_t       write_enable,
    input   Reg_addr_t  write_addr,
    input   Reg_data_t  write_data,

    // read 1
    input   Bit_t       read_enable_1,
    input   Reg_addr_t  read_addr_1,
    
    // read 2
    input   Bit_t       read_enable_2,
    input   Reg_addr_t  read_addr_2,

    // output
    output  Reg_data_t  data_1,
    output  Reg_data_t  data_2

);

Regs_t regs;
integer i;


always @ (posedge clk) begin
    if (rst == `ENABLE) begin
        for (i = 0; i < `REG_NUM; i = i + 1) begin
            regs[i] <= `ZERO_WORD;
        end
    end else begin
        if (write_enable == `ENABLE && write_addr != `REG_ZERO) begin
            regs[write_addr] <= write_data;
        end
    end
end

always_comb begin
    data_1 <= `ZERO_WORD;
    if (rst == `DISABLE) begin
        if (read_enable_1 == `ENABLE && read_addr_1 != `REG_ZERO) begin
            if ((read_addr_1 != write_addr) || ~write_enable) begin
                data_1 <= regs[read_addr_1];
            end else begin
                data_1 <= write_data;
            end
        end
    end
end

always_comb begin
    data_2 <= `ZERO_WORD;
    if (rst == `DISABLE) begin
        if (read_enable_2 == `ENABLE && read_addr_2 != `REG_ZERO) begin
            if ((read_addr_2 != write_addr) || ~write_enable) begin
                data_2 <= regs[read_addr_2];
            end else begin
                data_2 <= write_data;
            end
        end
    end
end



endmodule