module ctrl_unit(
  input BTNC,
  input z_flag_multiplicand,
  input lsb_multiplicand,
  input clk,
  output shift_en,
  output reg_en,
  output load,
  output psel,
  output led
);

reg [1:0] state;
reg [1:0] next;
parameter [1:0] A = 2'b00;
parameter [1:0] B = 2'b01;
parameter [1:0] C = 2'b10;
parameter [1:0] D = 2'b11;

initial begin
  state = A;
end

always @(*) begin
  case (state)
    A: begin
      if (BTNC) begin
        next <= B;
      end else begin
        next <= A;
      end
    end
    B: begin
      if (BTNC) begin
        next <= B;
      end else begin
        next <= C;
      end
    end
    C: begin
      if (BTNC) begin
        next <= B;
      end else if (z_flag_multiplicand) begin
        next <= D;
      end else begin
        next <= C;
      end
    end
    D: begin
      if (BTNC) begin
        next <= B;
      end else begin
        next <= D;
      end
    end
  endcase
end

always @(posedge clk) begin
    state <= next;
end

assign shift_en = (state == C) ? 1'b1 : 1'b0 ; 
assign reg_en = (state == C || state == B) ? 1'b1 : 1'b0 ; 
assign load = (state == B) ? 1'b1 : 1'b0 ; 
assign psel = (state == C || state == D) ? 1'b1 : 1'b0 ; 
assign led = (state == D) ? 1'b1 : 1'b0 ; 

endmodule