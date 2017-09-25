`timescale 1ns / 1ps


module nb_rom(
    input [7:0] symbol,
    output [7:0] nb
    );

    reg [7:0] nb_reg;

    always @ (symbol) begin
        case (symbol)
            8'b00110000 : begin
                nb_reg = 8'b00101100;
            end
            8'b00110001 : begin
                nb_reg = 8'b00110000;
            end
            8'b00110010 : begin
                nb_reg = 8'b01110000;
            end
            8'b00110011 : begin
                nb_reg = 8'b00101000;
            end
            default : begin
                nb_reg = 8'b00000000;
            end
        endcase
    end

    assign nb = nb_reg;

endmodule