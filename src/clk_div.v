/*******************************************************************************
File: clk_div.v
Authors: Ziad Hassan & Bemen Girgis
Description: This module is a clock divider. It takes in a clock and outputs a
             slower clock depending on the parameter n.
License: GPLv2 (see LICENSE file)
******************************************************************************/

`timescale 1ns / 1ps

module clk_div #(parameter n = 5000)(
    input clk_in,
    output reg clk_out
    );
reg [31:0] count;
always @ (posedge clk_in) begin
    count <= count + 1;
    if(count == n)
        count <= 32'b0;
end
always @ (posedge clk_in) begin
    if(count == n)
        clk_out <= ~clk_out;
end
endmodule
