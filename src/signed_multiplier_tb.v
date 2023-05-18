module signed_multiplier_tb;
`timescale 1ns/1ps

  reg signal_in;
  reg sys_clk;
  reg [7:0] multiplier;
  reg [7:0] multiplicand;
  reg rst; 
  wire [13:0] product;
  wire  load;
  wire BTNC;
  wire [6:0] segments;
  wire [3:0] anode_active;
  wire  led;
  wire sign;
  
  main DUT(
    .signal_in(signal_in),
    .sys_clk(sys_clk),
    .multiplier(multiplier),
    .multiplicand(multiplicand),
    .rst(rst),
    .product(product),
    .load(load),
    .BTNC(BTNC),
    .segments(segments),
    .anode_active(anode_active),
    .led(led),
    .sign(sign)
   );
   
   initial begin
   sys_clk = 0 ; 
   forever #10 sys_clk = ~sys_clk;
   end
 
   initial begin
   multiplicand = 14; 
   multiplier = 13; 
   signal_in = 1 ;
   #35
   signal_in = 0 ;
   end

endmodule