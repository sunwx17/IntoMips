`include "cpu_defines.svh"

module mmu(
    input       clk, rst,
    input   Byte_t  asid,
    input   Bit_t   is_user,
    input   Inst_addr_t inst_vaddr,
    input   Word_t  data_vaddr,

    output  Inst_addr_t inst_paddr,
    // miss, dirty, valid, illegal
    output  Bit_t   miss1, d1, v1, illegal1,
    // cache_mode
    output  Triblebit_t c1,

    output  Word_t  data_paddr,
    output Bit_t    miss2, d2, v2, illegal2,
    output Triblebit_t c2,

    input TLB_index_t   tlb_rw_index,
    input Bit_t         tlb_rw_we,

    // for tlbwi/tlbwr
    input   Word_t      entry_hi_i,
    input   Word_t      entry_lo1_i,
    input   Word_t      entry_lo2_i,

    // for  tlbr
    output  Word_t      entry_hi_o,
    output  Word_t      entry_lo1_o,
    output  Word_t      entry_lo2_o,

    //  for tlbp
    output  Word_t      tlb_p_index

);

generate if(`USE_MMU) begin:    generate_mmu

    Bit_t temp_miss1, temp_v1, temp_d1, temp_d2, temp_miss2, temp_v2, is_peripheral;
    Word_t temp_inst_paddr, temp_data_paddr;

    function Bit_t is_addr_mapped(
        input Word_t    addr
    );
        return (addr[31:30] != 2'b10);
    endfunction

    Bit_t   is_inst_mapped, is_data_mapped;
    assign is_inst_mapped = is_addr_mapped(inst_vaddr);
    assign is_data_mapped = is_addr_mapped(data_vaddr);

    assign d1 = 0;
    assign miss1 = is_inst_mapped & temp_miss1;
    assign illegal1 = is_user & inst_vaddr[31];
    assign v1 = ~is_inst_mapped | temp_v1;
    assign inst_paddr = is_inst_mapped ? { 1'b1, temp_inst_paddr[30:0] } : inst_vaddr;// {3'b0, inst_vaddr[28:0]};
    
    assign is_peripheral = (data_vaddr[31:24] >= 8'ha2 && data_vaddr[31:24] <= 8'ha7);
    assign d2 = ~is_data_mapped | temp_d2;
    assign miss2 = is_data_mapped & temp_miss2;
    assign illegal2 = (is_user & data_vaddr[31]) & ~is_peripheral;
    assign v2 = ~is_data_mapped | temp_v2;
    assign data_paddr = is_data_mapped ? { 1'b1, temp_data_paddr[30:0] } : data_vaddr;// {3'b0, data_vaddr[28:0]};

    tlb tlb_instance(
        .clk,
        .rst,
        .asid,
        .inst_vaddr,
        .data_vaddr,

        .inst_paddr(temp_inst_paddr),
        .miss1(temp_miss1),
        .d1(temp_d1),
        .v1(temp_v1),
        .c1,

        .data_paddr(temp_data_paddr),
        .miss2(temp_miss2),
        .d2(temp_d2),
        .v2(temp_v2),
        .c2,

        .tlb_rw_index,
        .tlb_rw_we,

        .entry_hi_i,
        .entry_lo1_i,
        .entry_lo2_i,

        .entry_hi_o,
        .entry_lo1_o,
        .entry_lo2_o,

        .tlb_p_index
    );

end else begin: generate_non_mmu
    always_comb begin
        inst_paddr <= inst_vaddr;
        miss1 <= 0;
        d1 <= 0;
        v1 <= 0;
        c1 <= 0;
        data_paddr <= data_vaddr;
        miss2 <= 0;
        d2 <= 1;
        v2 <= 0;
        c2 <= 0;
    end
end
    
endgenerate

endmodule