`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU
// Engineer: Ai?e Hümeyra Boz & Muhammad R?za Fa?ruzzabad?
// 070170364 | 150170908
// 
// Create Date: 04/06/2021 09:24:04 PM
// Design Name: 
// Module Name: modules
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module NAND( //NAND Gate
    input wire A,
    input wire B,
    output wire C
     );
    assign C = ~(A & B);
endmodule

module SRLatch( //SR Latch
    input wire S,   
    input wire R,
    output wire Q, Q_neg
    );
    NAND    out1(~S, Q_neg, Q); // Q = (S' & Q_neg)'
    NAND    out2(Q,~R, Q_neg); // Q_neg = (Q & R')'
    
endmodule

module SRLatchEn(   //SR Latch with EN
    input wire S, 
    input wire E,
    input wire R,
    output wire Q,
    output wire Q_neg
);
    NAND    sub1(S , E, Qi1); // Qi1 = (S & E)'
    NAND    sub2(E , R, Qi2);  // Qi2 = (E & R)'
    NAND    out1(Qi1 , Q_neg, Q); // Q = (Qi1 & Q_neg)'
    NAND    out2(Qi2 , Q, Q_neg); // Q_neg = (Qi2 & Q)'
endmodule


module DLatch(
    input wire D, 
    input wire E, 
    output wire Q,
    output wire Q_neg
);
    NAND    sub1(D , E, Qi1); // Qi1 = (D & E)'
    NAND    sub2(~D , E, Qi2); // Qi2 = (D' & E)'
    NAND    out1(Qi1 , Q_neg, Q); // Q = (Qi1 & Q_neg)'
    NAND    out2(Qi2 , Q, Q_neg); // Q_neg = (Qi2 & Q)'
endmodule

module DFlipFlop(
    input wire D, 
    input wire CLK,
    output wire Q,
    output wire Q_neg
);
    DLatch  out1(D, ~CLK, O1, O1_neg);
    DLatch  out2(O1, CLK, Q, Q_neg);
endmodule
