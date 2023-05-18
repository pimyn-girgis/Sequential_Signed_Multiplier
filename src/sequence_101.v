`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 07:56:11 AM
// Design Name: 
// Module Name: sequence_101
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


module sequence_101(
input clk,
input rst,
input x,
output z
);
    reg [1:0] CurrentState, NextState;
    parameter [1:0] A=2'b00, B=2'b01, C=2'b10;
    always @ (x or CurrentState) begin
        case (CurrentState)
        A: if (x == 0) begin
            NextState = A;
        end else begin
            NextState = B;
        end
        B: if (x == 0) begin
            NextState = C;
        end else begin
            NextState = B;
        end
        C: if (x == 0) begin
            NextState = A;
        end else begin
            NextState = B;
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
        assign z = (CurrentState == C) ? (NextState == B) : 1'b0;
endmodule
