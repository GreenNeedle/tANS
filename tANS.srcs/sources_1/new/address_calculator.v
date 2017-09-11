`timescale 1ns / 1ps


module address_calculator(
    input [7:0] start,
    input [7:0] state,
    input [2:0] nb_bits,
    output [3:0] address
    );
    
    assign address = start + (state >> nb_bits);
    
endmodule
