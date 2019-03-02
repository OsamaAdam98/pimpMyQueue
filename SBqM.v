`include "clock.v"

module SBqM(
    input a,
    input b,
    input reset,
    input reg[1:0] tCount,
    output reg[2:0] pCount,
    output reg emptyFlag,
    output reg fullFlag);

wire clk;
reg emptyOverFlow, fullOverFlow;
reg inputA, inputB;
reg[4:0] wTime;

clock pulse(clk);

initial begin
    pCount <= 0;
    fullFlag <= 0;
    emptyFlag <= 1;
    emptyOverFlow <= 0;
    fullOverFlow <= 0;
end

always@(posedge clk) begin

    inputA <= a;
    inputB <= b;

end

always@(negedge clk) begin

    wTime = (3*(pCount + (tCount - 1))/tCount);

    if(pCount == 0) begin
        emptyFlag <= 1;
    end
    if(pCount == 7) begin
        fullFlag <= 1;
    end

    if(reset) begin
        fullFlag <= 0;
        pCount <= 0;
        emptyFlag <= 1;
    end

end

always@(negedge inputA) begin
    
    if(pCount < 7) begin
        pCount = pCount + 1;
    end
    else if(pCount > 7) begin
        fullOverFlow <= 1;
    end

end

always@(negedge clk) begin

    if(pCount < 7 && pCount > 0)begin
        emptyFlag <= 0;
        fullFlag <= 0;
    end

end

always@(negedge inputB) begin

    if(pCount) begin
        pCount = pCount - 1;
    end
    else if(pCount < 0) begin
        emptyOverFlow <= 1;
    end

end


endmodule