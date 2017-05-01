`timescale 1ns / 1ps


module address_calculator_synchr(
    input CLK,
    input clr,
    input en,
    input [7:0] start,
    input [7:0] state,
    input [3:0] nb_bits,
    output [3:0] address
    );
    
    reg [3:0] addr;
    
    always @ (posedge CLK) begin
        if (clr) begin
            addr <= 4'b0011;
        end
        else if (en) begin
            addr <= start + (state >> nb_bits);
        end
        else begin
            addr <= addr;
        end
    end
    
    assign address = addr;
    
endmodule