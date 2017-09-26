`timescale 1ns / 1ps


module base_state_evaluator(
    input CLK,
    input clr,
    input en,
    input [R-1:0] state,
    output [7:0] base_state
    );
    
    parameter R = 4;
    
    wire [7:0] temp;
    
    base_state_rom rom(
        .state(state),
        .base_state(temp)
    );
    
    //clr sets the value for the first state
    base_state_register #(.B(24)) register(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .in(temp),
        .out(base_state)
    );
    
endmodule
