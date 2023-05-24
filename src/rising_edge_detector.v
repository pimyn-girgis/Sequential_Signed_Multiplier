/*******************************************************************************
File: rising_edge_detector.v
Authors: Bemen Girgis & Ziad Hassan
Description: This module generates a clock that is high for one clock cycle when
             the input goes from low to high.
License: GPLv2 (see LICENSE file)
******************************************************************************/

`timescale 1ns / 1ps

module rising_edge_detector(
input clk,
input rst,
input lvl,
output tck
);
    reg [1:0] CurrentState, NextState;
    parameter [1:0] A=2'b00, B=2'b01, C=2'b10;
    always @(CurrentState or lvl) begin
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
