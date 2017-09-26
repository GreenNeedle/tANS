`timescale 1ns / 1ps


module symbol_rom(
    input [4:0] state,
    output [7:0] symbol
    );

    reg [7:0] symbol_reg;

    always @ (state) begin
        case (state)
            5'b00000 : begin
                symbol_reg = 8'b00110000;
            end
            5'b00001 : begin
                symbol_reg = 8'b00110000;
            end
            5'b00010 : begin
                symbol_reg = 8'b00110010;
            end
            5'b00011 : begin
                symbol_reg = 8'b00110100;
            end
            5'b00100 : begin
                symbol_reg = 8'b00110110;
            end
            5'b00101 : begin
                symbol_reg = 8'b00110000;
            end
            5'b00110 : begin
                symbol_reg = 8'b00110001;
            end
            5'b00111 : begin
                symbol_reg = 8'b00110010;
            end
            5'b01000 : begin
                symbol_reg = 8'b00110101;
            end
            5'b01001 : begin
                symbol_reg = 8'b00110111;
            end
            5'b01010 : begin
                symbol_reg = 8'b00110000;
            end
            5'b01011 : begin
                symbol_reg = 8'b00110010;
            end
            5'b01100 : begin
                symbol_reg = 8'b00110100;
            end
            5'b01101 : begin
                symbol_reg = 8'b00110110;
            end
            5'b01110 : begin
                symbol_reg = 8'b00110000;
            end
            5'b01111 : begin
                symbol_reg = 8'b00110001;
            end
            5'b10000 : begin
                symbol_reg = 8'b00110010;
            end
            5'b10001 : begin
                symbol_reg = 8'b00110101;
            end
            5'b10010 : begin
                symbol_reg = 8'b00110111;
            end
            5'b10011 : begin
                symbol_reg = 8'b00110000;
            end
            5'b10100 : begin
                symbol_reg = 8'b00110010;
            end
            5'b10101 : begin
                symbol_reg = 8'b00110011;
            end
            5'b10110 : begin
                symbol_reg = 8'b00110101;
            end
            5'b10111 : begin
                symbol_reg = 8'b00110000;
            end
            5'b11000 : begin
                symbol_reg = 8'b00110001;
            end
            5'b11001 : begin
                symbol_reg = 8'b00110010;
            end
            5'b11010 : begin
                symbol_reg = 8'b00110100;
            end
            5'b11011 : begin
                symbol_reg = 8'b00110110;
            end
            5'b11100 : begin
                symbol_reg = 8'b00110000;
            end
            5'b11101 : begin
                symbol_reg = 8'b00110010;
            end
            5'b11110 : begin
                symbol_reg = 8'b00110011;
            end
            5'b11111 : begin
                symbol_reg = 8'b00110101;
            end
        endcase
    end

    assign symbol = symbol_reg;

endmodule