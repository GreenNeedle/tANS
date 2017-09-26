`timescale 1ns / 1ps


module decoder_tb3();

    reg CLK, clr, en;
    reg [7:0] next_byte;
    wire [7:0] symbol;
    wire [4:0] state;
    wire fetch;
    
    initial begin
        CLK <= 1;
        clr <= 1;
        en <= 1;
        next_byte <= 8'b10101101;
        #3
        
        clr <= 0;
        #30
        
        @ (posedge CLK)
        next_byte <= 8'b01001000;
        #30

        @ (posedge CLK)
        next_byte <= 8'b01001111;
        #20
        
        @ (posedge CLK)
        next_byte <= 8'b11110000;
        #70
        
        @ (posedge CLK)
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    decoder #(.R(5)) decoder_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .next_byte(next_byte),
        .symbol(symbol),
        .state(state),
        .fetch(fetch)
    );

endmodule
