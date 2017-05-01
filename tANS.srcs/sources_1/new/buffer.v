`timescale 1ns / 1ps


module buffer(
    input CLK,
    input clr,
    input en,
    input [15:0] new_bits,
    output [7:0] data_out,
    output done_byte
    );
    
    reg [15:0] buff;
    reg done;
    reg[7:0] data_out;
    
    always @ (posedge CLK) begin
        if (clr) begin
            data_out <= 8'b00000000; 
            buff <= 16'b0000000000000000;
            done <= 1'b0;
        end
        else if (en) begin
            data_out <= data_out;
            buff <= buff | new_bits;
            done <= 1'b0;
        end
        else begin
            data_out <= buff[7:0]; 
            buff <= (buff >> 8) | new_bits;
            done <= 1'b1;
        end
    end
    
    assign done_byte = done;
    
endmodule
