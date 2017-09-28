`timescale 1ns / 1ps


module dec_state_machine(
    input CLK,
    input clr,
    input en,
    input preset,
    input [7:0] next_byte,
    input [R-1:0] init_state,
    input [15:0] init_buff,
    output [R-1:0] state,
    output fetch
    );
    
    parameter R = 4;
    parameter NB_BITS_WIDTH = 2;
    
    wire [R-1:0] next_state;
    wire [NB_BITS_WIDTH-1:0] nb_bits;
    wire [7:0] base_state;
    wire [7:0] data;
    
    mux #(.R(R)) mux_inst(
        .select(preset),
        .init_state(init_state),
        .next_state(next_state),
        .state(state)
    );
    
    nb_bits_rom nb_bits_rom_inst(
        .state(state),
        .nb_bits(nb_bits)
    );
    
    dec_preprocessor #(.R(R), .NB_BITS_WIDTH(NB_BITS_WIDTH)) 
    dec_preprocessor_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .preset(preset),
        .init_buff(init_buff),
        .nb_bits(nb_bits),
        .state(state),
        .next_byte(next_byte),
        .base_state(base_state),
        .data(data),
        .fetch(fetch)
    );
    
    state_evaluator #(.R(R)) state_evaluator_inst(
        .base_state(base_state),
        .data_in(data),
        .next_state(next_state)
    );
    
endmodule
