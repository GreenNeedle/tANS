`timescale 1ns / 1ps


module decoder(
    input CLK,
    input clr,
    input en,
    input preset,
    input [7:0] next_byte,
    input [R-1:0] init_state,
    input [15:0] init_buff,
    output [7:0] symbol,
    output [R-1:0] state,
    output fetch
    );
    
    parameter R = 4;
    
    dec_state_machine #(.R(R)) dec_state_machine_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .preset(preset),
        .next_byte(next_byte),
        .init_state(init_state),
        .init_buff(init_buff),
        .state(state),
        .fetch(fetch)
    );
    
    symbol_evaluator #(.R(R)) symbol_evaluator_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .state(state),
        .symbol(symbol)
    );
    
endmodule
