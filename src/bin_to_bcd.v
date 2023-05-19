module bin_to_bcd #(parameter W = 18) (
    input[14:0] in,
    output reg [19:0] bcd
    );

    integer i;
    always @(in) begin
        bcd = 20'b0;
        for (i = 14; i >= 0; i = i - 1) begin
            if (bcd[3:0] > 4) begin
                bcd[3:0] = bcd[3:0] + 3;
            end if (bcd[7:4] > 4) begin
                bcd[7:4] = bcd[7:4] + 3;
            end if (bcd[11:8] > 4) begin
                bcd[11:8] = bcd[11:8] + 3;
            end if (bcd[15:12] > 4) begin
                bcd[15:12] = bcd[15:12] + 3;
            end if (bcd[19:16] > 4) begin
                bcd[19:16] = bcd[19:16] + 3;
            end
            bcd = {bcd[18:0], in[i]};
        end
    end

endmodule