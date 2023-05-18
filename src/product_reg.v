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