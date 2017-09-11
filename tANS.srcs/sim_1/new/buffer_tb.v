`timescale 1ns / 1ps


module buffer_tb();

    reg CLK, clr, en;
    reg [15:0] new_bits;
    wire [7:0] data_out;
    wire byte_done, symbols_done;
    
    initial begin
        CLK <= 1;
        clr <= 1;
        en <= 1;
        new_bits <= 16'b0000000000000000;
        #3
        
        clr <= 0;
        #20
        
        @ (posedge CLK)
        new_bits <= 16'b0000000000000100;
        
        @ (posedge CLK)
        new_bits <= 16'b0000000000010000;
        
        @ (posedge CLK)
        new_bits <= 16'b0000000000000000;
        
        @ (posedge CLK)
        new_bits <= 16'b0000000011000000;
        
        @ (posedge CLK)
        en <= 0;
        new_bits <= 16'b0000000000000010;
        
        @ (posedge CLK)
        en <= 1;
        new_bits <= 16'b0000000000000100;
        
        @ (posedge CLK)      
        new_bits <= 16'b0000000000010000;
        
        @ (posedge CLK)      
        new_bits <= 16'b0000000000000000;
        
        @ (posedge CLK)     
        new_bits <= 16'b0000000011000000;
        
        @ (posedge CLK)
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    buffer buffer_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .new_bits(new_bits),
        .data_out(data_out),
        .byte_done(byte_done),
        .symbols_done(symbols_done)
    );

endmodule
