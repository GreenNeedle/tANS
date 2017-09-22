`timescale 1ns / 1ps


module nb_bits_calculator(
    input [4:0] state,
    input [7:0] nb,
    output [2:0] nb_bits
    );
    
    parameter r = 5;
    
    assign nb_bits = (state + nb) >> r;
    
endmodule
