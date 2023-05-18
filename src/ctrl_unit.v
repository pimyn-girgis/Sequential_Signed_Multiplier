module ctrl_unit(
  input BTNC,
  input z_flag_multiplicand,
  input lsb_multiplicand,
  input clk,
  output reg is_multiplying,
  output reg shift_en,
  output reg reg_en,
  output reg load,
  output reg psel,
  output reg led
);

reg [1:0] state;
reg [1:0] next;
parameter [1:0] A = 2'b00;
parameter [1:0] B = 2'b01;
parameter [1:0] C = 2'b10;
parameter [1:0] D = 2'b11;

initial begin
  state = A;
  is_multiplying = 1'b0;
  shift_en = 1'b0;
  reg_en = 1'b0;
  load = 1'b0;
  psel = 1'b0;
  led = 1'b0;
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
      end else if (z_flag_multiplicand) begin
        next <= D;
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

always @(posedge clk) begin
  case (next)
    A: begin
      is_multiplying <= 1'b0;
      shift_en <= 1'b0;
      reg_en <= 1'b0;
      load <= 1'b0;
      psel <= 1'b0;
      led <= 1'b0;
    end
    B: begin
      is_multiplying <= 1'b1;
      shift_en <= 1'b0;
      reg_en <= 1'b1;
      load <= 1'b1;
      psel <= 1'b0;
      led <= 1'b0;
    end
    C: begin
      is_multiplying <= 1'b1;
      shift_en <= 1'b1;
      reg_en <= 1'b1;
      load <= 1'b0;
      psel <= 1'b1;
      led <= 1'b0;
    end
    D: begin
      is_multiplying <= 1'b0;
      shift_en <= 1'b0;
      reg_en <= 1'b0;
      load <= 1'b0;
      psel <= 1'b0;
      led <= 1'b1;
    end
  endcase
end

endmodule