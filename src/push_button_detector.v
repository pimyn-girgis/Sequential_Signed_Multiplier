/*******************************************************************************
File: push_button_detector.v
Authors: Bemen Girgis & Ziad Hassan
Description: This module instantiates a debouncer, synchronizer, and rising edge
             detector to detect a button press.
License: GPLv2 (see LICENSE file)
******************************************************************************/

`timescale 1ns / 1ps
module push_button_detector(
    input clk,
    input in,
    input rst,
    output out
    );
    wire db_out, sync_out;
    debouncer db(.clk(clk), .rst(rst), .in(in), .out(db_out));
    synchronizer sync(.clk(clk), .rst(rst), .in(in), .out(sync_out));
    rising_edge_detector detect(.clk(clk), .rst(rst), .lvl(sync_out), .tck(out));
endmodule
