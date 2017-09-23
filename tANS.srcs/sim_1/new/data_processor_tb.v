`timescale 1ns / 1ps


module data_processor_tb();

    reg CLK, clr, en;
    reg [2:0] nb_bits;
    reg [7:0] next_byte;
    wire [7:0] data_out;
    wire fetch;
    
    initial begin
        CLK <= 1;
        clr <= 1;
        en <= 1;
        next_byte <= 8'b01001111;
        nb_bits <= 3;
        #3
        
        clr <= 0;
        
        @ (posedge CLK)
        nb_bits <= 5;
        
        @ (posedge CLK)
        nb_bits <= 6;
        
        @ (posedge CLK)
        next_byte <= 8'b00001011;
        nb_bits <= 5;
        
        @ (posedge CLK)
        nb_bits <= 1;
        
        @ (posedge CLK)
        nb_bits <= 1;
        
        @ (posedge CLK)
        nb_bits <= 1;
        
        @ (posedge CLK)
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    data_processor data_processor_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .nb_bits(nb_bits),
        .next_byte(next_byte),
        .data_out(data_out),
        .fetch(fetch)
    );  

endmodule
