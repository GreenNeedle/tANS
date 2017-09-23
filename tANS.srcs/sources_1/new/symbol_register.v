`timescale 1ns / 1ps


module symbol_register(
    input CLK,
    input clr,
    input en,
    input [7:0] in,
    output [7:0] out
    );
    
    parameter B = 8'b00000000;
    
    reg [7:0] out;
    
    always @ (posedge CLK) begin
        if (clr) begin
            out <= B;
        end
        else if (en) begin
            out <= in;
        end
        else begin
            out <= out;
        end
    end

endmodule
