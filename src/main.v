module main(
  input signal_in,
  input sys_clk,
  input [7:0] multiplier,
  input [7:0] multiplicand,
  output [6:0] segments,
  output [3:0] anode_active,
  output led
);

    reg rst;
    
    initial begin 
    rst = 1; 
    #10
    rst = 0;
    end 
    
    wire clk;
    wire shift_en;
    wire reg_en;
    wire psel;
    wire zflag;
    wire lsb_multiplicand;
    wire [19:0] bcd;
    wire [13:0] product;
    wire load;
    wire BTNC;
    wire sign;
    
    clk_div clkdiv(sys_clk, clk);
    push_button_detector multiply(sys_clk, signal_in, rst, BTNC);
    ctrl_unit cu(BTNC,zflag,lsb_multiplicand, sys_clk, shift_en, reg_en, load, psel, led);
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
            2'b10: in = bcd[3:0];
            2'b01: in = bcd[7:4];
            2'b00: in = bcd[11:8];
            2'b11: in = (sign) ? 4'b1010 : 4'b0000;
            default: in = 4'b0000;
        endcase
    end

   seven_seg seg(display_enable, in, segments, anode_active);
  
endmodule


