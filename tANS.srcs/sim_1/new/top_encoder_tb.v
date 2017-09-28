`timescale 1ns / 1ps


module top_encoder_tb();

    reg CLK, clr, en;
    reg [7:0] symbol;
    wire [7:0] data_out;
    wire byte_done, symbols_done;
    wire [2:0] valid_bits;
    wire [7:0] symbols_count;
    wire [4:0] last_state;
    
    integer debug, h_wb_data, h_rb_symbols, r_symbols;
    
    reg [7:0] mem [0:9];
    
    integer i;
    
    initial begin
        debug = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/dump_all.txt");
        h_wb_data = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/dump_bin.dmp", "wb");
        h_rb_symbols = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/symbols.dmp", "rb");
        r_symbols = $fread(mem[0], h_rb_symbols);
        CLK <= 1;
        clr <= 1;
        en <= 1;
        
        #3 clr <= 0;
        #7
        
        #120
        $fclose(debug);
        $fclose(h_wb_data);
        $fclose(h_rb_symbols);
        $finish;
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    initial begin
        for (i = 0 ; i < 10; i = i + 1) begin
            @ (posedge CLK)
            symbol <= mem[i];
        end
        @ (posedge CLK)
        en <= 0;
    end
    
    always @ (posedge CLK) begin
        $fwrite(debug, "symbol %c ", symbol, 
                       "data_out %b ", data_out,
                       "byte_done %b ", byte_done,
                       "symbols_done %b ", symbols_done,
                       "valid_bits %d ", valid_bits,
                       "symbols_count %d ", symbols_count,
                       "last_state %d\n", last_state);
        if (byte_done || symbols_done) begin
            $fwrite(h_wb_data, "%c", data_out);
        end
        if (symbols_done) begin
            $fwrite(h_wb_data, "%c", byte_done,
                               "%c", valid_bits,
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