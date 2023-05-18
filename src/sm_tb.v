`timescale 1ns / 1ps



module sm_tb;


  reg [7:0] multiplier;
  reg [7:0] multiplicand;
  reg clk;
  reg shift_en;
  reg reg_en;
  reg  load;
  reg  psel;
  wire [13:0] product;
  wire sign;
  wire zflag;
  wire  lsb_multiplicand;
  
  signed_multiplier DUT(
    .multiplier(multiplier),
    .multiplicand(multiplicand),
    .clk(clk),
    .shift_en(shift_en),
    .reg_en(reg_en),
    .load(load),
    .psel(psel),
    .product(product),
    .sign(sign),
    .zflag(zflag),
    .lsb_multiplicand(lsb_multiplicand)
   );
   
   initial begin
   clk = 0 ;
   forever #10 clk = ~clk;
   end
   initial begin
   #30
   multiplier = -5; 
   multiplicand = 5; 
   #50
   load = 1 ;
   shift_en=0;
   psel = 0;
   #10
   reg_en=1;
   #50 
   load = 0;
   shift_en=1;
   reg_en=1;
   psel = 1;
   #50 
   load = 0;
   shift_en=1;
   reg_en=1;
   psel = 1;
   #50 
   load = 0;
   shift_en=1;
   reg_en=1;
   psel = 1;

   end
   


endmodule