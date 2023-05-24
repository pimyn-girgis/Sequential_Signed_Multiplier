/*******************************************************************************
File: signed_multiplier.v
Authors: Ziad Hassan & Bemen Girgis
Description: This module takes in two 8-bit numbers and multiplies them together
             using the unsigned multiplier module.
License: GPLv2 (see LICENSE file)
******************************************************************************/

module signed_multiplier(
  input [7:0] multiplier,
  input [7:0] multiplicand,
  input clk, // system clock
  input shift_en, //shift enable
  input reg_en, // register enable
  input load, // start multiplication
  input psel, // if 0 load 0 into product register, if 1 continue multiplication
  output [14:0] product,
  output reg sign,
  output  zflag
  );


  always @(posedge clk) begin
    if (load) begin
        if(multiplicand == 0 || multiplier == 0) begin
            sign <=0;    
        end else
             sign <= multiplicand[7] ^ multiplier[7];
    end
  end
  
  wire [7:0] comp_multiplier;
  wire [7:0] comp_multiplicand;

  twos_complement tc_multiplier(.in(multiplier), .out(comp_multiplier));
  twos_complement tc_multiplicand(.in(multiplicand), .out(comp_multiplicand));

  unsigned_multiplier um(comp_multiplier, comp_multiplicand,
    clk, shift_en, reg_en, load, psel, product, zflag);

endmodule
