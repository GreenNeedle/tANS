`timescale 1ns / 1ps


module state_evaluator(
    input [7:0] base_state,
    input [7:0] data_in,
    output [R-1:0] next_state
    );
    
    parameter R = 4;
    
    assign next_state = base_state + data_in;
    
endmodule
