`timescale 1ns / 1ps


module mask_creator(
    input [3:0] nb_bits,
    output [7:0] data_valid
    );
    
    assign data_valid = 8'b11111111 >> (8 - nb_bits);
    
endmodule