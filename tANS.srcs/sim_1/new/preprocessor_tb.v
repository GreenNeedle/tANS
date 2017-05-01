`timescale 1ns / 1ps


module preprocessor_tb();

    reg CLK, clr, en;
    reg [7:0] symbol;
    wire [7:0] state, data_valid;
    wire [3:0] nb_bits;
    wire [7:0] next_state;
    
    initial begin
        CLK = 1;
        clr = 1;
        en = 1;
        symbol = 8'b00110010;
        #3  
        
        clr = 0;
        #7
        
        symbol = 8'b00110001;
        #10
        
        symbol = 8'b00110010;
        #10
        
        symbol = 8'b00110001;
        #20
        
        symbol = 8'b00110000;
        #10
    
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    preprocessor preprocessor_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .symbol(symbol),
        .state(state),
        .data_valid(data_valid),
        .nb_bits(nb_bits),
        .next_state(next_state)
    );

endmodule
