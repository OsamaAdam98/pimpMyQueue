module clock(output reg clk = 0);

    always begin
        #100 //clock frequency.
        clk = ~clk;
    end

endmodule