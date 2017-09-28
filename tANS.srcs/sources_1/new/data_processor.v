`timescale 1ns / 1ps


module data_processor(
    input CLK,
    input clr,
    input en,
    input [NB_BITS_WIDTH-1:0] nb_bits,
    input [7:0] next_byte,
    output [7:0] data_out,
    output fetch
    );
    
    parameter NB_BITS_WIDTH = 2;
    
    wire [2:0] free_bits;
    wire [15:0] new_bits;
    wire [NB_BITS_WIDTH-1:0] nb_bits_del;
    wire [7:0] buff_out;
    
    //clr -> OFFSET
    dec_bits_counter #(.OFFSET(0), .NB_BITS_WIDTH(NB_BITS_WIDTH)) 
    dec_bits_counter_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .nb_bits(nb_bits),
        .free_bits(free_bits)
    );
    
    fetch_evaluator #(.NB_BITS_WIDTH(NB_BITS_WIDTH)) fetch_evaluator_inst(
        .nb_bits(nb_bits),
        .free_bits(free_bits),
        .fetch(fetch)
    );
    
    dec_new_bits_evaluator #(.NB_BITS_WIDTH(NB_BITS_WIDTH)) 
    dec_new_bits_evaluator_inst(
        .next_byte(next_byte),
        .free_bits(free_bits),
        .nb_bits(nb_bits),
        .new_bits(new_bits)
    );
    
    //clr -> N
    nb_bits_register #(.N(0), .NB_BITS_WIDTH(NB_BITS_WIDTH)) 
    nb_bits_register_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .in(nb_bits),
        .out(nb_bits_del)
    );
    
    dec_buffer #(.NB_BITS_WIDTH(NB_BITS_WIDTH)) dec_buffer_inst(
        .CLK(CLK),
        .clr(clr),
        .en(!fetch),
        .nb_bits(nb_bits),
        .new_bits(new_bits),
        .data_out(buff_out)
    );
    
    bits_validator #(.NB_BITS_WIDTH(NB_BITS_WIDTH)) bits_validator_inst(
        .data_in(buff_out),
        .nb_bits(nb_bits_del),
        .data_out(data_out)
    );
    
endmodule
