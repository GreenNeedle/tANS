`timescale 1ns / 1ps


module encoder(
    input CLK,
    input clr,
    input en,
    input [7:0] symbol,
    output [7:0] data_out,
    output byte_done,
    output symbols_done,
    output [2:0] valid_bits,
    output [7:0] state
    );
    
    wire [7:0] data_valid;
    wire [2:0] nb_bits;
    
    preprocessor preprocessor_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .symbol(symbol),
        .state(state),
        .data_valid(data_valid),
        .nb_bits(nb_bits)
    );
    
    bits_processor bits_processor_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .state(state),
        .data_valid(data_valid),
        .nb_bits(nb_bits),
        .data_out(data_out),
        .byte_done(byte_done),
        .symbols_done(symbols_done),
        .valid_bits(valid_bits)
    );
    
endmodule