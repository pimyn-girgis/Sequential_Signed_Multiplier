`timescale 1ns / 1ps



module ctrl_unit_tb;


  reg BTNC;
  reg z_flag_multiplicand;
  reg lsb_multiplicand;
  reg clk;
  wire is_multiplying;
  wire  shift_en;
  wire  reg_en;
  wire  load;
  wire  psel;
  wire  led;

  ctrl_unit DUT(
    .BTNC(BTNC),
    .z_flag_multiplicand(z_flag_multiplicand),
    .lsb_multiplicand(lsb_multiplicand),
    .clk(clk),
    .is_multiplying(is_multiplying),
    .shift_en(shift_en),
    .reg_en(reg_en),
    .load(load),
    .psel(psel),
    .led(led)
   );
   initial begin
   clk = 0 ; 
   forever #10 clk = ~clk;
   end
   initial begin
   #30
   BTNC = 1 ;
   #30
   z_flag_multiplicand = 0 ;
   #20
   lsb_multiplicand = 1;
   end
   


endmodule