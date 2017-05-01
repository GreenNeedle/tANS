`timescale 1ns / 1ps


module state_machine_tb();

    reg CLK, clr, en;
    reg [7:0] symbol;
    reg [3:0] nb_bits;
    wire [7:0] state;
    
    initial begin
        CLK = 1;
        clr = 0;
        en = 0;
        symbol = 8'b00110010;
        nb_bits = 1;
        #10
        
        clr = 1;
        en = 1;
        #10
        
        clr = 0;
        symbol = 8'b00110001;
        nb_bits = 1;
        #10
        
        symbol = 8'b00110010;
        nb_bits = 2;
        #10
        
        symbol = 8'b00110001;
        nb_bits = 1;
        #10
        
        symbol = 8'b00110001;
        nb_bits = 1;
        #10
        
        symbol = 8'b00110000;
        nb_bits = 3;
        #10
        
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    state_machine state_machine_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .symbol(symbol),
        .nb_bits(nb_bits),
        .state(state)
    );

endmodule
