`include "SBqM.v"

module testBench();

reg front, back;
wire eFlag, fFlag;
wire[2:0] perCount;
initial begin
    front = 1;
    back = 1;
end

always begin
    if(perCount < 7) begin
        #500
        back = ~back;
    end
    else begin
        #500
        front = ~front;
    end
end

SBqM testSBqM(/*a*/back, /*b*/front, /*reset*/0, /*tCount*/1, /*pCount*/perCount, /*emptyFlag*/eFlag, /*fullFlag*/fFlag);

endmodule