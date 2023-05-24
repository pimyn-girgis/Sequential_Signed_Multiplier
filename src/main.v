/*******************************************************************************
File: main.v
Authors: Bemen Girgis & Ziad Hassan
Description: This module is the top level module. It essentially connects all
             the modules together to create a functioning multiplier.
License: GPLv2 (see LICENSE file)
******************************************************************************/

module main(
  input signal_in,
  input left_button_in,
  input right_button_in,
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
    wire [19:0] bcd;
    wire [14:0] product;
    wire load;
    wire BTNC, BTNR, BTNL;
    wire sign;
    wire [3:0] right_digit ,middle_digit, left_digit;
    
    clk_div clkdiv_btnc(.clk_in(sys_clk), .clk_out(clk));
    push_button_detector multiply_pressed(.clk(clk), .in(signal_in), .rst(rst), .out(BTNC));
    push_button_detector right_pressed(.clk(clk), .in(right_button_in), .rst(rst), .out(BTNR));
    push_button_detector left_pressed(.clk(clk), .in(left_button_in), .rst(rst), .out(BTNL));
    ctrl_unit cu(.BTNC(BTNC),.z_flag_multiplier(zflag),.clk(sys_clk), .shift_en(shift_en), .reg_en(reg_en), .load(load), .psel(psel), .led(led));
    signed_multiplier sm(.multiplier(multiplier), .multiplicand(multiplicand), .clk(sys_clk), .shift_en(shift_en), .reg_en(reg_en), .load(load), .psel(psel), .product(product), .sign(sign), .zflag(zflag));
    bin_to_bcd binary_bcd(.in(product),.bcd(bcd));
    buttons_control_unit bcu(.bcd(bcd),.BTNR(BTNR),.BTNL(BTNL),.clk(clk),.right_digit(right_digit),.middle_digit(middle_digit),.left_digit(left_digit));
    
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
            2'b11: in = (sign) ? 4'b1010 : 4'b1011;
            default: in = 4'b0000;
        endcase
    end

    seven_seg seg(.en(display_enable), .num(in), .segments(segments), .anode_active(anode_active));
  
endmodule

