`timescale 1ns / 1ps


module new_bits_evaluator(
    input [7:0] state,
    input [7:0] data_valid,
    input [2:0] valid_bits,
    output [15:0] new_bits
    );
    
    assign new_bits = (state & data_valid) << valid_bits;
    
endmodule
