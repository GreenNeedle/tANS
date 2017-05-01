`timescale 1ns / 1ps


module nb_bits_calculator(
    input [7:0] symbol,
    input [7:0] state,
    output [3:0] nb_bits
    );
    
    parameter r = 5;
    
    reg [7:0] nb;
    
    always @ (symbol or state) begin
        case (symbol)
            8'b00110000 : begin
                nb = 8'b01001000;
            end
            8'b00110001 : begin
                nb = 8'b00010000;
            end
            8'b00110010 : begin
                nb = 8'b00101100;
            end
            default : begin
                nb = 8'b00000000;
            end
        endcase
    end
    
    assign nb_bits = (state + nb) >> r;
    
endmodule