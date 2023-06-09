/*******************************************************************************
File: seven_seg.v
Authors: Bemen Girgis & Ziad Hassan
Description: This module takes in a 4-bit number and outputs the corresponding
             7-segment display.
License: GPLv2 (see LICENSE file)
******************************************************************************/

`timescale 1ns / 1ps
module seven_seg(input [1:0]en, input [3:0] num, output reg [6:0] segments, output reg[3:0] anode_active);
    always @ (*) begin
        case(en) 
            0: anode_active = 4'b0111; 
            1: anode_active = 4'b1011; 
            2: anode_active = 4'b1101; 
            3: anode_active = 4'b1110; 
            endcase 
        case(num) 
            0: segments = 7'b0000001; 
            1: segments = 7'b1001111; 
            2: segments = 7'b0010010; 
            3: segments = 7'b0000110; 
            4: segments = 7'b1001100; 
            5: segments = 7'b0100100; 
            6: segments = 7'b0100000; 
            7: segments = 7'b0001111;
            8: segments = 7'b0000000; 
            9: segments = 7'b0000100;
            10: segments = 7'b1111110;
            11: segments = 7'b1111111;
            default: segments = 1;
        endcase 
    end
endmodule
