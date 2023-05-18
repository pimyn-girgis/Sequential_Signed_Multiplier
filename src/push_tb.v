`timescale 1ns / 1ps



module push_tb();

  reg sys_clk;
  reg in;
  reg rst;
  wire out;
  
  push_button_detector DUT(
    .clk(sys_clk),
    .in(in),
    .rst(rst),
    .out(out)
   );
   
   initial begin
   sys_clk = 0 ;
   forever #10 sys_clk = ~sys_clk;
   end
   initial begin
 
   rst = 1;
   in = 0;
   #50
   rst = 0 ;
   in = 1 ;
   end
   


endmodule