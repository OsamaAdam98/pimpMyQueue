module clock(output reg clk = 0);

    always begin
        #100
        clk = ~clk;
    end

endmodule