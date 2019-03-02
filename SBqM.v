`include "clock.v"
`include "lut.v"

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
wire[4:0] wTime;

clock pulse(clk);
lut theRom(pCount, tCount, clk, wTime);

initial begin
    pCount <= 0;
    fullFlag <= 0;
    emptyFlag <= 1;
    emptyOverFlow <= 0;
    fullOverFlow <= 0;
    //wTime <=0;
end

always@(posedge clk) begin

    inputA <= a;
    inputB <= b;

end

always@(negedge clk) begin


    if(pCount == 0) begin
        emptyFlag <= 1;
        $display("The queue is empty.");
    end
    if(pCount == 7) begin
        fullFlag <= 1;
        $display("The queue is full.");
    end


    if(pCount < 7 && pCount > 0)begin
        emptyFlag <= 0;
        fullFlag <= 0;
    end

end

always@(negedge inputA) begin
    
    if(pCount < 7) begin
        pCount = pCount + 1;
    end
    else if(pCount > 7) begin
        fullOverFlow <= 1;
        $display("There are more than 7 people in the queue.");
    end
/*
    if(!pCount) begin
        wTime = 0;
    end
    else begin
        wTime = (3*(pCount + (tCount - 1))/tCount);
    end
*/
end


always@(negedge inputB) begin

    if(pCount) begin
        pCount = pCount - 1;
    end
    else if(pCount < 0) begin
        emptyOverFlow <= 1;
        $display("Error, somehow there is a negative number of people in the queue, please restart.");
    end
/*
    if(!pCount) begin
        wTime = 0;
    end
    else begin
        wTime = (3*(pCount + (tCount - 1))/tCount);
    end
*/
end

always@(posedge reset) begin
    
    fullFlag <= 0;
    pCount <= 0;
    emptyFlag <= 1;
    //wTime <= 0;
    $display("The reset button has been hit.");
    
end


endmodule