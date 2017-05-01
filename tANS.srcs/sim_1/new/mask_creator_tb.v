`timescale 1ns / 1ps


module mask_creator_tb();

    reg [3:0] nb_bits;
    wire [7:0] data_valid;
    
    initial begin
        nb_bits = 1;
        #10
        
        nb_bits = 2;
        #10
        
        nb_bits = 5;
        #10
        
        nb_bits = 3;
        #10
        
        nb_bits = 3;
        #10
        
        nb_bits = 8;
        #10
        
        nb_bits = 6;
        #10
        
        nb_bits = 4;
        #10
        
        nb_bits = 7;
        #10
        
        $finish;
    end
    
    mask_creator masl_creator_inst(
        .nb_bits(nb_bits),
        .data_valid(data_valid)
    );

endmodule