`timescale 1ns / 1ps


module base_state_rom(
    input [4:0] state,
    output [7:0] base_state
    );

    reg [7:0] base_state_reg;

    always @ (state) begin
        case (state)
            5'b00000 : begin
                base_state_reg = 8'b0000000;
            end
            5'b00001 : begin
                base_state_reg = 8'b0000100;
            end
            5'b00010 : begin
                base_state_reg = 8'b0011000;
            end
            5'b00011 : begin
                base_state_reg = 8'b0010000;
            end
            5'b00100 : begin
                base_state_reg = 8'b0010000;
            end
            5'b00101 : begin
                base_state_reg = 8'b0001000;
            end
            5'b00110 : begin
                base_state_reg = 8'b0010000;
            end
            5'b00111 : begin
                base_state_reg = 8'b0000000;
            end
            5'b01000 : begin
                base_state_reg = 8'b0000000;
            end
            5'b01001 : begin
                base_state_reg = 8'b0000000;
            end
            5'b01010 : begin
                base_state_reg = 8'b0001100;
            end
            5'b01011 : begin
                base_state_reg = 8'b0000100;
            end
            5'b01100 : begin
                base_state_reg = 8'b0000000;
            end
            5'b01101 : begin
                base_state_reg = 8'b0000000;
            end
            5'b01110 : begin
                base_state_reg = 8'b0010000;
            end
            5'b01111 : begin
                base_state_reg = 8'b0000000;
            end
            5'b10000 : begin
                base_state_reg = 8'b0001000;
            end
            5'b10001 : begin
                base_state_reg = 8'b0001000;
            end
            5'b10010 : begin
                base_state_reg = 8'b0010000;
            end
            5'b10011 : begin
                base_state_reg = 8'b0010100;
            end
            5'b10100 : begin
                base_state_reg = 8'b0001100;
            end
            5'b10101 : begin
                base_state_reg = 8'b0000000;
            end
            5'b10110 : begin
                base_state_reg = 8'b0010000;
            end
            5'b10111 : begin
                base_state_reg = 8'b0011000;
            end
            5'b11000 : begin
                base_state_reg = 8'b0001000;
            end
            5'b11001 : begin
                base_state_reg = 8'b0010000;
            end
            5'b11010 : begin
                base_state_reg = 8'b0001000;
            end
            5'b11011 : begin
                base_state_reg = 8'b0001000;
            end
            5'b11100 : begin
                base_state_reg = 8'b0011100;
            end
            5'b11101 : begin
                base_state_reg = 8'b0010100;
            end
            5'b11110 : begin
                base_state_reg = 8'b0010000;
            end
            5'b11111 : begin
                base_state_reg = 8'b0011000;
            end
        endcase
    end

    assign base_state = base_state_reg;

endmodule