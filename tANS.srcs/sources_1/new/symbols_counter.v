`timescale 1ns / 1ps


module symbols_counter(
    input CLK,
    input clr,
    input en,
    output [7:0] symbols_count,
    output symbols_done
    );
    
    parameter MAX = 8;
    
    reg [7:0] count;
    reg done;
    
    always @ (posedge CLK) begin
        if (clr) begin
            count <= 8'b00000000;
            done <= 1'b0;
        end
        else if (en) begin
            if (count != MAX) begin
                count <= count + 1;
                done <= 1'b0;
            end
            else begin
                count <= 8'b00000000;
                done <= 1'b1;
            end
        end
    end
    
    assign symbols_done = done;
    assign symbols_count = count;
    
endmodule