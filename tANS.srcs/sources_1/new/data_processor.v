`timescale 1ns / 1ps


module data_processor(
    input CLK,
    input clr,
    input en,
    input [2:0] nb_bits,
    input [7:0] next_byte,
    output [7:0] data_out,
    output fetch
    );
    
    wire [2:0] free_bits;
    wire [15:0] new_bits;
    wire [2:0] nb_bits_del;
    wire [7:0] buff_out;
    
    //clr sets value nb_bits for the first state
    dec_bits_counter #(.N(2)) dec_bits_counter_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .nb_bits(nb_bits),
        .free_bits(free_bits)
    );
    
    fetch_evaluator fetch_evaluator_inst(
        .nb_bits(nb_bits),
        .free_bits(free_bits),
        .fetch(fetch)
    );
    
    dec_new_bits_evaluator dec_new_bits_evaluator_inst(
        .next_byte(next_byte),
        .free_bits(free_bits),
        .nb_bits(nb_bits),
        .new_bits(new_bits)
    );
    
    //clr sets value for the first state
    nb_bits_register #(.N(2)) nb_bits_register_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .in(nb_bits),
        .out(nb_bits_del)
    );
    
    dec_buffer dec_buffer_inst(
        .CLK(CLK),
        .clr(clr),
        .en(!fetch),
        .nb_bits(nb_bits),
        .new_bits(new_bits),
        .data_out(buff_out)
    );
    
    bits_validator bits_validator_inst(
        .data_in(buff_out),
        .nb_bits(nb_bits_del),
        .data_out(data_out)
    );
    
endmodule
