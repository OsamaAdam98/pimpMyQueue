`include "parameters.vh"

module lut(
    input[2:0] pCount,
    input[1:0] tCount,
    input clk,
    output reg[4:0] wTime);

reg[4:0] rom [23:0];
reg[4:0] index;

initial begin

    rom[0] = `wTime10;
    rom[1] = `wTime11;
    rom[2] = `wTime12;
    rom[3] = `wTime13;
    rom[4] = `wTime14;
    rom[5] = `wTime15;
    rom[6] = `wTime16;
    rom[7] = `wTime17;
    rom[8] = `wTime20;
    rom[9] = `wTime21;
    rom[10] = `wTime22;
    rom[11] = `wTime23;
    rom[12] = `wTime24;
    rom[13] = `wTime25;
    rom[14] = `wTime26;
    rom[15] = `wTime27;
    rom[16] = `wTime30;
    rom[17] = `wTime31;
    rom[18] = `wTime32;
    rom[19] = `wTime33;
    rom[20] = `wTime34;
    rom[21] = `wTime35;
    rom[22] = `wTime36;
    rom[23] = `wTime37;

end

always@(negedge clk) begin
    //first two bits are the tCount-1
    //last three bits are the pCount
    //put together, for example, if the tCount = 1
    //and the pCount = 3
    //then index = 00 011 = 3
    //this line may or may not had been stolen :)
    index = {(tCount - 1), pCount};
    wTime = rom[index];

end

endmodule