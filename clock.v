module clock(output reg clk = 0);

    always begin
        #35 //clock frequency.
        clk = ~clk;
    end

endmodule