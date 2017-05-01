`timescale 1ns / 1ps


module encoding_rom(
    input [3:0] address,
    output [7:0] state
    );
    
    reg [7:0] out;
    
    always @ (address) begin
        case (address)
            4'b0000 : begin
                out = 8'b00010010;
            end
            4'b0001 : begin
                out = 8'b00010110;
            end
            4'b0010 : begin
                out = 8'b00011001;
            end
            4'b0011 : begin
                out = 8'b00010000;
            end
            4'b0100 : begin
                out = 8'b00010001;
            end
            4'b0101: begin
                out = 8'b00010101;
            end
            4'b0110 : begin
                out = 8'b00011000;
            end
            4'b0111 : begin
                out = 8'b00011011;
            end
            4'b1000 : begin
                out = 8'b00011101;
            end
            4'b1001 : begin
                out = 8'b00011110;
            end
            4'b1010 : begin
                out = 8'b00011111;
            end
            4'b1011: begin
                out = 8'b00010011;
            end
            4'b1100 : begin
                out = 8'b00010100;
            end
            4'b1101 : begin
                out = 8'b00010111;
            end
            4'b1110 : begin
                out = 8'b00011010;
            end
            4'b1111 : begin
                out = 8'b00011100;
            end
        endcase
    end
    
    assign state = out;
    
endmodule
