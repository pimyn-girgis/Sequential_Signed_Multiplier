/*******************************************************************************
File: shift_left.v
Authors: Bemen Girgis & Ziad Hassan
Description: This module takes in an 8-bit number and left shifts it by 1 bit on
             every clock cycle.
License: GPLv2 (see LICENSE file)
******************************************************************************/

module shift_left(
  input [7:0] in,
  output reg [14:0] out,
  input clk,
  input en,
  input load
  );

  always @(posedge clk) begin
    if (load) begin
      out <= in;
    end else if (en) begin
      out <= {out[13:0], 1'b0};
      end
  end
endmodule
