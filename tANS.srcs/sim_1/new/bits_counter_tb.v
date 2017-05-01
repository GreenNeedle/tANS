`timescale 1ns / 1ps


module bits_counter_tb();

    reg CLK, clr, en;
    reg [2:0] nb_bits;
    wire [3:0] valid_bits;
    wire done;
    
    initial begin
        CLK = 1;
        clr = 1;
        en = 1;
        nb_bits = 1;
        #3
        
        clr = 0;
        #17
        
        nb_bits = 2;
        #10
        
        nb_bits = 5;
        #10
        
        nb_bits = 4;
        #10
        
        nb_bits = 7;
        #10
        
        nb_bits = 3;
        #10
        
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    bits_counter bits_counter_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .nb_bits(nb_bits),
        .valid_bits(valid_bits),
        .done(done)
    );

endmodule
