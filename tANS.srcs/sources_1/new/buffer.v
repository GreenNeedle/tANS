`timescale 1ns / 1ps


module buffer(
    input CLK,
    input clr,
    input en,
    input finish,
    input [15:0] new_bits,
    output [7:0] data_out,
    output byte_done,
    output symbols_done
    );
    
    reg [15:0] buff;
    reg done, symbols;
    reg [7:0] data_out;
    
    always @ (posedge CLK) begin
        if (clr) begin
            data_out <= 8'b00000000; 
            buff <= 16'b0000000000000000;
            done <= 1'b0;
            symbols <= 1'b0;
        end
        else if (finish) begin
            data_out <= buff[7:0];
            buff <= buff;
            done <= 1'b0;
            symbols <= 1'b1;
        end
        else if (en) begin
            data_out <= data_out;
            buff <= buff | new_bits;
            done <= 1'b0;
            symbols <= 1'b0;
        end
        else begin
            data_out <= buff[7:0]; 
            buff <= (buff >> 8) | new_bits;
            done <= 1'b1;
            symbols <= 1'b0;
        end
    end
    
    assign byte_done = done;
    assign symbols_done = symbols;
    
endmodule
