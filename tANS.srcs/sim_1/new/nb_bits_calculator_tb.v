`timescale 1ns / 1ps


module nb_bits_calculator_tb();

    reg [7:0] symbol, state;
    wire [3:0] nb_bits;
    
    initial begin
        symbol = 8'b00110010;
        state = 16;
        #10
        
        symbol = 8'b00110001;
        state = 26;
        #10
        
        symbol = 8'b00110010;
        state = 29;
        #10

        symbol = 8'b00110001;
        state = 23;
        #10

        symbol = 8'b00110001;
        state = 24;
        #10
        
        symbol = 8'b00110000;
        state = 27;
        #10  
        
        $finish;      
    end
    
    nb_bits_calculator nb_bits_calculator_inst(
        .symbol(symbol),
        .state(state),
        .nb_bits(nb_bits)
    );

endmodule