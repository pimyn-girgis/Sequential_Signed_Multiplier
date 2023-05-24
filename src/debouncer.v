/*******************************************************************************
File: debouncer.v
Authors: CSCE 2302 Spring 2023 AUC.
Description: This module is the debouncer. It takes in a clock and a button
             input and outputs a debounced button. The debouncer is necessary
             because the buttons are very noisy and the FPGA registers the
             button press multiple times.
License: N/A
******************************************************************************/

`timescale 1ns / 1ps
module debouncer(input clk, rst, in, output out);
    reg q1,q2,q3;
    always@(posedge clk, posedge rst) begin
         if(rst == 1'b1) begin
             q1 <= 0;
             q2 <= 0;
             q3 <= 0;
         end
         else begin
             q1 <= in;
             q2 <= q1;
             q3 <= q2;
         end
     end
    assign out = (rst) ? 0 : q1&q2&q3;
endmodule
