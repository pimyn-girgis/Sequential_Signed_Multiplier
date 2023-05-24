/*******************************************************************************
File: product_reg.v
Authors: Bemen Girgis & Ziad Hassan
Description: This module simulates a register that takes in a 14-bit number and
             outputs it on the next clock cycle.
License: GPLv2 (see LICENSE file)
******************************************************************************/

module product_reg(
   input [13:0] in, 
   input clk,
   input en,
   output reg [13:0] out
);
    always @(posedge clk) begin
        if(en)
            out <= in;
    end
endmodule
