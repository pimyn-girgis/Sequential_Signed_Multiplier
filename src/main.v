module main(
  input signal_in,
  input left_button_in,
  input right_button_in,
  input sys_clk,
  input [7:0] multiplier,
  input [7:0] multiplicand,
  output [6:0] segments,
  output [3:0] anode_active,
  output led,
  output sa,
  output sb,
  output sc
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
    wire [19:0] bcd;
    wire [14:0] product;
    wire load;
    wire BTNC, BTNR, BTNL;
    wire sign;
    wire [3:0] right_digit ,middle_digit, left_digit;
    
    clk_div clkdiv(sys_clk, clk);
    push_button_detector multiply_pressed(sys_clk, signal_in, rst, BTNC);
    push_button_detector right_pressed(sys_clk, right_button_in, rst, BTNR);
    push_button_detector left_pressed(sys_clk, left_button_in, rst, BTNL);
    ctrl_unit cu(BTNC,zflag,lsb_multiplier, sys_clk, shift_en, reg_en, load, psel, led);
    signed_multiplier sm(multiplier, multiplicand, sys_clk, shift_en, reg_en, load, psel, product, sign, zflag);
    bin_to_bcd binary_bcd(product,bcd);
    buttons_control_unit bcu(bcd,BTNR,BTNL,sys_clk,right_digit,middle_digit,left_digit,sa,sb,sc);
    
    reg[1:0] display_enable;
    always @(posedge clk) begin
        display_enable <= display_enable + 1;
        if (display_enable == 2'b11)
            display_enable <= 2'b00;
    end
    
    reg [3:0] in;
    always @(posedge clk) begin
        case(display_enable)
            2'b10: in = right_digit;
            2'b01: in = middle_digit;
            2'b00: in = left_digit;
            2'b11: in = (sign) ? 4'b1010 : 4'b0000;
            default: in = 4'b0000;
        endcase
    end

    seven_seg seg(display_enable, in, segments, anode_active);
  
endmodule

