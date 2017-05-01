`timescale 1ns / 1ps


module new_bits_evaluator_tb();

    reg [7:0] state;
    reg [7:0] data_valid;
    reg [2:0] valid_bits;
    wire [15:0] new_bits;
    
    initial begin
        state = 16;
        data_valid = 8'b00000001;
        valid_bits = 0;
        #10
        
        state = 26;
        data_valid = 8'b00000001;
        valid_bits = 1;
        #10
        
        state = 29;
        data_valid = 8'b00000011;
        valid_bits = 2;
        #10
        
        state = 23;
        data_valid = 8'b00000001;
        valid_bits = 4;
        #10
        
        state = 24;
        data_valid = 8'b00000001;
        valid_bits = 5;
        #10
        
        state = 27;
        data_valid = 8'b00000111;
        valid_bits = 6;
        #10
        
        state = 18;
        data_valid = 8'b00001111;
        valid_bits = 2;
        #10
        
        $finish;
    end
    
    new_bits_evaluator new_bits_evaluator_inst(
        .state(state),
        .data_valid(data_valid),
        .valid_bits(valid_bits),
        .new_bits(new_bits)
    );

endmodule
