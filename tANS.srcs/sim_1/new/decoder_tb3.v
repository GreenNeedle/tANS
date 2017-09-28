`timescale 1ns / 1ps


module decoder_tb3();

    reg CLK, clr, en, preset;
    reg [4:0] init_state;
    reg [7:0] next_byte;
    wire [7:0] symbol;
    wire [4:0] state;
    wire fetch;
    
    integer h_bin;
    integer r_bin;
    
    reg [7:0] mem [0:6];
    
    initial begin
     preset <= 1;
    #12 preset <= 0;
    end
    initial begin
        h_bin = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS/data.dmp", "rb");
        r_bin = $fread(mem[0], h_bin);
        $display("mem[0]: %h", mem[0], 3);
        CLK <= 1;
        clr <= 1;
        en <= 1;
       // preset <= 1;
        init_state <= 2;
        next_byte <= 8'b00000000;
        #3
        
        clr <= 0;
        #3
        
        //preset <= 1;
        //preset <= 0;
        #10
        @ (posedge CLK)
        next_byte <= 8'b10101101;
        #30
        
        @ (posedge CLK)
        next_byte <= 8'b01001000;
        #30

        @ (posedge CLK)
        next_byte <= 8'b01001111;
        #30
        
        @ (posedge CLK)
        next_byte <= 8'b11110000;
        #80
        
        @ (posedge CLK)
        $fclose(h_bin);
        $fclose(r_bin);
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    decoder #(.R(5)) decoder_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .preset(preset),
        .next_byte(next_byte),
        .init_state(init_state),
        .symbol(symbol),
        .state(state),
        .fetch(fetch)
    );

endmodule
