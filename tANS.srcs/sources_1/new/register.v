`timescale 1ns / 1ps


module register(
    input CLK,
    input clr,
    input en,
    input [R:0] in,
    output [R:0] out
    );
    
    parameter R = 4;
    parameter S = 16;
    
    reg [R:0] temp;
    
    always @ (posedge CLK or posedge clr) begin
        if (clr) begin
            temp <= S;
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
