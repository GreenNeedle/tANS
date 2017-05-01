`timescale 1ns / 1ps


module bits_counter(
    input CLK,
    input clr,
    input en,
    input [2:0] nb_bits,
    output [2:0] valid_bits,
    output done
    );
    
    reg [2:0] k;
    reg carry;
    
    always @ (posedge CLK) begin
        if (clr) begin
            {carry, k[2:0]} <= 4'b0000;
        end
        else if (en) begin
            {carry, k[2:0]} <= k[2:0] + nb_bits;
        end
        else begin
            k[2:0] <= k[2:0];
            carry <= 1'b0;
        end
    end

    assign valid_bits = k;
    assign done = carry;
    
endmodule
