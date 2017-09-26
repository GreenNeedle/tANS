`timescale 1ns / 1ps


module nb_bits_rom(
    input [4:0] state,
    output [2:0] nb_bits
    );

    reg [2:0] nb_bits_reg;

    always @ (state) begin
        case (state)
            5'b00000 : begin
                nb_bits_reg = 3'b010;
            end
            5'b00001 : begin
                nb_bits_reg = 3'b010;
            end
            5'b00010 : begin
                nb_bits_reg = 3'b011;
            end
            5'b00011 : begin
                nb_bits_reg = 3'b100;
            end
            5'b00100 : begin
                nb_bits_reg = 3'b100;
            end
            5'b00101 : begin
                nb_bits_reg = 3'b010;
            end
            5'b00110 : begin
                nb_bits_reg = 3'b100;
            end
            5'b00111 : begin
                nb_bits_reg = 3'b010;
            end
            5'b01000 : begin
                nb_bits_reg = 3'b011;
            end
            5'b01001 : begin
                nb_bits_reg = 3'b100;
            end
            5'b01010 : begin
                nb_bits_reg = 3'b010;
            end
            5'b01011 : begin
                nb_bits_reg = 3'b010;
            end
            5'b01100 : begin
                nb_bits_reg = 3'b011;
            end
            5'b01101 : begin
                nb_bits_reg = 3'b011;
            end
            5'b01110 : begin
                nb_bits_reg = 3'b010;
            end
            5'b01111 : begin
                nb_bits_reg = 3'b011;
            end
            5'b10000 : begin
                nb_bits_reg = 3'b010;
            end
            5'b10001 : begin
                nb_bits_reg = 3'b011;
            end
            5'b10010 : begin
                nb_bits_reg = 3'b100;
            end
            5'b10011 : begin
                nb_bits_reg = 3'b010;
            end
            5'b10100 : begin
                nb_bits_reg = 3'b010;
            end
            5'b10101 : begin
                nb_bits_reg = 3'b100;
            end
            5'b10110 : begin
                nb_bits_reg = 3'b011;
            end
            5'b10111 : begin
                nb_bits_reg = 3'b010;
            end
            5'b11000 : begin
                nb_bits_reg = 3'b011;
            end
            5'b11001 : begin
                nb_bits_reg = 3'b010;
            end
            5'b11010 : begin
                nb_bits_reg = 3'b011;
            end
            5'b11011 : begin
                nb_bits_reg = 3'b011;
            end
            5'b11100 : begin
                nb_bits_reg = 3'b010;
            end
            5'b11101 : begin
                nb_bits_reg = 3'b010;
            end
            5'b11110 : begin
                nb_bits_reg = 3'b100;
            end
            5'b11111 : begin
                nb_bits_reg = 3'b011;
            end
        endcase
    end

    assign nb_bits = nb_bits_reg;

endmodule