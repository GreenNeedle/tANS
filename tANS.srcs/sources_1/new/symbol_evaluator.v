`timescale 1ns / 1ps


module symbol_evaluator(
    input CLK,
    input clr,
    input en,
    input [R-1:0] state,
    output [7:0] symbol
    );
    
    parameter R = 4;
    
    wire [7:0] temp;
    
    symbol_rom rom(
        .state(state),
        .symbol(temp)
    );
    
    //clr -> B
    symbol_register #(.B(8'b00111000)) register(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .in(temp),
        .out(symbol)
    );
    
endmodule
