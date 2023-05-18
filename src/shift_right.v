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