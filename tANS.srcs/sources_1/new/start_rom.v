`timescale 1ns / 1ps


module start_rom(
    input [7:0] symbol,
    output [7:0] start
    );

    reg [7:0] start_reg;

    always @ (symbol) begin
        case (symbol)
            8'b00110000 : begin
                start_reg = 8'b11111011;
            end
            8'b00110001 : begin
                start_reg = 8'b00000001;
            end
            8'b00110010 : begin
                start_reg = 8'b00001000;
            end
            8'b00110011 : begin
                start_reg = 8'b00000100;
            end
            default : begin
                start_reg = 8'b00000000;
            end
        endcase
    end

    assign start = start_reg;

endmodule