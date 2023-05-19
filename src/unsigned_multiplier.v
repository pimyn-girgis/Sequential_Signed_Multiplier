module unsigned_multiplier(
  input [7:0] multiplier,
  input [7:0] multiplicand,
  input clk, // system clock
  input shift_en, //shift enable
  input reg_en, // register enable
  input load, // start multiplication
  input psel, // if 0 load 0 into product register, if 1 continue multiplication
  output reg [13:0] product,
  output zflag,
  output lsb_multiplicand
);
  
  initial begin 
  product = 0;
  end
  
  wire [13:0] shifted_multiplier;
  wire [7:0] shifted_multiplicand;

  shift_left sl(multiplicand, shifted_multiplicand, clk, shift_en, load);
  shift_right sr(multiplier, shifted_multiplier, clk, shift_en, load);

  reg [13:0] cur_sum;
  
  assign lsb_multiplicand = shifted_multiplier[0];
  assign zflag = (shifted_multiplier == 8'b0);

  always @(posedge clk) begin
    if (reg_en && psel) begin  
        product <=  shifted_multiplier[0]? product + shifted_multiplicand : product;
    end else if (reg_en && !psel) begin
        product <= 0;
    end
  end

endmodule
