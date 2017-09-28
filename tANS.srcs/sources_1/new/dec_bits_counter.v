`timescale 1ns / 1ps


module dec_bits_counter(
    input CLK,
    input clr,
    input en,
    input [3:0] initial_offset,
    input [NB_BITS_WIDTH-1:0] nb_bits,
    output [2:0] free_bits
    );
    
    parameter NB_BITS_WIDTH = 2;
    
    reg [2:0] k;
    
    always @ (posedge CLK) begin
        if (clr) begin
            k[2:0] <= initial_offset;
        end
        else if (en) begin
            k[2:0] <= k[2:0] + nb_bits;
        end
        else begin
            k[2:0] <= k[2:0];
        end
    end
    
    assign free_bits = k[2:0];
    
endmodule
