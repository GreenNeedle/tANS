`timescale 1ns / 1ps


module top_encoder_tb();

    reg CLK, clr, en;
    reg [7:0] symbol;
    wire [7:0] data_out;
    wire byte_done, symbols_done;
    wire [2:0] valid_bits;
    wire [7:0] symbols_count;
    wire [4:0] last_state;
    
    integer h_all, h_bin;
    
    initial begin
        h_all = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/dump_all.txt");
        h_bin = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/dump_bin.dmp", "wb");
        CLK <= 1;
        clr <= 1;
        en <= 1;
        symbol <= 8'b00110010;
        
        #3 clr <= 0;
        #7
        
        @ (posedge CLK)
        symbol <= 8'b00110001;
        
        @ (posedge CLK)
        symbol <= 8'b00110010;
        
        @ (posedge CLK)
        symbol <= 8'b00110001;
        
        @ (posedge CLK)
        symbol <= 8'b00110001;
        
        @ (posedge CLK)
        symbol <= 8'b00110000;
        
        @ (posedge CLK)
        symbol <= 8'b00110010;
        
        @ (posedge CLK)
        symbol <= 8'b00110001;
        
        @ (posedge CLK)
        symbol <= 8'b00110010;
        
        @ (posedge CLK)
        symbol <= 8'b00110000;
        
        @ (posedge CLK)
        en <= 0;
        
        #30
        $fclose(h_all);
        $fclose(h_bin);
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    always @ (posedge CLK) begin
        $fwrite(h_all, "symbol %c ", symbol, 
                       "data_out %b ", data_out,
                       "byte_done %b ", byte_done,
                       "symbols_done %b ", symbols_done,
                       "valid_bits %d ", valid_bits,
                       "symbols_count %d ", symbols_count,
                       "last_state %d\n", last_state);
    if (byte_done || symbols_done) begin
        $fwrite(h_bin, "%c", data_out);
    end
    if (symbols_done) begin
        $fwrite(h_bin, "%c", valid_bits,
                       "%c", last_state);
    end    
    end
    
    top_encoder top_encoder_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .symbol(symbol),
        .data_out(data_out),
        .byte_done(byte_done),
        .symbols_done(symbols_done),
        .valid_bits(valid_bits),
        .symbols_count(symbols_count),
        .last_state(last_state)
    );

endmodule