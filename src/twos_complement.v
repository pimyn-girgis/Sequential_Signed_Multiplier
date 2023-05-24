/*******************************************************************************
File: twos_complement.v
Authors: Ziad Hassan & Bemen Girgis
Description: This module takes in an 8-bit number and outputs its two's comple-
             ment.
License: GPLv2 (see LICENSE file)
******************************************************************************/

module twos_complement(
    input [7:0] in,
    output [7:0] out);
        assign out = in[7] ? ~in + 1 : in ;
endmodule
