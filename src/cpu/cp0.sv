`include  "cpu_defines.svh"

module cp0(
    input               clk, rst,
    input   Bit_t       we_i,
    input   Reg_addr_t  waddr_i,
    input   Reg_data_t  wdata_i,
    input   Reg_addr_t  raddr_i,
    input   Bit_t[5:0]  int_i,  //???
    output  Reg_data_t  data_o,

    output  Reg_data_t  index_o,
    output  Reg_data_t  random_o,
    output  Reg_data_t  entrylo0_o,
    output  Reg_data_t  entrylo1_o,
    output  Reg_data_t  context_o,
    output  Reg_data_t  pagemask_o,
    output  Reg_data_t  wired_o,
    output  Reg_data_t  entryhi_o,
    output  Reg_data_t  badvaddr_o,
    
    output  Reg_data_t  count_o,
    output  Reg_data_t  compare_o,
    output  Reg_data_t  status_o,
    output  Reg_data_t  cause_o,
    output  Reg_data_t  epc_o,
    output  Reg_data_t  config_o,
    output  Reg_data_t  ebase_o,

    output  Reg_data_t  breakpoint_o,

    output  Bit_t       timer_int_o,

    input   Bit_t       tlbr_op,
    input   Reg_data_t  entryhi_i,
    input   Reg_data_t  entrylo0_i,
    input   Reg_data_t  entrylo1_i,

    input   Bit_t       tlbp_op,
    input   Reg_data_t  index_i,

    input   Word_t      bad_addr_v,

    input   Excp_t      exception_type_i,
    input   Inst_addr_t pc_i,
    input   Bit_t       is_in_delayslot_i,
    
    input   Bit_t       stallreq_bus
);


Regs_t  cp0_regs;

assign index_o = cp0_regs[`CP0_INDEX];
assign random_o = cp0_regs[`CP0_RANDOM];
assign entrylo0_o = cp0_regs[`CP0_ENTRYLO0];
assign entrylo1_o = cp0_regs[`CP0_ENTRYLO1];
assign context_o = cp0_regs[`CP0_CONTEXT];
assign pagemask_o = cp0_regs[`CP0_PAGEMASK];
assign wired_o = cp0_regs[`CP0_WIRED];
assign entryhi_o = cp0_regs[`CP0_ENTRYHI];
assign badvaddr_o = cp0_regs[`CP0_BADVADDR];

assign count_o = cp0_regs[`CP0_COUNT];
assign compare_o = cp0_regs[`CP0_COMPARE];
assign status_o = cp0_regs[`CP0_STATUS];
assign cause_o = cp0_regs[`CP0_CAUSE];
assign epc_o = cp0_regs[`CP0_EPC];
//assign prid_o = cp0_regs[`CP0_PRID];
assign config_o = cp0_regs[`CP0_CONFIG];

assign ebase_o = cp0_regs[`CP0_EBASE];

