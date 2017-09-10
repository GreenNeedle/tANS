`timescale 1ns / 1ps


module encoding_rom(
    input [3:0] address,
    output [7:0] state
    );

    reg [7:0] state_reg;

    always @ (address) begin
        case (address)
            4'b110000 : begin
                state_reg = 8'b00010010;
            end
            4'b110001 : begin
                state_reg = 8'b00010110;
            end
            4'b110010 : begin
                state_reg = 8'b00011001;
            end
            4'b110011 : begin
                state_reg = 8'b00010000;
            end
            4'b110100 : begin
                state_reg = 8'b00010001;
            end
            4'b110101 : begin
                state_reg = 8'b00010101;
            end
            4'b110110 : begin
                state_reg = 8'b00011000;
            end
            4'b110111 : begin
                state_reg = 8'b00011011;
            end
            4'b111000 : begin
                state_reg = 8'b00011101;
            end
            4'b111001 : begin
                state_reg = 8'b00011110;
            end
            4'b111010 : begin
                state_reg = 8'b00011111;
            end
            4'b111011 : begin
                state_reg = 8'b00010011;
            end
            4'b111100 : begin
                state_reg = 8'b00010100;
            end
            4'b111101 : begin
                state_reg = 8'b00010111;
            end
            4'b111110 : begin
                state_reg = 8'b00011010;
            end
            4'b111111 : begin
                state_reg = 8'b00011100;
            end
        endcase
    end

    assign state = state_reg;

endmodule
