`timescale 1ns / 1ps


module nb_bits_rom(
    input [3:0] state,
    output [2:0] nb_bits
    );

    reg [2:0] nb_bits_reg;

    always @ (state) begin
        case (state)
            4'b0000 : begin
                nb_bits_reg = 3'b010;
            end
            4'b0001 : begin
                nb_bits_reg = 3'b010;
            end
            4'b0010 : begin
                nb_bits_reg = 3'b010;
            end
            4'b0011 : begin
                nb_bits_reg = 3'b010;
            end
            4'b0100 : begin
                nb_bits_reg = 3'b010;
            end
            4'b0101 : begin
                nb_bits_reg = 3'b100;
            end
            4'b0110 : begin
                nb_bits_reg = 3'b001;
            end
            4'b0111 : begin
                nb_bits_reg = 3'b010;
            end
            4'b1000 : begin
                nb_bits_reg = 3'b010;
            end
            4'b1001 : begin
                nb_bits_reg = 3'b001;
            end
            4'b1010 : begin
                nb_bits_reg = 3'b001;
            end
            4'b1011 : begin
                nb_bits_reg = 3'b010;
            end
            4'b1100 : begin
                nb_bits_reg = 3'b001;
            end
            4'b1101 : begin
                nb_bits_reg = 3'b001;
            end
            4'b1110 : begin
                nb_bits_reg = 3'b010;
            end
            4'b1111 : begin
                nb_bits_reg = 3'b001;
            end
        endcase
    end

    assign nb_bits = nb_bits_reg;

endmodule