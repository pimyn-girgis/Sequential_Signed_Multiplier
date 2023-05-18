`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 09:37:27 AM
// Design Name: 
// Module Name: lock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lock(
    input clk,
    input rst,
    input in_A,
    input in_B,
    input in_C,
    input in_D,
    output is_unlocked
    );
        wire [3:0] butt_out;
        reg [2:0] CurrentState, NextState;
        parameter [2:0] A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100;
        push_button_detector butt_A (clk,in_A,rst,butt_out[0]);
        push_button_detector butt_B (clk,in_B,rst,butt_out[1]);
        push_button_detector butt_C (clk,in_C,rst,butt_out[2]);
        push_button_detector butt_D (clk,in_D,rst,butt_out[3]);
        always @ (*) begin
            case (CurrentState) 
            A: if (butt_out == 4'b1000) begin
                NextState = B;
            end else begin
                NextState = A;
            end
            B: if (butt_out == 4'b0000 || butt_out==4'b1000) begin
                NextState = B;
            end else if(butt_out == 4'b0010) begin
                NextState = C;
            end else begin
                NextState = A;
            end
            C: if (butt_out == 4'b0000) begin
                NextState = C;
            end else if(butt_out == 4'b1000) begin
                NextState = B;
            end else if(butt_out == 4'b0100) begin
                NextState = D;
            end else begin
                NextState = A;
            end 
            D: if (butt_out == 4'b0000) begin
                NextState = D;
            end else if(butt_out == 4'b1000) begin
                NextState = B;
            end else if(butt_out == 4'b0001) begin
                NextState = E;
            end else begin
                NextState = A;
            end 
            E: if (butt_out == 4'b0000) begin
                NextState = E;
            end else if(butt_out == 4'b1000) begin
                NextState = B;
            end else begin
                NextState = A;
            end 
            default: NextState = A;
        endcase
        end
        always @ (posedge clk or posedge rst) begin
            if (rst) begin
                CurrentState <= A;
            end else begin
                CurrentState <= NextState;
            end
        end
            assign is_unlocked = (CurrentState == E);
endmodule
