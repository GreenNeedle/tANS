`timescale 1ns / 1ps


module nb_bits_register(
    input CLK,
    input clr,
    input en,
    input [2:0] in,
    output [2:0] out
    );
    
    parameter N = 3'b000;
    
    reg [2:0] temp;
    
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
