`timescale 1ns / 1ps


module dec_new_bits_evaluator(
    input [7:0] next_byte,
    input [2:0] free_bits,
    input [NB_BITS_WIDTH-1:0] nb_bits,
    output [15:0] new_bits
    );
    
    parameter NB_BITS_WIDTH = 2;
    
    //free_bits are always between 0 and 7
    assign new_bits = next_byte << (free_bits + nb_bits);
        
endmodule
