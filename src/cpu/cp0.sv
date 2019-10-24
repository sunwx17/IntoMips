`include  "cpu_defines.svh"

module cp0(
    input               clk, rst,
    input   Bit_t       we_i,
    input   Reg_addr_t  waddr_i,
    input   Reg_data_t  wdata_i,
    input   Reg_addr_t  raddr_i,
    input   logic[5:0]  int_i,  //???
    output  Reg_data_t  data_o,
    output  Reg_data_t  count_o,
    output  Reg_data_t  compare_o,
    output  Reg_data_t  status_o,
    output  Reg_data_t  cause_o,
    output  Reg_data_t  epc_o,
    output  Reg_data_t  config_o,
    output  Reg_data_t  prid_o,
    output  Bit_t       timer_int_o 
);


Regs_t  cp0_regs;

assign count_o = cp0_regs[`CP0_COUNT];
assign compare_o = cp0_regs[`CP0_COMPARE];
assign status_o = cp0_regs[`CP0_STATUS];
assign cause_o = cp0_regs[`CP0_CAUSE];
assign epc_o = cp0_regs[`CP0_EPC];
assign prid_o = cp0_regs[`CP0_PRID];
assign config_o = cp0_regs[`CP0_CONFIG];


always @ (posedge clk) begin
    if(rst == `ENABLE) begin
        cp0_regs[`CP0_COUNT]    <= `ZERO_WORD;
        cp0_regs[`CP0_COMPARE]  <= `ZERO_WORD;
        cp0_regs[`CP0_STATUS]   <= `CP0_STATUS_INIT;
        cp0_regs[`CP0_CAUSE]    <= `ZERO_WORD;
        cp0_regs[`CP0_EPC]      <= `ZERO_WORD;
        cp0_regs[`CP0_PRID]     <= `ZERO_WORD;
        cp0_regs[`CP0_CONFIG]   <= `ZERO_WORD;
        
        timer_int_o <= `DISABLE;
    end else begin
        cp0_regs[`CP0_COUNT] <= cp0_regs[`CP0_COUNT] + 1;
        cp0_regs[`CP0_CAUSE][`CP0_CAUSE_IP_H] <= int_i;

        if(cp0_regs[`CP0_COMPARE]  != `ZERO_WORD && cp0_regs[`CP0_COUNT] == cp0_regs[`CP0_COMPARE]) begin
            timer_int_o <= `ENABLE;
        end

        if(we_i == `ENABLE) begin
            if (`CP0_REGS_CAN_WRITE(waddr_i)) begin
                cp0_regs[waddr_i] <= wdata_i;
            end else if(waddr_i == `CP0_CAUSE) begin
                cp0_regs[waddr_i] <= wdata_i && `CP0_CAUSE_MASK;
            end

            if (waddr_i == `CP0_COMPARE) begin
                timer_int_o <= `DISABLE;
            end
        end
    end
end

always_comb begin
    if(rst == `ENABLE) begin
        data_o <= `ZERO_WORD;
    end else begin
        data_o <= cp0_regs[raddr_i];
    end
end

    
endmodule