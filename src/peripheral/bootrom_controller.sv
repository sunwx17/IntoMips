`include "defines.svh"

module bootrom_controller (
    input Bit_t     clk,
    input Bit_t     rst,

    //总线信号
    input Bit_t     read_op,
    input Word_t    bus_addr,
    output Word_t   bus_data_read,     

    input Bit_t     read_op_ex,
    input Word_t    bus_addr_ex,
    output Word_t   bus_data_read_ex
);

Word_t rom_data_out, rom_data_out_ex;

typedef enum {IDLE, READ} State_t;
State_t cur_state, cur_state_ex;

blk_mem_bootrom rom_instance(
    .clka(clk),
    .addra(bus_addr >> 2),
    .douta(rom_data_out),
    .clkb(clk),
    .addrb(bus_addr_ex >> 2),
    .doutb(rom_data_out_ex)
);

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        cur_state <= IDLE;
    end else begin
        case(cur_state)
            IDLE: begin
                if (read_op) begin
                    cur_state <= READ;
                end
            end
            READ: begin
                bus_data_read <= rom_data_out;
                cur_state <= IDLE;
            end
        endcase
    end
end
        
    
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        cur_state_ex <= IDLE;
    end else begin
        case(cur_state_ex)
            IDLE: begin
                if (read_op_ex) begin
                    cur_state_ex <= READ;
                end
            end
            READ: begin
                bus_data_read_ex <= rom_data_out_ex;
                cur_state_ex <= IDLE;
            end
        endcase
    end
end
    

endmodule


