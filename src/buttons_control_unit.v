`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2023 02:24:53 PM
// Design Name: 
// Module Name: buttons_control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module buttons_control_unit(
  input [19:0] bcd,
  input BTNR,
  input BTNL,
  input clk,
  output [3:0] right_digit,
  output [3:0] middle_digit,
  output [3:0] left_digit,
  output sa,
  output sb,
  output sc
);

reg [1:0] state;
reg [1:0] next;
parameter [1:0] A = 2'b00;
parameter [1:0] B = 2'b01;
parameter [1:0] C = 2'b10;

initial begin
  state = A;
end

always @(BTNR,BTNL) begin
  case (state)
    A: begin
      if (BTNL) begin
        next = B;
      end else begin 
        next = A;
      end
    end
    B: begin
      if (BTNR) begin
        next = A;
      end else if (BTNL) begin
        next = C;
      end else begin 
        next = B;
      end
       end
    C: begin
      if (BTNR) begin
        next = B;
      end else begin
        next = C;
      end
    end
  endcase
end

always @(posedge clk) begin
    state <= next;
end

assign right_digit = (state == A) ? bcd[3:0] : ( (state==B)? bcd[7:4] : bcd[11:8]); 
assign middle_digit = (state == A) ? bcd[7:4] : ( (state==B)? bcd[11:8] : bcd[15:12]); 
assign left_digit = (state == A) ? bcd[11:8] : ( (state==B)? bcd[15:12] : bcd[19:16]); 
assign sa = (state == A )? 1'b1 : 1'b0 ; 
assign sb = (state == B )? 1'b1 : 1'b0 ; 
assign sc = (state == C )? 1'b1 : 1'b0 ; 

endmodule