assign breakpoint_o = cp0_regs[`CP0_BREAKPOINT];


/*always @ (posedge clk) begin
    if(rst == `ENABLE) begin
    end else if begin
        if (exception_type_i == `EXCP_TYPE_INTERRUPT || (`ORDINARY_EXCEPTION(exception_type_i) && cp0_regs[`CP0_STATUS][`CP0_STATUS_EXL] == `DISABLE)) begin
            if (is_in_delayslot_i == `ENABLE) begin
                cp0_regs[`CP0_EPC] <= pc_i - 4;
                cp0_regs[`CP0_CAUSE] <= `ENABLE;
            end else begin
                cp0_regs[`CP0_EPC] <= pc_i;
                cp0_regs[`CP0_CAUSE] <= `DISABLE;
            end
            cp0_regs[`CP0_STATUS][`CP0_STATUS_EXL] <= `ENABLE;
        end
        case (exception_type_i)
            `EXCP_TYPE_INTERRUPT : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_INTERRUPT;
            end
            `EXCP_TYPE_SYSCALL : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_SYSCALL;
            end
            `EXCP_TYPE_INVALID_INST : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_INVALID_INST;
            end
            `EXCP_TYPE_OV : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_OV;
            end
            `EXCP_TYPE_ERET : begin
                cp0_regs[`CP0_STATUS][`CP0_STATUS_EXL] <= `DISABLE;
            end
            default : begin end
        endcase
    end
end*/


always @ (posedge clk) begin
    if(rst == `ENABLE) begin
        
        cp0_regs[`CP0_INDEX]    <= `ZERO_WORD;
        cp0_regs[`CP0_RANDOM]   <= `TLB_ENTRY_NUM - 1;
        cp0_regs[`CP0_ENTRYLO0] <= `ZERO_WORD;
        cp0_regs[`CP0_ENTRYLO1] <= `ZERO_WORD;
        cp0_regs[`CP0_CONTEXT]  <= `ZERO_WORD;
        cp0_regs[`CP0_PAGEMASK] <= `ZERO_WORD;
        cp0_regs[`CP0_WIRED]    <= `ZERO_WORD;
        cp0_regs[`CP0_ENTRYHI]  <= `ZERO_WORD;
        cp0_regs[`CP0_BADVADDR] <= `ZERO_WORD;

        cp0_regs[`CP0_COUNT]    <= `ZERO_WORD;
        cp0_regs[`CP0_COMPARE]  <= `ZERO_WORD;
        cp0_regs[`CP0_STATUS]   <= `CP0_STATUS_INIT;
        cp0_regs[`CP0_CAUSE]    <= `ZERO_WORD;
        cp0_regs[`CP0_EPC]      <= `ZERO_WORD;
        cp0_regs[`CP0_EBASE]    <= `ZERO_WORD;
        cp0_regs[`CP0_CONFIG]   <= `CP0_CONFIG_INIT;
        cp0_regs[`CP0_BREAKPOINT] <= `ZERO_WORD;
        
        timer_int_o <= `DISABLE;
    end else begin
        cp0_regs[`CP0_COUNT] <= cp0_regs[`CP0_COUNT] + 1;
        cp0_regs[`CP0_RANDOM] <= (cp0_regs[`CP0_RANDOM] > cp0_regs[`CP0_WIRED]) ? cp0_regs[`CP0_RANDOM] - 1 : `TLB_ENTRY_NUM - 1;
        cp0_regs[`CP0_CAUSE][`CP0_CAUSE_IP_H] <= stallreq_bus ? 6'b0 : int_i;

        //$display("count : %x, compare :  %x", cp0_regs[`CP0_COUNT], cp0_regs[`CP0_COMPARE]);

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
        
        if (exception_type_i == EXC_INTERRUPT || (`ORDINARY_EXCEPTION(exception_type_i) && cp0_regs[`CP0_STATUS][`CP0_STATUS_EXL] == `DISABLE)) begin
            if (is_in_delayslot_i == `ENABLE) begin
                cp0_regs[`CP0_EPC] <= pc_i - 4;
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_BD] <= `ENABLE;
            end else begin
                cp0_regs[`CP0_EPC] <= pc_i;
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_BD] <= `DISABLE;
            end
            cp0_regs[`CP0_STATUS][`CP0_STATUS_EXL] <= stallreq_bus ? `DISABLE : `ENABLE;
        end
        case (exception_type_i)
            EXC_INTERRUPT : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_INTERRUPT;
            end
            EXC_SYSCALL : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_SYSCALL;
            end
            EXC_INVALID_INST : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_INVALID_INST;
            end
            EXC_OV : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_OV;
            end
            EXC_ERET : begin
                cp0_regs[`CP0_STATUS][`CP0_STATUS_EXL] <= `DISABLE;
            end
            EXC_INST_TLB_REFILL, EXC_INST_TLB_INVALID : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_TLBL;//TODO
                cp0_regs[`CP0_CONTEXT][`CP0_CONTEXT_BADVPN2] <= bad_addr_v[`ADDR_VPN2];
                cp0_regs[`CP0_ENTRYHI][`CP0_ENTRYHI_VPN2] <= bad_addr_v[`ADDR_VPN2];
                cp0_regs[`CP0_BADVADDR] <= bad_addr_v;
                //cp0_regs[`CP0_EPC] <= bad_addr_v;
            end
            EXC_DATA_TLB_REFILL_LOAD, EXC_DATA_TLB_INVALID_LOAD : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_TLBL;//TODO
                cp0_regs[`CP0_CONTEXT][`CP0_CONTEXT_BADVPN2] <= bad_addr_v[`ADDR_VPN2];
                cp0_regs[`CP0_ENTRYHI][`CP0_ENTRYHI_VPN2] <= bad_addr_v[`ADDR_VPN2];
                cp0_regs[`CP0_BADVADDR] <= bad_addr_v;
            end
            EXC_DATA_TLB_REFILL_STORE, EXC_DATA_TLB_INVALID_STORE : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_TLBS;//TODO
                cp0_regs[`CP0_CONTEXT][`CP0_CONTEXT_BADVPN2] <= bad_addr_v[`ADDR_VPN2];
                cp0_regs[`CP0_ENTRYHI][`CP0_ENTRYHI_VPN2] <= bad_addr_v[`ADDR_VPN2];
                cp0_regs[`CP0_BADVADDR] <= bad_addr_v;
            end
            EXC_BREAKPOINT : begin
                cp0_regs[`CP0_CAUSE][`CP0_CAUSE_EXCCODE] <= `EXC_CODE_BREAKPOINT;
            end
            default : begin end
        endcase

        if (tlbr_op) begin
            cp0_regs[`CP0_ENTRYHI]  <= entryhi_i;
            cp0_regs[`CP0_ENTRYLO0] <= entrylo0_i;
            cp0_regs[`CP0_ENTRYLO1] <= entrylo1_i;
        end

        if (tlbp_op) begin
            cp0_regs[`CP0_INDEX] <= index_i;
        end

    end
end

always_comb begin
    if(rst == `ENABLE) begin
        data_o <= `ZERO_WORD;
    end else begin
        data_o <= cp0_regs[raddr_i];
        if (tlbr_op) begin
            if (raddr_i == `CP0_ENTRYHI) begin
                data_o  <= entryhi_i;
            end else if (raddr_i == `CP0_ENTRYLO0) begin
                data_o  <= entrylo0_i;
            end else if (raddr_i == `CP0_ENTRYLO1) begin
                data_o  <= entrylo1_i;
            end
        end
        if (tlbp_op && raddr_i == `CP0_INDEX) begin
            data_o <= index_i;
        end
    end
end

    
endmodule
