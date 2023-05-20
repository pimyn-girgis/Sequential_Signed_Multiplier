`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2023 07:47:21 PM
// Design Name: 
// Module Name: buttons_cu_tb
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


module buttons_cu_tb();

  reg [19:0] bcd;
  reg BTNR;
  reg BTNL;
  reg clk;
  wire [3:0] right_digit;
  wire  [3:0] middle_digit;
  wire  [3:0] left_digit;
  wire sa;
  wire sb;
  wire sc;
  
  
  buttons_control_unit DUT(
    .bcd(bcd),
    .BTNR(BTNR),
    .BTNL(BTNL),
    .clk(clk),
    .right_digit(right_digit),
    .middle_digit(middle_digit),
    .left_digit(left_digit),
    .sa(sa),
    .sb(sb),
    .sc(sc)
   );
   
   initial begin
   clk = 0 ;
   forever #1 clk = ~clk;
   end
   initial begin
   bcd = 19'b0;
   #30
   BTNR = 1; 
   #5
   BTNL = 1 ;
   BTNR = 0 ;
   #5
   BTNL=0;

   end
   


endmodule