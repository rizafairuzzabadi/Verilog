`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 15017090 Muhammad Riza Fairuzzabadi & 070170364 Aişe Hümeyra Boz
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

/*
module SRLatch(
    input wire S,
    input wire R,
    output wire Q, Q_neg
    );
    assign Q = ~(~S & Q_neg); // Q = (S' & Q_neg)'
    assign Q_neg = ~(Q & ~R); // Q_neg = (Q & R')'
endmodule

module SRLatchEn(
    input wire S, 
    input wire E,
    input wire R,
    output wire Q,
    output wire Q_neg
);
    assign Qi1 = ~(S & E); // Qi1 = (S & E)'
    assign Qi2 = ~(E & R); // Qi2 = (E & R)'
    assign Q = ~(Qi1 & Q_neg); // Q = (Qi1 & Q_neg)'
    assign Q_neg = ~(Qi2 & Q); // Q_neg = (Qi2 & Q)'
endmodule
*/
/*
module DLatch(
    input wire D, 
    input wire E, 
    output wire Q,
    output wire Q_neg
);
    assign Qi1 = ~(D & E); // Qi1 = (D & E)'
    assign Qi2 = ~(~D & E); // Qi2 = (D' & E)'
    assign Q = ~(Qi1 & Q_neg); // Q = (Qi1 & Q_neg)'
    assign Q_neg = ~(Qi2 & Q); // Q_neg = (Qi2 & Q)'
endmodule

module DFlipFlop(
    input wire D, 
    input wire CLK,
    output wire Q,
    output wire Q_neg
);
    DLatch  bir(D, ~CLK, O1, O1_neg); 
    DLatch  iki(O1, CLK, Q, Q_neg);
endmodule
 */
