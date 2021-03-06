`timescale 1ns / 1ps


module preprocessor(
    input CLK,
    input clr,
    input en,
    input [7:0] symbol,
    output [R:0] state,
    output [7:0] data_valid,
    output [2:0] nb_bits
    );
    
    parameter R = 4;
    parameter S = 16;
    
    wire [7:0] nb;
    
    nb_rom nb_rom_inst(
        .symbol(symbol),
        .nb(nb)
    );
    
    nb_bits_calculator #(.R(R)) nb_bits_calculator_inst(
        .state(state),
        .nb(nb),
        .nb_bits(nb_bits)
    );
    
    mask_generator mask_generator_inst(
        .nb_bits(nb_bits),
        .data_valid(data_valid)
    );
    
    state_machine #(.R(R), .S(S)) state_machine_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .symbol(symbol),
        .nb_bits(nb_bits),
        .state(state)
    );
    
endmodule