`timescale 1ns / 1ps


module register(
    input CLK,
    input clr,
    input en,
    input [4:0] in,
    output [4:0] out
    );
    
    reg [4:0] temp;
    
    always @ (posedge CLK or posedge clr) begin
        if (clr) begin
            temp <= 5'b10000;
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
