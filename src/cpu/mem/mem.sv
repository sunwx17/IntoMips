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
    output  Mask_t      mem_mask_o 
);

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
        mem_we_o     <= `DISABLE;
        mem_re_o     <= `DISABLE;
        mem_mask_o   <= 4'b0;
    end else begin
        wreg_write_o <= wreg_write_i;
        wreg_addr_o  <= wreg_addr_i;
        wreg_data_o  <= wreg_data_i;

        whilo_o      <= whilo_i;
        hi_o         <= hi_i;
        lo_o         <= lo_i;

        mem_addr_o   <= mem_oper_addr;
        mem_data_o   <= mem_oper_data;

        mem_we_o     <= `DISABLE;
        mem_re_o     <= `DISABLE;
        mem_mask_o   <= 4'b0;

        case (oper_i)
            OP_LB  : begin
                mem_re_o    <= `ENABLE;
                mem_mask_o  <= 4'b0001;
                wreg_data_o <= { {24{mem_data_i[7]}}, mem_data_i[7:0] };
            end
            OP_LBU : begin
                mem_re_o    <= `ENABLE;
                mem_mask_o  <= 4'b0001;
                wreg_data_o <= { 24'b0, mem_data_i[7:0] };
            end
            OP_LH  : begin
                mem_re_o    <= `ENABLE;
                mem_mask_o  <= 4'b0011;
                wreg_data_o <= { {16{mem_data_i[15]}}, mem_data_i[15:0] };
            end
            OP_LHU : begin
                mem_re_o    <= `ENABLE;
                mem_mask_o  <= 4'b0011;
                wreg_data_o <= { 16'b0, mem_data_i[15:0] };
            end
            OP_LW  : begin
                mem_re_o    <= `ENABLE;
                mem_mask_o  <= 4'b1111;
                wreg_data_o <= mem_data_i;
            end
            OP_SB  : begin
                mem_we_o    <= `ENABLE;
                mem_mask_o  <= 4'b0001;
            end
            OP_SH  : begin
                mem_we_o    <= `ENABLE;
                mem_mask_o  <= 4'b0011;
            end
            OP_SW  : begin
                mem_we_o    <= `ENABLE;
                mem_mask_o  <= 4'b1111;
            end
            default : begin end
        endcase



    end
end



    
endmodule