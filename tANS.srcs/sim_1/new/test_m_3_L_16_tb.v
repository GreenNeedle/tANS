`timescale 1ns / 1ps


module test_m_3_L_16_tb();

    reg CLK, enc_clr, enc_en;
    reg [7:0] enc_symbol_in;
    wire [7:0] enc_data_out;
    wire enc_byte_done, enc_symbols_done;
    wire [2:0] enc_valid_bits;
    wire [7:0] enc_symbols_count;
    wire [4:0] enc_state;
    
    integer enc_debug, enc_h_wb_data, enc_h_rb_symbols, enc_r_symbols;
    
    reg [7:0] enc_mem [0:19];
    
    integer i;
    integer j;
    integer x;
    
    reg dec_clr, dec_en, dec_preset;
    reg [7:0] dec_next_byte;
    reg [3:0] dec_offset; 
    reg [3:0] dec_init_state;
    reg [15:0] dec_init_buff;
    wire [7:0] dec_symbol_out;
    wire [3:0] dec_state;
    wire dec_fetch;
    
    integer dec_debug, dec_h_wb_symbols, dec_h_rb_data, dec_r_data;
    
    reg [7:0] dec_mem [0:6];
    
    integer fix1, fix2, fix3;
    
    always begin
        #5 CLK = ~CLK;
    end
    
    initial begin
     #220
               $fclose(enc_debug);
               $fclose(enc_h_wb_data);
               $fclose(enc_h_rb_symbols); 
      end         
    
    initial begin
        enc_debug = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/dump_all.txt");
        enc_h_wb_data = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/dump_bin.dmp", "wb");
        enc_h_rb_symbols = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/symbols.dmp", "rb");
        enc_r_symbols = $fread(enc_mem[0], enc_h_rb_symbols);
        CLK <= 1;
        enc_clr <= 1;
        enc_en <= 1;
        
        dec_clr <= 0;
        dec_en <= 0;
        dec_preset <= 0;
        
        #3 enc_clr <= 0;
        
    end
    
    initial begin
        for (i = 0 ; i < 20; i = i + 1) begin
            @ (posedge CLK)
            enc_symbol_in <= enc_mem[i];
        end
        @ (posedge CLK)
        enc_en <= 0;
    end
    
//      initial begin
//          for (j = 4 ; j >0; j = j - 1) begin
//              @(posedge dec_fetch)
              
//              x=77;
//          end
         
//      end

initial begin
#280 dec_next_byte <= dec_mem[1];
#60 dec_next_byte <= dec_mem[0];
end
    
    always @ (posedge CLK) begin
        $fwrite(enc_debug, "symbol %c ", enc_symbol_in, 
                           "data_out %b ", enc_data_out,
                           "byte_done %b ", enc_byte_done,
                           "symbols_done %b ", enc_symbols_done,
                           "valid_bits %d ", enc_valid_bits,
                           "symbols_count %d ", enc_symbols_count,
                           "last_state %d\n", enc_state);
        if (enc_byte_done) begin
            $fwrite(enc_h_wb_data, "%c", enc_data_out);
        end    
    end
    
    always @ (posedge enc_symbols_done) begin
        #5
        $fwrite(enc_h_wb_data, "%c", enc_data_out,
                               "%c", enc_byte_done,
                               "%c", enc_valid_bits,
                               "%c", enc_state);
    end
    
    top_encoder #(.MAX(19)) top_encoder_inst(
        .CLK(CLK),
        .clr(enc_clr),
        .en(enc_en),
        .symbol(enc_symbol_in),
        .data_out(enc_data_out),
        .byte_done(enc_byte_done),
        .symbols_done(enc_symbols_done),
        .valid_bits(enc_valid_bits),
        .symbols_count(enc_symbols_count),
        .last_state(enc_state)
    );
    
    always @ (posedge enc_symbols_done) begin
        #30
        fix1 = $fopen("/home/joanna/Pulpit/fix1.txt");
        fix2 = $fopen("/home/joanna/Pulpit/fix2.dmp", "wb");
        fix3 = $fopen("/home/joanna/Pulpit/fix3.dmp", "rb");
        dec_debug = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/debug_symbols.txt");
        dec_h_wb_symbols = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/dec_symbols.dmp", "wb");
        dec_h_rb_data = $fopen("/home/joanna/Programowanie/FPGA/Projekty/tANS.tests/test_m_3_L_16/tANS/dump_bin.dmp", "rb");
        dec_r_data = $fread(dec_mem[0], dec_h_rb_data);
        
        #9
        dec_clr <= 1;
        dec_preset <= 1;
        dec_next_byte <= 8'b11111111; //not used in testbench
        dec_init_state <= dec_mem[dec_r_data-1] - 16;
        dec_init_buff <= {dec_mem[dec_r_data-4], dec_mem[dec_r_data-5]};
        if (dec_mem[dec_r_data-3] == 0) begin
            dec_offset <= 8 - dec_mem[dec_r_data-2];
        end
        else begin
            dec_offset <= 0;
        end
        //j <= 2;
        #7
        
        dec_clr <= 0;
        dec_en <= 1; 
        
        @ (posedge CLK)
        dec_preset <= 0;
        
        #300
        
        dec_en <= 0;
        
        #20
        
        #50
        
        //@ (posedge CLK)
        //$fwrite(dec_debug, "symbol %b\n", dec_symbol_out);
        //$fwrite(dec_h_wb_symbols, "%c", dec_symbol_out);
        $fclose(dec_debug);
        $fclose(dec_h_wb_symbols);
        $fclose(dec_h_rb_data);
        $finish;    
    end
    /*
    always @ (posedge CLK) begin
       
        if(dec_fetch) begin
            dec_next_byte <= dec_mem[j];
                j <= j-1;
           end
      end
      always @ (posedge dec_fetch) begin
        if(dec_fetch) 
            j = j+1;
      
      
      end*/
                
  
    
    always @ (posedge CLK) begin
        if (dec_en) begin
            $fwrite(dec_debug, "symbol %b\n", dec_symbol_out);
            $fwrite(dec_h_wb_symbols, "%c", dec_symbol_out);
        end
    end
    
    decoder decoder_inst(
        .CLK(CLK),
        .clr(dec_clr),
        .en(dec_en),
        .preset(dec_preset),
        .initial_offset(dec_offset),
        .next_byte(dec_next_byte),
        .init_state(dec_init_state),
        .init_buff(dec_init_buff),
        .symbol(dec_symbol_out),
        .state(dec_state),
        .fetch(dec_fetch)
    );

endmodule
