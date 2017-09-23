`timescale 1ns / 1ps


module dec_state_machine_tb();

    reg CLK, clr, en;
    reg [7:0] next_byte;
    wire [3:0] state;
    wire fetch;
    
    initial begin
        CLK <= 1;
        clr <= 1;
        en <= 1;
        next_byte <= 8'b11111111; //not used in testbench
        #3
        
        clr <= 0;
        
        #90
        
        @ (posedge CLK)
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    dec_state_machine dec_state_machine_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .next_byte(next_byte),
        .state(state),
        .fetch(fetch)
    );

endmodule
