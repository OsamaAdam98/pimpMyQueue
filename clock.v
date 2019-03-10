module clock(output reg clk = 0);

    always begin
        #45 //clock frequency.
        clk = ~clk;
    end

endmodule