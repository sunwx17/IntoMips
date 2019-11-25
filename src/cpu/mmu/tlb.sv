`include "cpu_defines.svh"

module tlb(
    input               clk,rst,
    input   Byte_t      asid,
    input   Inst_addr_t inst_vaddr,
    input   Word_t      data_vaddr,

    output  Inst_addr_t inst_paddr,
    output  Bit_t       miss1, d1, v1,
    output  Triblebit_t c1,

    output  Word_t      data_paddr,
    output  Bit_t       miss2, d2, v2,
    output  Triblebit_t c2,

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

TLB_entries_t entries;

typedef logic[0:95] En;

En[0:15] entries_debug;

`define TLB_GET_ENTRY_LO1(i) \
    entries[i * `TLB_ENTRY_WIDTH + 32 +: 32]

`define TLB_GET_ENTRY_LO2(i) \
    entries[i * `TLB_ENTRY_WIDTH + 64 +: 32]

`define TLB_GET_ENTRY_HI(i) \
    entries[i * `TLB_ENTRY_WIDTH +: 32]

`define TLB_GET_ENTRY_I(i) \
    entries[i * `TLB_ENTRY_WIDTH +: `TLB_ENTRY_WIDTH]

assign entry_hi_o = `TLB_GET_ENTRY_HI(tlb_rw_index);
assign entry_lo1_o = `TLB_GET_ENTRY_LO1(tlb_rw_index);
assign entry_lo2_o = `TLB_GET_ENTRY_LO2(tlb_rw_index);

genvar i;
generate
    for (i = 0; i < `TLB_ENTRY_NUM; i++) begin: gen_for_tlb
        assign entries_debug[i] = `TLB_GET_ENTRY_I(i);
        always @ (posedge clk)  begin
            if(rst) begin 
                `TLB_GET_ENTRY_I(i) <= 96'b0;
            end else begin 
                if(tlb_rw_we && i == tlb_rw_index) begin 
                    `TLB_GET_ENTRY_LO1(i) <= entry_lo1_i;
                    `TLB_GET_ENTRY_LO2(i) <= entry_lo2_i;
                    `TLB_GET_ENTRY_HI(i) <= entry_hi_i;
                end
            end
        end
    end
endgenerate

TLB_index_t /*inst_temp_which, data_temp_which,  */tlbp_which;
//Word_t tlbp_paddr;
Bit_t tlbp_miss;//, tlbp_d, tlbp_v;
//Triblebit_t tlbp_c;

tlb_lookup inst_lookup(
    .entries_i(entries),
    .vaddr(inst_vaddr),
    .asid,
    
    .paddr(inst_paddr),
    .miss(miss1),
    .d(d1),
    .v(v1),
    .c(c1)
    //.which_o(inst_temp_which)
);

tlb_lookup data_lookup(
    .entries_i(entries),
    .vaddr(data_vaddr),
    .asid,

    .paddr(data_paddr),
    .miss(miss2),
    .d(d2),
    .v(v2),
    .c(c2)
    //.which_o(data_temp_which)
);

tlb_lookup tlbp_lookup(
    .entries_i(entries),
    .vaddr(entry_hi_i),
    .asid(entry_hi_i[7:0]),

    //.paddr(tlbp_paddr),
    .miss(tlbp_miss),
    //.d(tlbp_d),
    //.v(tlbp_v),
    //.c(tlbp_c),
    .which_o(tlbp_which)

);

assign tlb_p_index = {tlbp_miss, {(32 - `TLB_ENTRY_NUM_LOG2 - 1){1'b0}}, tlbp_which};

endmodule