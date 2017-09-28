`timescale 1ns / 1ps


module top_encoder(
    input CLK,
    input clr,
    input en,
    input [7:0] symbol,
    output [7:0] data_out,
    output byte_done,
    output symbols_done,
    output [2:0] valid_bits,
    output [7:0] symbols_count,
    output [R:0] last_state
    );
    
    parameter R = 4;
    parameter S = 16;
    parameter MAX = 9; //how many symbols will be processed - 1
    
    wire done;
    
    symbols_counter #(.MAX(MAX)) symbols_counter_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .symbols_count(symbols_count),
        .symbols_done(done)
    );
    
    encoder #(.R(R), .S(S)) encoder_inst(
        .CLK(CLK),
        .clr(clr),
        .en(!done),
        .symbol(symbol),
        .data_out(data_out),
        .byte_done(byte_done),
        .symbols_done(symbols_done),
        .valid_bits(valid_bits),
        .state(last_state)
    );
    
endmodule