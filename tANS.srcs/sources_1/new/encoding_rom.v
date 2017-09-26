`timescale 1ns / 1ps


module encoding_rom(
    input [4:0] address,
    output [5:0] state
    );

    reg [5:0] state_reg;

    always @ (address) begin
        case (address)
            5'b00000 : begin
                state_reg = 6'b100000;
            end
            5'b00001 : begin
                state_reg = 6'b100001;
            end
            5'b00010 : begin
                state_reg = 6'b100101;
            end
            5'b00011 : begin
                state_reg = 6'b101010;
            end
            5'b00100 : begin
                state_reg = 6'b101110;
            end
            5'b00101 : begin
                state_reg = 6'b110011;
            end
            5'b00110 : begin
                state_reg = 6'b110111;
            end
            5'b00111 : begin
                state_reg = 6'b111100;
            end
            5'b01000 : begin
                state_reg = 6'b100110;
            end
            5'b01001 : begin
                state_reg = 6'b101111;
            end
            5'b01010 : begin
                state_reg = 6'b111000;
            end
            5'b01011 : begin
                state_reg = 6'b100010;
            end
            5'b01100 : begin
                state_reg = 6'b100111;
            end
            5'b01101 : begin
                state_reg = 6'b101011;
            end
            5'b01110 : begin
                state_reg = 6'b110000;
            end
            5'b01111 : begin
                state_reg = 6'b110100;
            end
            5'b10000 : begin
                state_reg = 6'b111001;
            end
            5'b10001 : begin
                state_reg = 6'b111101;
            end
            5'b10010 : begin
                state_reg = 6'b110101;
            end
            5'b10011 : begin
                state_reg = 6'b111110;
            end
            5'b10100 : begin
                state_reg = 6'b100011;
            end
            5'b10101 : begin
                state_reg = 6'b101100;
            end
            5'b10110 : begin
                state_reg = 6'b111010;
            end
            5'b10111 : begin
                state_reg = 6'b101000;
            end
            5'b11000 : begin
                state_reg = 6'b110001;
            end
            5'b11001 : begin
                state_reg = 6'b110110;
            end
            5'b11010 : begin
                state_reg = 6'b111111;
            end
            5'b11011 : begin
                state_reg = 6'b100100;
            end
            5'b11100 : begin
                state_reg = 6'b101101;
            end
            5'b11101 : begin
                state_reg = 6'b111011;
            end
            5'b11110 : begin
                state_reg = 6'b101001;
            end
            5'b11111 : begin
                state_reg = 6'b110010;
            end
        endcase
    end

    assign state = state_reg;

endmodule