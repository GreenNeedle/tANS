`timescale 1ns / 1ps


module start_rom_tb();

    reg [7:0] symbol;
    wire [7:0] start;
    
    initial begin
        symbol = 8'b00110010;
        #10
        
        symbol = 8'b00110010;
        #10
        
        symbol = 8'b00110000;
        #10
        
        symbol = 8'b00110001;
        #10
        
        symbol = 8'b00110000;
        #10
    
        $finish;
    end
    
    start_rom start_rom_inst(
        .symbol(symbol),
        .start(start)
    );
    
endmodule