`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 08:46:55 AM
// Design Name: 
// Module Name: push_button_detector
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
