module main(
  input signal_in,
  input sys_clk,
  input [7:0] multiplier,
  input [7:0] multiplicand,
  input rst,
  output [13:0] product,
  output  load,
  output BTNC,
  output [6:0] segments,
  output [3:0] anode_active,
  output led,
  output sign
);

  wire clk;
  clk_div clkdiv(sys_clk, clk);
  //wire BTNC;
  push_button_detector multiply(sys_clk, signal_in, rst, BTNC);
  wire shift_en;
  wire reg_en;
  wire psel;
  wire is_multiplying;
  wire zflag;
  wire lsb_multiplicand;
  wire [19:0] bcd;
  
  ctrl_unit cu(BTNC,zflag,lsb_multiplicand, sys_clk, is_multiplying, shift_en, reg_en, load, psel, led);
  signed_multiplier sm(multiplier, multiplicand, sys_clk, shift_en, reg_en, load, psel, product, sign, zflag,lsb_multiplicand);
  bin_to_bcd binary_bcd(product,bcd);
  
  reg[1:0] display_enable;
   always @(posedge clk) begin
    display_enable <= display_enable + 1;
    if (display_enable == 2'b11)
        display_enable <= 2'b00;
   end

    reg [3:0] in;
    always @(posedge clk) begin
        case(display_enable)
            2'b01: in = bcd[3:0];
            2'b10: in = bcd[7:4];
            2'b11: in = bcd[11:8];
            2'b00: in = (sign) ? 4'b1010 : 4'b0000;
            default: in = 4'b0000;
        endcase
        
    end

   seven_seg seg(display_enable, in, segments, anode_active);
  
endmodule


