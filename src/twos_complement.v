module twos_complement(
    input [7:0] in,
    output [7:0] out);
        assign out = in[7] ? ~in + 1 : in ;
endmodule