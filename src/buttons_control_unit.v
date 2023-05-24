/*******************************************************************************
File: buttons_control_unit.v
Authors: Ziad Hassan & Bemen Girgis
Description: This module is the control unit for the buttons. It takes in the
             20-bit BCD number and outputs the 3 digits to be displayed on the
             7-segment display.
License: GPLv2 (see LICENSE file)
******************************************************************************/

`timescale 1ns / 1ps

module buttons_control_unit(
  input [19:0] bcd,
  input BTNR,
  input BTNL,
  input clk,
  output [3:0] right_digit,
  output [3:0] middle_digit,
  output [3:0] left_digit
);

reg [1:0] state;
reg [1:0] next;
parameter [1:0] A = 2'b00;
parameter [1:0] B = 2'b01;
parameter [1:0] C = 2'b10;

initial begin
  state = A;
end

always @(BTNR,BTNL) begin
  case (state)
    A: begin
      if (BTNL) begin
        next = B;
      end else begin 
        next = A;
      end
    end
    B: begin
      if (BTNR) begin
        next = A;
      end else if (BTNL) begin
        next = C;
      end else begin 
        next = B;
      end
       end
    C: begin
      if (BTNR) begin
        next = B;
      end else begin
        next = C;
      end
    end
  endcase
end

always @(posedge clk) begin
    state <= next;
end

assign right_digit = (state == A) ? bcd[3:0] : ( (state==B)? bcd[7:4] : bcd[11:8]); 
assign middle_digit = (state == A) ? bcd[7:4] : ( (state==B)? bcd[11:8] : bcd[15:12]); 
assign left_digit = (state == A) ? bcd[11:8] : ( (state==B)? bcd[15:12] : bcd[19:16]); 
assign sa = (state == A )? 1'b1 : 1'b0 ; 
assign sb = (state == B )? 1'b1 : 1'b0 ; 
assign sc = (state == C )? 1'b1 : 1'b0 ; 

endmodule
