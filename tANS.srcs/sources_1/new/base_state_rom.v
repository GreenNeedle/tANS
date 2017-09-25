`timescale 1ns / 1ps


module base_state_rom(
    input [3:0] state,
    output [7:0] base_state
    );

    reg [7:0] base_state_reg;

    always @ (state) begin
        case (state)
            4'b0000 : begin
                base_state_reg = 8'b0000100;
            end
            4'b0001 : begin
                base_state_reg = 8'b0000000;
            end
            4'b0010 : begin
                base_state_reg = 8'b0001000;
            end
            4'b0011 : begin
                base_state_reg = 8'b0001100;
            end
            4'b0100 : begin
                base_state_reg = 8'b0001000;
            end
            4'b0101 : begin
                base_state_reg = 8'b0000000;
            end
            4'b0110 : begin
                base_state_reg = 8'b0000000;
            end
            4'b0111 : begin
                base_state_reg = 8'b0001100;
            end
            4'b1000 : begin
                base_state_reg = 8'b0000100;
            end
            4'b1001 : begin
                base_state_reg = 8'b0000010;
            end
            4'b1010 : begin
                base_state_reg = 8'b0000000;
            end
            4'b1011 : begin
                base_state_reg = 8'b0001000;
            end
            4'b1100 : begin
                base_state_reg = 8'b0000100;
            end
            4'b1101 : begin
                base_state_reg = 8'b0000010;
            end
            4'b1110 : begin
                base_state_reg = 8'b0001100;
            end
            4'b1111 : begin
                base_state_reg = 8'b0000110;
            end
        endcase
    end

    assign base_state = base_state_reg;

endmodule