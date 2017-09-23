`timescale 1ns / 1ps


module decoder(
    input CLK,
    input clr,
    input en,
    input [7:0] next_byte,
    output [7:0] symbol,
    output [3:0] state,
    output fetch
    );
    
    dec_state_machine dec_state_machine_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .next_byte(next_byte),
        .state(state),
        .fetch(fetch)
    );
    
    symbol_evaluator symbol_evaluator_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .state(state),
        .symbol(symbol)
    );
    
endmodule
