`timescale 1ns / 1ps


module symbol_rom(
    input [3:0] state,
    output [7:0] symbol
    );

    reg [7:0] symbol_reg;

    always @ (state) begin
        case (state)
            4'b0000 : begin
                symbol_reg = 8'b00110000;
            end
            4'b0001 : begin
                symbol_reg = 8'b00110001;
            end
            4'b0010 : begin
                symbol_reg = 8'b00110011;
            end
            4'b0011 : begin
                symbol_reg = 8'b00110011;
            end
            4'b0100 : begin
                symbol_reg = 8'b00110000;
            end
            4'b0101 : begin
                symbol_reg = 8'b00110010;
            end
            4'b0110 : begin
                symbol_reg = 8'b00110011;
            end
            4'b0111 : begin
                symbol_reg = 8'b00110000;
            end
            4'b1000 : begin
                symbol_reg = 8'b00110001;
            end
            4'b1001 : begin
                symbol_reg = 8'b00110011;
            end
            4'b1010 : begin
                symbol_reg = 8'b00110000;
            end
            4'b1011 : begin
                symbol_reg = 8'b00110001;
            end
            4'b1100 : begin
                symbol_reg = 8'b00110011;
            end
            4'b1101 : begin
                symbol_reg = 8'b00110000;
            end
            4'b1110 : begin
                symbol_reg = 8'b00110001;
            end
            4'b1111 : begin
                symbol_reg = 8'b00110011;
            end
        endcase
    end

    assign symbol = symbol_reg;

endmodule