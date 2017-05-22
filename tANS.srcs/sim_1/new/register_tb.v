`timescale 1ns / 1ps


module register_tb();

    reg CLK, clr, en;
    reg [7:0] in;
    wire [7:0] out;
    
    initial begin
        CLK <= 1;
        clr <= 0;
        en <= 0;
        in <= 10;
        #10
        
        clr <= 1;
        en <= 1;
        #10
        
        clr <= 0;
        #10
        
        in <= 15;
        #10
        
        in <= 3;
        #10
        
        $finish;
    end
    
    always begin
        #5 CLK <= ~CLK;
    end
    
    register register_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .in(in),
        .out(out)
    );

endmodule
