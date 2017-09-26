`timescale 1ns / 1ps


module start_rom(
    input [7:0] symbol,
    output [7:0] start
    );

    reg [7:0] start_reg;

    always @ (symbol) begin
        case (symbol)
            8'b00110000 : begin
                start_reg = 8'b11111000;
            end
            8'b00110001 : begin
                start_reg = 8'b00000101;
            end
            8'b00110010 : begin
                start_reg = 8'b00000100;
            end
            8'b00110011 : begin
                start_reg = 8'b00010000;
            end
            8'b00110100 : begin
                start_reg = 8'b00010001;
            end
            8'b00110101 : begin
                start_reg = 8'b00010011;
            end
            8'b00110110 : begin
                start_reg = 8'b00011000;
            end
            8'b00110111 : begin
                start_reg = 8'b00011100;
            end
            default : begin
                start_reg = 8'b00000000;
            end
        endcase
    end

    assign start = start_reg;

endmodule