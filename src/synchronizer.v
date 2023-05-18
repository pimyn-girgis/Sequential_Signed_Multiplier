`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 08:56:36 AM
// Design Name: 
// Module Name: synchronizer
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
