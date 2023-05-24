/*******************************************************************************
File: shift_right.v
Authors: Bemen Girgis & Ziad Hassan
Description: This module takes in an 8-bit number and right shifts it by 1 bit on
             every clock cycle.
License: GPLv2 (see LICENSE file)
******************************************************************************/

module shift_right(
  input [7:0] in,
  output reg [7:0] out,
  input clk,
  input en,
  input load
  );

  always @(posedge clk) begin
    if (load) begin
      out <= in;
    end else if (en) begin
      out <= {1'b0, out[7:1]};
    end
  end
endmodule
