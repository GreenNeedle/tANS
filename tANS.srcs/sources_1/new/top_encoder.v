`timescale 1ns / 1ps


module top_encoder(
    input CLK,
    input clr,
    input en,
    input [7:0] symbol,
    output [7:0] data_out,
    output byte_done,
    output symbols_done,
    output [7:0] symbols_count,
    output [7:0] last_state
    );
    
    symbols_counter #(.MAX(9)) symbols_counter_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .symbols_count(symbols_count),
        .symbols_done(symbols_done)
    );
    
    encoder encoder_inst(
        .CLK(CLK),
        .clr(clr),
        .en(!symbols_done),
        .symbol(symbol),
        .data_out(data_out),
        .done_byte(byte_done),
        .state(last_state)
    );
    
endmodule
