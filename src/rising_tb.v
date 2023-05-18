module rising_edge_tb();
    reg clk, rst, lvl;
    wire tck;
    rising_edge_detector DUT(clk, rst, lvl, tck);
    reg [0:15] pattern = 16'b0100111101111100;
    integer i;
    initial begin
        clk = 1;
    forever #25 clk=~clk;
    end
    initial begin
        lvl=0; rst=1;
    #25
        rst=0;
    for ( i = 0; i <= 15; i = i + 1 ) begin
        #50 lvl = pattern[i];
    end
end
endmodule