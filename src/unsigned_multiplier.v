module unsigned_multiplier(
  input [7:0] multiplier,
  input [7:0] multiplicand,
  input clk, // system clock
  input shift_en, //shift enable
  input reg_en, // register enable
  input load, // start multiplication
  input psel, // if 0 load 0 into product register, if 1 continue multiplication
  output reg [14:0] product,
  output zflag
);
  
  initial begin 
  product = 0;
  end
  
  wire [7:0] shifted_multiplier;
  wire [14:0] shifted_multiplicand;
  // At the  first clock cycle, no shifting occurs. So , then it is considered as zero bits shift. 
  // In the following cycles shifting occurs until multiplication stops.
  shift_left sl(.in(multiplicand), .out(shifted_multiplicand), .clk(clk), .en(shift_en), .load(load));
  shift_right sr(.in(multiplier), .out(shifted_multiplier), .clk(clk), .en(shift_en), .load(load));

  assign zflag = (shifted_multiplier == 8'b0);

  always @(posedge clk) begin
    if (reg_en && psel) begin  
        product <=  shifted_multiplier[0]? product + shifted_multiplicand : product;
    end else if (reg_en && !psel) begin
        product <= 0;
    end
  end

endmodule
