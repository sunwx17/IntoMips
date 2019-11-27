module tlb_lookup(
    input   TLB_entries_t   entries_i,
    input   Word_t          vaddr,
    input   Byte_t          asid,

    output  Word_t          paddr,
    output  Bit_t           miss, d, v,
    output  Triblebit_t     c,
    output  TLB_index_t     which_o
    
);

TLB_index_t matched_index;
logic [`TLB_ENTRY_NUM - 1:0] matched;

`define TLB_GET_ENTRY_LO1(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 32 +: 32]

`define TLB_GET_ENTRY_LO2(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 64 +: 32]

`define TLB_GET_ENTRY_HI(i) \
    entries_i[i * `TLB_ENTRY_WIDTH +: 32]

`define TLB_GET_ENTRY_I(i) \
    entries_i[i * `TLB_ENTRY_WIDTH +: `TLB_ENTRY_WIDTH]

`define TLB_GET_VPN(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 13 +: 19]
    //entries_i[i * `TLB_ENTRY_WIDTH +: 19]

`define TLB_GET_ASID(i) \
    entries_i[i * `TLB_ENTRY_WIDTH +: 8]
    //entries_i[i * `TLB_ENTRY_WIDTH + 24 +: 8]

`define TLB_GET_G(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 32]
    //entries_i[i * `TLB_ENTRY_WIDTH + 63]

`define TLB_GET_V1(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 33]
    //entries_i[i * `TLB_ENTRY_WIDTH + 62]

`define TLB_GET_V2(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 65]
    //entries_i[i * `TLB_ENTRY_WIDTH + 94]

`define TLB_GET_D1(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 34]
    //entries_i[i * `TLB_ENTRY_WIDTH + 61]

`define TLB_GET_D2(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 66]
    //entries_i[i * `TLB_ENTRY_WIDTH + 93]

`define TLB_GET_C1(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 35 +: 3]
    //entries_i[i * `TLB_ENTRY_WIDTH + 58 +: 3]

`define TLB_GET_C2(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 67 +: 3]
    //entries_i[i * `TLB_ENTRY_WIDTH + 90 +: 3]

`define TLB_GET_PFN1(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 38 +: 20]
    //entries_i[i * `TLB_ENTRY_WIDTH + 32 +: 20]

`define TLB_GET_PFN2(i) \
    entries_i[i * `TLB_ENTRY_WIDTH + 70 +: 20]
    //entries_i[i * `TLB_ENTRY_WIDTH + 64 +: 20]


Word_t match_entry_hi, match_entry_lo1, match_entry_lo2;

assign match_entry_hi = `TLB_GET_ENTRY_HI(matched_index);
assign match_entry_lo1 = `TLB_GET_ENTRY_LO1(matched_index);
assign match_entry_lo2 = `TLB_GET_ENTRY_LO2(matched_index);

assign miss = (matched == 16'b0);
assign which_o = matched_index;
assign paddr[11:0] = vaddr[11:0];

genvar i;
generate for(i = 0; i < `TLB_ENTRY_NUM; i = i + 1) begin: gen_for_tlb_match
        assign matched[i] = (`TLB_GET_VPN(i) == vaddr[31:13]) 
                        && (`TLB_GET_ASID(i) == asid || `TLB_GET_G(i));
    end
endgenerate

always_comb begin
    if(~vaddr[12]) begin 
        d <= `TLB_GET_D1(matched_index);
        v <= `TLB_GET_V1(matched_index);
        c <= `TLB_GET_C1(matched_index);
        paddr[31:12] <= `TLB_GET_PFN1(matched_index);
    end else begin 
        d <= `TLB_GET_D2(matched_index);
        v <= `TLB_GET_V2(matched_index);
        c <= `TLB_GET_C2(matched_index);
        paddr[31:12] <= `TLB_GET_PFN2(matched_index);
    end
end

always_comb begin
    case (matched) 
        16'h0001: matched_index <= 0;
        16'h0002: matched_index <= 1;
        16'h0004: matched_index <= 2;
        16'h0008: matched_index <= 3;
        16'h0010: matched_index <= 4;
        16'h0020: matched_index <= 5;
        16'h0040: matched_index <= 6;
        16'h0080: matched_index <= 7;
        16'h0100: matched_index <= 8;
        16'h0200: matched_index <= 9;
        16'h0400: matched_index <= 10;
        16'h0800: matched_index <= 11;
        16'h1000: matched_index <= 12;
        16'h2000: matched_index <= 13;
        16'h4000: matched_index <= 14;
        16'h8000: matched_index <= 15;
        default: matched_index <= 0;
    endcase
    //matched_index <= 0;
    /*
    if(matched[0]) matched_index <= 0;
    else if(matched[1]) matched_index <= 1;
    else if(matched[2]) matched_index <= 2;
    else if(matched[3]) matched_index <= 3;
    else if(matched[4]) matched_index <= 4;
    else if(matched[5]) matched_index <= 5;
    else if(matched[6]) matched_index <= 6;
    else if(matched[7]) matched_index <= 7;
    else if(matched[8]) matched_index <= 8;
    else if(matched[9]) matched_index <= 9;
    else if(matched[10]) matched_index <= 10;
    else if(matched[11]) matched_index <= 11;
    else if(matched[12]) matched_index <= 12;
    else if(matched[13]) matched_index <= 13;
    else if(matched[14]) matched_index <= 14;
    else if(matched[15]) matched_index <= 15;
    else matched_index <= 0;*/
end



endmodule