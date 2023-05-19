`timescale 1ns / 1ps



module signed_multiplier_tb;


  reg signal_in;
  reg sys_clk;
  reg [7:0] multiplier;
  reg [7:0] multiplicand;
  wire [14:0] product;
  wire  load;
  wire  BTNC;
  wire  led;
  wire  sign;
  wire rst;

  main DUT(
    .signal_in(signal_in),
    .sys_clk(sys_clk),
    .multiplier(multiplier),
    .multiplicand(multiplicand),
    .product(product),
    .load(load),
    .BTNC(BTNC),
    .led(led),
    .sign(sign),
    .rst(rst)
   );
   initial begin
   sys_clk = 0 ; 
   forever #10 sys_clk = ~sys_clk;
   end
   
   initial begin 
   signal_in = 0;
   forever #50 signal_in  = ~signal_in;
   end
   
   initial begin
   #100
   multiplicand = 127 ;
   multiplier = 127 ; 
   #100
   multiplicand = 0;
   multiplier = 5 ; 
   #100
   multiplicand = -7 ;
   multiplier = 6 ;
   #100
   multiplicand = 8 ;
   multiplier = 6 ;
   end
   
endmodule