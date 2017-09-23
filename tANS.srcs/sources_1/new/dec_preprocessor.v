`timescale 1ns / 1ps


module dec_preprocessor(
    input CLK,
    input clr,
    input en,
    input [2:0] nb_bits,
    input [3:0] state,
    input [7:0] next_byte,
    output [7:0] base_state,
    output [7:0] data,
    output fetch
    );
    
    base_state_evaluator base_state_evaluator_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .state(state),
        .base_state(base_state)
    );
    
    data_processor data_processor_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .nb_bits(nb_bits),
        .next_byte(next_byte),
        .data_out(data),
        .fetch(fetch)
    );
    
endmodule
