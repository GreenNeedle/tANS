`timescale 1ns / 1ps


module preprocessor(
    input CLK,
    input clr,
    input en,
    input [7:0] symbol,
    output [7:0] state,
    output [7:0] data_valid,
    output [3:0] nb_bits
    );
    
    nb_bits_calculator nb_bits_calculator_inst(
        .symbol(symbol),
        .state(state),
        .nb_bits(nb_bits)
    );
    
    mask_creator mask_creator_inst(
        .nb_bits(nb_bits),
        .data_valid(data_valid)
    );
    
    state_machine state_machine_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .symbol(symbol),
        .nb_bits(nb_bits),
        .state(state)
    );
    
endmodule
