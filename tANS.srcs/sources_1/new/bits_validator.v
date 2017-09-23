`timescale 1ns / 1ps


module bits_validator(
    input [7:0] data_in,
    input [2:0] nb_bits,
    output [7:0] data_out
    );
    
    assign data_out = data_in >> (4'b1000 - nb_bits);
    
endmodule
