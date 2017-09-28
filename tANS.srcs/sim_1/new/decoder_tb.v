`timescale 1ns / 1ps


module decoder_tb();

    reg CLK, clr, en, preset;
    reg [7:0] next_byte;
    reg [3:0] init_state;
    reg [15:0] init_buff;
    wire [7:0] symbol;
    wire [3:0] state;
    wire fetch;
    
    integer debug, h_wb_symbols, h_rb_data, r_data;
    
    reg [7:0] mem [0:4];
    
    reg [3:0] offset; 
    
    initial begin
        debug = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/debug_symbols.txt");
        h_wb_symbols = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/dec_symbols.dmp", "wb");
        h_rb_data = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/dump_bin.dmp", "rb");
        r_data = $fread(mem[0], h_rb_data);
        CLK <= 1;
        clr <= 1;
        en <= 0;
        preset <= 1;
        next_byte <= 8'b11111111; //not used in testbench
        init_state <= mem[4] - 16;
        init_buff <= {mem[1], mem[0]};
        if (mem[2] == 0) begin
            offset <= 8 - mem[3];
        end
        else begin
            offset <= 0;
        end
        #3
        
        clr <= 0;
        en <= 1; 
        
        @ (posedge CLK)
        preset <= 0;
        
        #90
        
        en <= 0;
        
        #20
        
        @ (posedge CLK)
        $fwrite(debug, "symbol %b\n", symbol);
        $fwrite(h_wb_symbols, "%c", symbol);
        $fclose(debug);
        $fclose(h_wb_symbols);
        $fclose(h_rb_data);
        $finish;
    end
    
    always @ (posedge CLK) begin
        if (en) begin
            $fwrite(debug, "symbol %b\n", symbol);
            $fwrite(h_wb_symbols, "%c", symbol);
        end
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    decoder decoder_inst(
        .CLK(CLK),
        .clr(clr),
        .en(en),
        .preset(preset),
        .initial_offset(offset),
        .next_byte(next_byte),
        .init_state(init_state),
        .init_buff(init_buff),
        .symbol(symbol),
        .state(state),
        .fetch(fetch)
    );

endmodule
