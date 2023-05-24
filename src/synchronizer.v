/*******************************************************************************
File: synchronizer.v
Authors: CSCE 2302 Spring 2023 AUC.
Description: This module is the synchronizer. It takes in a clock and a button
             input and outputs a synchronized button. The synchronizer provides
             enough time for the metastability to settle.
License: N/A
******************************************************************************/

`timescale 1ns / 1ps
module synchronizer(input clk, rst, in, output out);
    reg q1;
    reg q2;
    always@(posedge clk, posedge rst) begin
         if(rst == 1'b1) begin
             q1 <= 0;
             q2 <= 0;
         end
         else begin
             q1 <= in;
             q2 <= q1;
         end
     end
    assign out = (rst) ? 0 : q2;
endmodule
