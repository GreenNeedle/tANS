`timescale 1ns / 1ps


module fetch_evaluator(
    input [NB_BITS_WIDTH-1:0] nb_bits,
    input [2:0] free_bits,
    output fetch
    );
    
    parameter NB_BITS_WIDTH = 2;
    
    reg out;
    
    always @ (*) begin
        if (nb_bits + free_bits > 7) begin
            out = 1'b1;
        end
        else begin
            out = 1'b0;
        end
    end
    
    assign fetch = out;
    
endmodule
