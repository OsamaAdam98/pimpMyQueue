module clock(output reg clk = 0);

    always begin
        #30 //clock frequency.
        clk = ~clk;
    end

endmodule