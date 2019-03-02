module lut(
    input[2:0] pCount,
    input[1:0] tCount,
    input clk,
    output reg[4:0] wTime);

parameter wTime10 = 5'd00;
parameter wTime11 = 5'd03;
parameter wTime12 = 5'd06;
parameter wTime13 = 5'd09;
parameter wTime14 = 5'd12;
parameter wTime15 = 5'd15;
parameter wTime16 = 5'd18;
parameter wTime17 = 5'd21;
parameter wTime20 = 5'd00;
parameter wTime21 = 5'd03;
parameter wTime22 = 5'd04;
parameter wTime23 = 5'd06;
parameter wTime24 = 5'd04;
parameter wTime25 = 5'd09;
parameter wTime26 = 5'd10;
parameter wTime27 = 5'd12;
parameter wTime30 = 5'd00;
parameter wTime31 = 5'd03;
parameter wTime32 = 5'd04;
parameter wTime33 = 5'd05;
parameter wTime34 = 5'd06;
parameter wTime35 = 5'd07;
parameter wTime36 = 5'd08;
parameter wTime37 = 5'd09;

reg[4:0] rom [23:0];
reg[4:0] index;

initial begin

    rom[0] = wTime10;
    rom[1] = wTime11;
    rom[2] = wTime12;
    rom[3] = wTime13;
    rom[4] = wTime14;
    rom[5] = wTime15;
    rom[6] = wTime16;
    rom[7] = wTime17;
    rom[8] = wTime20;
    rom[9] = wTime21;
    rom[10] = wTime22;
    rom[11] = wTime23;
    rom[12] = wTime24;
    rom[13] = wTime25;
    rom[14] = wTime26;
    rom[15] = wTime27;
    rom[16] = wTime30;
    rom[17] = wTime31;
    rom[18] = wTime32;
    rom[19] = wTime33;
    rom[20] = wTime34;
    rom[21] = wTime35;
    rom[22] = wTime36;
    rom[23] = wTime37;

end

always@(negedge clk) begin

    index = {(tCount - 1), pCount}; //unapologetically stolen
    wTime = rom[index];

end

endmodule