`timescale 1ns / 1ps


module decoder_tb2();

    reg CLK, clr, en, preset;
    reg [3:0] init_offset, init_state;
    reg [15:0] init_buff;
    reg [7:0] next_byte;
    wire [7:0] symbol;
    wire [3:0] state;
    wire fetch;
    
    initial begin
        CLK <= 1;
        clr <= 1;
        en <= 0;
        preset <= 1;
        init_offset <= 5;
        init_state <= 8;
        init_buff <= 16'b0000011001110100;
        next_byte <= 8'b00000100;
        #3
        
        clr <= 0;
        en <= 1;
        
        @ (posedge CLK)
        preset <= 0;
        
        #90
        en <= 0;
        
        #20
        
        @ (posedge CLK)
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    decoder #(.NB_BITS_WIDTH(3)) decoder_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .preset(preset),
        .initial_offset(init_offset),
        .next_byte(next_byte),
        .init_state(init_state),
        .init_buff(init_buff),
        .symbol(symbol),
        .state(state),
        .fetch(fetch)
    );

endmodule
