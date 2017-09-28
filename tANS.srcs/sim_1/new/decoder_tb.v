`timescale 1ns / 1ps


module decoder_tb();

    reg CLK, clr, en, preset;
    reg [7:0] next_byte;
    reg [3:0] init_state;
    reg [15:0] init_buff;
    wire [7:0] symbol;
    wire [3:0] state;
    wire fetch;
    
    initial begin
        CLK <= 1;
        clr <= 1;
        en <= 1;
        preset <= 1;
        next_byte <= 8'b11111111; //not used in testbench
        init_state <= 9;
        init_buff <= 16'b0111000011010100;
        #3
        
        clr <= 0;
        
        @ (posedge CLK)
        preset <= 0;
        
        #100
        
        @ (posedge CLK)
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    decoder #(.OFFSET(1)) decoder_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .preset(preset),
        .next_byte(next_byte),
        .init_state(init_state),
        .init_buff(init_buff),
        .symbol(symbol),
        .state(state),
        .fetch(fetch)
    );

endmodule
