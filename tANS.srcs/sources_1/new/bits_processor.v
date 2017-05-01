`timescale 1ns / 1ps


module bits_processor(
    input CLK,
    input clr,
    input en,
    input [7:0] state,
    input [7:0] data_valid,
    input [2:0] nb_bits,
    output [7:0] data_out,
    output done_byte
    );
    
    wire [2:0] valid_bits;
    wire done;
    wire [15:0] new_bits;
    
    bits_counter bits_counter_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .nb_bits(nb_bits),
        .valid_bits(valid_bits),
        .done(done)
    );
    
    new_bits_evaluator new_bits_evaluator_inst(
        .state(state),
        .data_valid(data_valid),
        .valid_bits(valid_bits),
        .new_bits(new_bits)
    );
    
    buffer buffer_inst(
        .CLK(CLK),
        .clr(clr),
        .en(!done),
        .new_bits(new_bits),
        .data_out(data_out),
        .done_byte(done_byte)
    );
    
endmodule