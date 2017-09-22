`timescale 1ns / 1ps


module encoding_rom(
    input [3:0] address,
    output [4:0] state
    );

    reg [4:0] state_reg;

    always @ (address) begin
        case (address)
            4'b0000 : begin
                state_reg = 5'b10010;
            end
            4'b0001 : begin
                state_reg = 5'b10110;
            end
            4'b0010 : begin
                state_reg = 5'b11001;
            end
            4'b0011 : begin
                state_reg = 5'b10000;
            end
            4'b0100 : begin
                state_reg = 5'b10001;
            end
            4'b0101 : begin
                state_reg = 5'b10101;
            end
            4'b0110 : begin
                state_reg = 5'b11000;
            end
            4'b0111 : begin
                state_reg = 5'b11011;
            end
            4'b1000 : begin
                state_reg = 5'b11101;
            end
            4'b1001 : begin
                state_reg = 5'b11110;
            end
            4'b1010 : begin
                state_reg = 5'b11111;
            end
            4'b1011 : begin
                state_reg = 5'b10011;
            end
            4'b1100 : begin
                state_reg = 5'b10100;
            end
            4'b1101 : begin
                state_reg = 5'b10111;
            end
            4'b1110 : begin
                state_reg = 5'b11010;
            end
            4'b1111 : begin
                state_reg = 5'b11100;
            end
        endcase
    end

    assign state = state_reg;

endmodule
