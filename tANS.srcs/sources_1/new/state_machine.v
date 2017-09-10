`timescale 1ns / 1ps


module state_machine(
    input CLK,
    input clr,
    input en,
    input [7:0] symbol,
    input [3:0] nb_bits,
    output [7:0] state
    );
    
    wire [7:0] start;
    wire [7:0] next_state;
    wire [3:0] address;
    
    start_rom start_rom_inst(
        .symbol(symbol),
        .start(start)
    );
    
    address_calculator address_calculator_inst(
        .start(start),
        .state(state),
        .nb_bits(nb_bits),
        .address(address)
    );
    
    encoding_rom encoding_rom_inst(
        .address(address),
        .state(next_state)
    );
    
    register register_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .in(next_state),
        .out(state)
    );
    
endmodule