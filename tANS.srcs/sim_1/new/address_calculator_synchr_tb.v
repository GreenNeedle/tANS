`timescale 1ns / 1ps


module address_calculator_synchr_tb();

    reg CLK, clr, en;
    reg [7:0] start, state;
    reg [3:0] nb_bits;
    wire [3:0] address;
    
    initial begin
        CLK = 1;
        clr = 0;
        en = 0;
        start = 8'b00000110;
        state = 16;
        nb_bits = 1;
        #10
        
        clr = 1;
        en = 1;
        #10
        
        clr = 0;
        #10
            
        start = 8'b11111011;
        state = 26;
        nb_bits = 1;
        #10
            
        start = 8'b00000110;
        state = 29;
        nb_bits = 2;
        #10
    
        start = 8'b11111011;
        state = 23;
        nb_bits = 1;
        #10
    
        start = 8'b11111011;
        state = 24;
        nb_bits = 1;
        #10
            
        start = 8'b11111101;
        state = 27;
        nb_bits = 3;
        #10
        
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    address_calculator_synchr address_calculator__synchr_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .start(start),
        .state(state),
        .nb_bits(nb_bits),
        .address(address)
    );

endmodule