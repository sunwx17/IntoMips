`include "cpu_defines.svh"

module mem(
    input               rst,

    input   Bit_t       wreg_write_i,
    input   Reg_addr_t  wreg_addr_i,
    input   Word_t      wreg_data_i,

    output  Bit_t       wreg_write_o,
    output  Reg_addr_t  wreg_addr_o,
    output  Word_t      wreg_data_o,

    //hilo
    input   Bit_t       whilo_i,
    input   Word_t      hi_i,
    input   Word_t      lo_i,

    output  Bit_t       whilo_o,
    output  Word_t      hi_o,
    output  Word_t      lo_o,

    //memory operations
    input   Oper_t      oper_i,
    input   Word_t      mem_oper_addr,
    input   Word_t      mem_oper_data,

    input   Word_t      mem_data_i,
    output  Word_t      mem_addr_o,
    output  Word_t      mem_data_o,
    output  Bit_t       mem_we_o,
    output  Bit_t       mem_re_o,
    output  Mask_t      mem_mask_o,

    //cp0
    input   Bit_t       cp0_reg_we_i,
    input   Reg_addr_t  cp0_reg_write_addr_i,
    input   Word_t      cp0_reg_data_i,

    output  Bit_t       cp0_reg_we_o,
    output  Reg_addr_t  cp0_reg_write_addr_o,
    output  Word_t      cp0_reg_data_o,

    input   Excp_set_t  exception_type_i,
    input   Inst_addr_t pc_i,
    input   Bit_t       is_in_delayslot_i,
    input   Word_t      cp0_status_i,
    input   Word_t      cp0_cause_i,
    input   Word_t      cp0_epc_i,
    input   Bit_t       wb_cp0_reg_we,
    input   Reg_addr_t  wb_cp0_reg_write_addr,
    input   Word_t      wb_cp0_reg_data,
    output  Excp_t      exception_type_o,
    output  Inst_addr_t pc_o,
    output  Bit_t       is_in_delayslot_o,
    output  Word_t      cp0_epc_o,

    input   Inst_addr_t inst_addr_v,
    input   Word_t      data_addr_v,
    output  Word_t      bad_addr_v,

    output  Bit_t       tlb_p,
    output  Bit_t       tlb_r,
    output  Bit_t       tlb_wi,
    output  Bit_t       tlb_wr
);

assign is_in_delayslot_o = is_in_delayslot_i;
assign pc_o = pc_i;

Word_t  cp0_epc;
Word_t  cp0_cause;
Word_t  cp0_status;

assign cp0_epc_o = cp0_epc;

assign tlb_p  = (oper_i == OP_TLBP);
assign tlb_r  = (oper_i == OP_TLBR);
assign tlb_wi = (oper_i == OP_TLBWI);
assign tlb_wr = (oper_i == OP_TLBWR);

always_comb begin
    if(rst == `ENABLE) begin
        cp0_epc <= `ZERO_WORD;
        cp0_cause <= `ZERO_WORD;
        cp0_status <= `ZERO_WORD;
    end else begin
        cp0_epc <= cp0_epc_i;
        cp0_cause <= cp0_cause_i;
        cp0_status <= cp0_status_i;
        if(wb_cp0_reg_we == `ENABLE) begin
            if(wb_cp0_reg_write_addr == `CP0_CAUSE) begin
                cp0_cause <= wb_cp0_reg_data & `CP0_CAUSE_MASK;
            end else if(wb_cp0_reg_write_addr == `CP0_EPC) begin
                cp0_epc <= wb_cp0_reg_data;
            end else if(wb_cp0_reg_write_addr == `CP0_STATUS) begin
                cp0_status <= wb_cp0_reg_data;
            end 
        end
    end
end

always_comb begin
    if (rst == `ENABLE) begin
        exception_type_o <= EXC_NO;
        bad_addr_v <= `ZERO_WORD;
    end else begin
        exception_type_o <= EXC_NO;
        bad_addr_v <= `ZERO_WORD;
        if(pc_i != `PC_RESET_ADDR) begin
            if(((cp0_cause[`CP0_CAUSE_IP] & cp0_status[`CP0_STATUS_IM]) != `ZERO_BYTE) && cp0_status[1] == `DISABLE && cp0_status[0] == `ENABLE) begin
                exception_type_o <= EXC_INTERRUPT;
            end else if (exception_type_i.inst_tlb_refill) begin
                exception_type_o <= EXC_INST_TLB_REFILL;
                bad_addr_v <= inst_addr_v;
            end else if (exception_type_i.inst_tlb_invalid) begin
                exception_type_o <= EXC_INST_TLB_INVALID;
                bad_addr_v <= inst_addr_v;
            end else if (exception_type_i.syscall) begin
                exception_type_o <= EXC_SYSCALL;
            end else if (exception_type_i.invalid_inst) begin
                exception_type_o <= EXC_INVALID_INST;
            end else if (exception_type_i.ov) begin
                exception_type_o <= EXC_OV;
            end else if (exception_type_i.eret) begin
                exception_type_o <= EXC_ERET;
            end else if (exception_type_i.data_tlb_refill_load) begin
                exception_type_o <= EXC_DATA_TLB_REFILL_LOAD;
                bad_addr_v <= data_addr_v;
            end else if (exception_type_i.data_tlb_invalid_load) begin
                exception_type_o <= EXC_DATA_TLB_INVALID_LOAD;
                bad_addr_v <= data_addr_v;
            end else if (exception_type_i.data_tlb_refill_store) begin
                exception_type_o <= EXC_DATA_TLB_REFILL_STORE;
                bad_addr_v <= data_addr_v;
            end else if (exception_type_i.data_tlb_invalid_store) begin
                exception_type_o <= EXC_DATA_TLB_INVALID_STORE;
                bad_addr_v <= data_addr_v;
            end
        end
    end
end

Bit_t   mem_we, mem_re;

assign mem_we_o = mem_we & (~(|exception_type_i));
assign mem_re_o = mem_re & (~(|exception_type_i));


always_comb begin
    if (rst == `ENABLE) begin 
        wreg_write_o <= `DISABLE;
        wreg_addr_o  <= `REG_ZERO;
        wreg_data_o  <= `ZERO_WORD;

        whilo_o      <= `DISABLE;
        hi_o         <= `ZERO_WORD;
        lo_o         <= `ZERO_WORD;
        mem_addr_o   <= `ZERO_WORD;
        mem_data_o   <= `ZERO_WORD;
        mem_we     <= `DISABLE;
        mem_re     <= `DISABLE;
        mem_mask_o   <= 4'b0;

        cp0_reg_we_o         <= `DISABLE;
        cp0_reg_write_addr_o <= `REG_ZERO;
        cp0_reg_data_o       <= `ZERO_WORD;
    end else begin
        wreg_write_o <= wreg_write_i & (~(|exception_type_i));
        wreg_addr_o  <= wreg_addr_i;
        wreg_data_o  <= wreg_data_i;

        whilo_o      <= whilo_i & (~(|exception_type_i));
        hi_o         <= hi_i;
        lo_o         <= lo_i;

        mem_addr_o   <= mem_oper_addr;
        //mem_data_o   <= mem_oper_data;

        cp0_reg_we_o         <= cp0_reg_we_i;
        cp0_reg_write_addr_o <= cp0_reg_write_addr_i;
        cp0_reg_data_o       <= cp0_reg_data_i;

        mem_we     <= `DISABLE;
        mem_re     <= `DISABLE;
        mem_mask_o   <= 4'b0;

        case (oper_i)
            OP_LB  : begin
                mem_re    <= `ENABLE;
                //mem_mask_o  <= 4'b0001;
                case (mem_oper_addr[1:0])
                    2'b00 : begin
                        wreg_data_o <= { {24{mem_data_i[7]}}, mem_data_i[7:0] };
                        mem_mask_o  <= 4'b0001;
                    end
                    2'b01 : begin
                        wreg_data_o <= { {24{mem_data_i[15]}}, mem_data_i[15:8] };
                        mem_mask_o  <= 4'b0010;
                    end
                    2'b10 : begin
                        wreg_data_o <= { {24{mem_data_i[23]}}, mem_data_i[23:16] };
                        mem_mask_o  <= 4'b0100;
                    end
                    2'b11 : begin
                        wreg_data_o <= { {24{mem_data_i[31]}}, mem_data_i[31:24] };
                        mem_mask_o  <= 4'b1000;
                    end
                    default: begin
                        wreg_data_o <= `ZERO_WORD;
                        mem_mask_o  <= 4'b0000;
                    end
                endcase
                //wreg_data_o <= { {24{mem_data_i[7]}}, mem_data_i[7:0] };
            end
            OP_LBU : begin
                mem_re    <= `ENABLE;
                case (mem_oper_addr[1:0])
                    2'b00 : begin
                        wreg_data_o <= { 24'b0, mem_data_i[7:0] };
                        mem_mask_o  <= 4'b0001;
                    end
                    2'b01 : begin
                        wreg_data_o <= { 24'b0, mem_data_i[15:8] };
                        mem_mask_o  <= 4'b0010;
                    end
                    2'b10 : begin
                        wreg_data_o <= { 24'b0, mem_data_i[23:16] };
                        mem_mask_o  <= 4'b0100;
                    end
                    2'b11 : begin
                        wreg_data_o <= { 24'b0, mem_data_i[31:24] };
                        mem_mask_o  <= 4'b1000;
                    end
                    default: begin
                        wreg_data_o <= `ZERO_WORD;
                        mem_mask_o  <= 4'b0000;
                    end
                endcase
                
                //mem_mask_o  <= 4'b0001;
                //wreg_data_o <= { 24'b0, mem_data_i[7:0] };
            end
            OP_LH  : begin
                mem_re    <= `ENABLE;
                case (mem_oper_addr[1:0])
                    2'b00 : begin
                        wreg_data_o <= { {16{mem_data_i[15]}}, mem_data_i[15:0] };
                        mem_mask_o  <= 4'b0011;
                    end
                    2'b01 : begin//TODO
                        wreg_data_o <= `ZERO_WORD;
                        mem_mask_o  <= 4'b0000;
                    end
                    2'b10 : begin
                        wreg_data_o <= { {16{mem_data_i[31]}}, mem_data_i[31:16] };
                        mem_mask_o  <= 4'b1100;
                    end
                    2'b11 : begin//TODO
                        wreg_data_o <= `ZERO_WORD;
                        mem_mask_o  <= 4'b0000;
                    end
                    default: begin
                        wreg_data_o <= `ZERO_WORD;
                        mem_mask_o  <= 4'b0000;
                    end
                endcase
                //mem_mask_o  <= 4'b0011;
                //wreg_data_o <= { {16{mem_data_i[15]}}, mem_data_i[15:0] };
            end
            OP_LHU : begin
                mem_re    <= `ENABLE;
                case (mem_oper_addr[1:0])
                    2'b00 : begin
                        wreg_data_o <= { 16'b0, mem_data_i[15:0] };
                        mem_mask_o  <= 4'b0011;
                    end
                    2'b01 : begin//TODO
                        wreg_data_o <= `ZERO_WORD;
                        mem_mask_o  <= 4'b0000;
                    end
                    2'b10 : begin
                        wreg_data_o <= { 16'b0, mem_data_i[31:16] };
                        mem_mask_o  <= 4'b1100;
                    end
                    2'b11 : begin//TODO
                        wreg_data_o <= `ZERO_WORD;
                        mem_mask_o  <= 4'b0000;
                    end
                    default: begin
                        wreg_data_o <= `ZERO_WORD;
                        mem_mask_o  <= 4'b0000;
                    end
                endcase
                //mem_mask_o  <= 4'b0011;
                //wreg_data_o <= { 16'b0, mem_data_i[15:0] };
            end
            OP_LW  : begin
                mem_re    <= `ENABLE;
                mem_mask_o  <= 4'b1111;
                wreg_data_o <= mem_data_i;
            end
            OP_SB  : begin
                mem_we    <= `ENABLE;
                mem_data_o   <= {{4{mem_oper_data[7:0]}}};
                case (mem_oper_addr[1:0])
                    2'b00 : begin
                        mem_mask_o  <= 4'b0001;
                    end
                    2'b01 : begin
                        mem_mask_o  <= 4'b0010;
                    end
                    2'b10 : begin
                        mem_mask_o  <= 4'b0100;
                    end
                    2'b11 : begin
                        mem_mask_o  <= 4'b1000;
                    end
                    default: begin
                        mem_mask_o  <= 4'b0000;
                    end
                endcase
                //mem_mask_o  <= 4'b0001;
            end
            OP_SH  : begin
                mem_we    <= `ENABLE;
                mem_data_o   <= {{2{mem_oper_data[15:0]}}};
                case (mem_oper_addr[1:0])
                    2'b00 : begin
                        mem_mask_o  <= 4'b0011;
                    end
                    2'b01 : begin//TODO
                        mem_mask_o  <= 4'b0000;
                    end
                    2'b10 : begin
                        mem_mask_o  <= 4'b1100;
                    end
                    2'b11 : begin//TODO
                        mem_mask_o  <= 4'b0000;
                    end
                    default: begin
                        mem_mask_o  <= 4'b0000;
                    end
                endcase
                //mem_mask_o  <= 4'b0011;
            end
            OP_SW  : begin
                mem_we    <= `ENABLE;
                mem_data_o   <= mem_oper_data;
                mem_mask_o  <= 4'b1111;
            end
            default : begin end
        endcase



    end
end



    
endmodule