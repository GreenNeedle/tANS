`timescale 1ns / 1ps


module mux(
    input select,
    input [R-1:0] next_state,
    input [R-1:0] init_state,
    output [R-1:0] state
    );
    
    parameter R = 4;
    
    reg [R-1:0] state;
    
    always @ (*) begin
        if (select) begin
            state <= init_state;
        end
        else begin
            state <= next_state;
        end
    end
    
endmodule
