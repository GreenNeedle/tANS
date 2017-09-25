`timescale 1ns / 1ps


module nb_bits_calculator(
    input [R:0] state,
    input [7:0] nb,
    output [2:0] nb_bits
    );
    
    parameter R = 4;
    parameter r = R + 1;
    
    assign nb_bits = (state + nb) >> r;
    
endmodule
