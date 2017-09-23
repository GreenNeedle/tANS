`timescale 1ns / 1ps


module dec_state_machine(
    input CLK,
    input clr,
    input en,
    input [7:0] next_byte,
    output [3:0] state,
    output fetch
    );
    
    wire [2:0] nb_bits;
    wire [7:0] base_state;
    wire [7:0] data;
    
    nb_bits_rom nb_bits_rom_inst(
        .state(state),
        .nb_bits(nb_bits)
    );
    
    dec_preprocessor dec_preprocessor_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .nb_bits(nb_bits),
        .state(state),
        .next_byte(next_byte),
        .base_state(base_state),
        .data(data),
        .fetch(fetch)
    );
    
    state_evaluator state_evaluator_inst(
        .base_state(base_state),
        .data_in(data),
        .next_state(state)
    );
    
endmodule
