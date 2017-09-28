`timescale 1ns / 1ps


module nb_bits_register(
    input CLK,
    input clr,
    input en,
    input [NB_BITS_WIDTH-1:0] in,
    output [NB_BITS_WIDTH-1:0] out
    );
    
    parameter N = 0;
    parameter NB_BITS_WIDTH = 2;
    
    reg [NB_BITS_WIDTH-1:0] temp;
    
    always @ (posedge CLK or posedge clr) begin
        if (clr) begin
            temp <= N;
        end
        else if (en) begin
            temp <= in;
        end
        else begin
            temp <= temp;
        end
    end
    
    assign out = temp;
    
endmodule
