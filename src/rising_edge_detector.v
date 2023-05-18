`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 08:12:33 AM
// Design Name: 
// Module Name: rising_edge_detector
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


module rising_edge_detector(
input clk,
input rst,
input lvl,
output tck
);
    reg [1:0] CurrentState, NextState;
    parameter [1:0] A=2'b00, B=2'b01, C=2'b10;
    always @(posedge clk) begin
        case (CurrentState)
        A: if (lvl == 0) begin
            NextState = A;
        end else begin
            NextState = B;
        end
        B: if (lvl == 0) begin
            NextState = A;
        end else begin
            NextState = C;
        end
        C: if (lvl == 0) begin
            NextState = A;
        end else begin
            NextState = C;
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
        assign tck = (CurrentState == B);
endmodule
