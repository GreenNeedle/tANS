`timescale 1ns / 1ps


module decoder_tb3();

    reg CLK, clr, en, preset;
    reg [3:0] init_offset;
    reg [4:0] init_state;
    reg [15:0] init_buff;
    reg [7:0] next_byte;
    wire [7:0] symbol;
    wire [4:0] state;
    wire fetch;
    
    integer h_bin;
    integer r_bin;
    
    reg [7:0] mem [0:6];

    initial begin
        h_bin = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS/data.dmp", "rb");
        r_bin = $fread(mem[0], h_bin);
        $display("mem[0]: %h", mem[0], 3);
        CLK <= 1;
        clr <= 1;
        en <= 0;
        preset <= 1;
        init_offset <= 2;
        init_state <= 2;
        init_buff <= 16'b0000010110111000;
        next_byte <= 8'b00101011;
        #3
        
        clr <= 0;
        en <= 1;
        #3
        
        @ (posedge CLK)
        preset <= 0;
        
        #40
        
        @ (posedge CLK)
        next_byte <= 8'b01010010;
        
        #20
        
        @ (posedge CLK)
        next_byte <= 8'b00010011;
        #30

        @ (posedge CLK)
        next_byte <= 8'b11111100;
        
        #60
        en <= 0;

        #20
        
        @ (posedge CLK)
        $fclose(h_bin);
        $fclose(r_bin);
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    decoder #(.R(5), .NB_BITS_WIDTH(3)) decoder_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .preset(preset),
        .initial_offset(init_offset),
        .next_byte(next_byte),
        .init_state(init_state),
        .init_buff(init_buff),
        .symbol(symbol),
        .state(state),
        .fetch(fetch)
    );

endmodule
