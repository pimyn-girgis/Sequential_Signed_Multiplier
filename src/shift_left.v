module shift_left(
  input [7:0] in,
  output reg [13:0] out,
  input clk,
  input en,
  input load
  );

  always @(posedge clk) begin
    if (load) begin
      out <= in;
    end else if (en) begin
      out <= {out[12:0], 1'b0};
      end
  end
endmodule