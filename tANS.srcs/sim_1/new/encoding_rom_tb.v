`timescale 1ns / 1ps


module encoding_rom_tb();

    reg [3:0] address;
    wire [7:0] state;
    
    initial begin
        address = 3;
        #10
        
        address = 8;
        #10
        
        address = 0;
        #10
        
        address = 1;
        #10
        
        address = 15;
        #10
        
        address = 9;
        #10
        
        address = 2;
        #10
        
        address = 4;
        #10
        
        address = 5;
        #10
        
        address = 6;
        #10
        
        address = 7;
        #10
        
        address = 10;
        #10
        
        address = 11;
        #10
        
        address = 12;
        #10
        
        address = 13;
        #10
        
        address = 14;
        #10
        
        $finish;
    end
    
    encoding_rom encoding_rom_inst(
        .address(address),
        .state(state)
    );

endmodule
