`timescale 1ns / 1ps


module dec_bits_counter(
    input CLK,
    input clr,
    input en,
    input [2:0] nb_bits,
    output [2:0] free_bits
    );
    
    parameter L = 3'b000;
    
    reg [2:0] k;
    
    always @ (posedge CLK) begin
        if (clr) begin
            k[2:0] <= L;
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
