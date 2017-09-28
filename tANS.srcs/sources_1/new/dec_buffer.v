`timescale 1ns / 1ps


module dec_buffer(
    input CLK,
    input clr,
    input en,
    input [3:0] initial_offset,
    input [15:0] init_buff,
    input [NB_BITS_WIDTH-1:0] nb_bits,
    input [15:0] new_bits,
    output [7:0] data_out
    );
    
    parameter NB_BITS_WIDTH = 2;
    
    reg [15:0] buff;
    reg [7:0] data_out;
    
    always @ (posedge CLK) begin
        if (clr) begin
            //clr sets data_out to first byte of data.
            //buff is intialized to the first two bytes without first nb_bits bits of data
            //from a stream.
            //buff <= 16'b1101000110100011;
            //buff <= 16'b1110000110101000; //tb1: m=3, L=16
            //buff <= 16'b0011101000000000; //tb2: m=4, L=16
            //buff <= 16'b0001011011100000; //tb3: m=8, L=32
            //data_out <= 8'b11100001; //tb1: m=3, L=16
            //data_out <= 8'b11001110; //tb2: m=4, L=16
            //data_out <= 8'b00010110; //tb3: m=8, L=32
            buff <= init_buff << initial_offset;
            data_out <= 8'b00000000;
        end
        else if (en) begin
            buff <= buff << nb_bits;
            data_out <= buff[15:8];
        end
        else begin
            buff <= (buff << nb_bits) | new_bits;
            data_out <= buff[15:8];
        end
    end
    
endmodule
