module signed_multiplier(
  input [7:0] multiplier,
  input [7:0] multiplicand,
  input clk, // system clock
  input shift_en, //shift enable
  input reg_en, // register enable
  input load, // start multiplication
  input psel, // if 0 load 0 into product register, if 1 continue multiplication
  output [13:0] product,
  output reg sign,
  output  zflag,
  output  lsb_multiplier
  );


  always @(posedge clk) begin
    if (load) begin
      sign <= multiplicand[7] ^ multiplier[7];
    end
  end

  wire [7:0] comp_multiplier;
  wire [7:0] comp_multiplicand;

  twos_complement tc1(multiplier, comp_multiplier);
  twos_complement tc2(multiplicand, comp_multiplicand);

  unsigned_multiplier um(comp_multiplier, comp_multiplicand,
    clk, shift_en, reg_en, load, psel, product, zflag, lsb_multiplier);

endmodule
