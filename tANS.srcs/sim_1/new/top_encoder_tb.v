`timescale 1ns / 1ps


module top_encoder_tb();

    reg CLK, clr, en;
    reg [7:0] symbol;
    wire [7:0] data_out;
    wire byte_done, symbols_done;
    wire [2:0] valid_bits;
    wire [7:0] symbols_count;
    wire [7:0] last_state;
    
    initial begin
        CLK = 1;
        clr = 1;
        en = 1;
        symbol = 8'b00110010;
        
        #3 clr = 0;
        #7
        
        symbol = 8'b00110001;
        #10
        
        symbol = 8'b00110010;
        #10
        
        symbol = 8'b00110001;
        #20
        
        symbol = 8'b00110000;
        #10
        
        symbol = 8'b00110010;
        #10
        
        symbol = 8'b00110001;
        #10
        
        symbol = 8'b00110010;
        #10
        
        symbol = 8'b00110000;
        #10
        
        #10 en = 0;
        
        #30
    
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    top_encoder top_encoder_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .symbol(symbol),
        .data_out(data_out),
        .byte_done(byte_done),
        .symbols_done(symbols_done),
        .valid_bits(valid_bits),
        .symbols_count(symbols_count),
        .last_state(last_state)
    );

endmodule
