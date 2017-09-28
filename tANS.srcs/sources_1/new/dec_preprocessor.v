`timescale 1ns / 1ps


module dec_preprocessor(
    input CLK,
    input clr,
    input en,
    input [3:0] initial_offset,
    input [15:0] init_buff,
    input [NB_BITS_WIDTH-1:0] nb_bits,
    input [R-1:0] state,
    input [7:0] next_byte,
    output [7:0] base_state,
    output [7:0] data,
    output fetch
    );
    
    parameter R = 4;
    parameter NB_BITS_WIDTH = 2;
    
    base_state_evaluator #(.R(R)) base_state_evaluator_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .state(state),
        .base_state(base_state)
    );
    
    data_processor #(.NB_BITS_WIDTH(NB_BITS_WIDTH)) 
    data_processor_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .initial_offset(initial_offset),
        .init_buff(init_buff),
        .nb_bits(nb_bits),
        .next_byte(next_byte),
        .data_out(data),
        .fetch(fetch)
    );
    
endmodule
