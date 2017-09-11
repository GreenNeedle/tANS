`timescale 1ns / 1ps


module symbols_counter_tb();

    reg CLK, clr, en;
    wire [7:0] symbols_count;
    wire symbols_done;
    
    initial begin
        CLK <= 1;
        clr <= 1;
        en <= 1;
        
        #17 clr <= 0;
        #3
    
        #40 en <= 0;
        @ (posedge CLK) en <= 1;
        
        #50
                
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    symbols_counter #(.MAX(4)) symbol_counter_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .symbols_count(symbols_count),
        .symbols_done(symbols_done)
    );

endmodule
