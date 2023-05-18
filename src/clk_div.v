`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 08:47:29 AM
// Design Name: 
// Module Name: clk_div
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


module clk_div #(parameter n = 500000)(
    input clk_in,
    output reg clk_out
    );
reg [31:0] count;
reg [4:0] rstcnt;

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
