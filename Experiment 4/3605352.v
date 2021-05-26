`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 09:24:39 PM
// Design Name: 
// Module Name: simulation
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
module SRLatchSim ();
    reg    i1;
    reg    i2;
    wire   Q;
    wire   Q_neg;
    SRLatch     uut(i1, i2, Q, Q_neg);
    initial begin 
        i1 = 0; i2 = 0; #50;
        i1 = 0; i2 = 1; #50;
        i1 = 1; i2 = 0; #50;
        i1 = 1; i2 = 1; #50;
        i1 = 0; i2 = 0; #50;
        i1 = 0; i2 = 1; #50;
        i1 = 1; i2 = 0; #50;
        i1 = 1; i2 = 1; #50;
    end
endmodule


module SRLatchEnSim ();
    reg    i1;
    reg    i2;
    reg    e;
    wire   Q;
    wire   Q_neg;
    SRLatchEn     uut(i1, i2, e, Q, Q_neg);
    initial begin 
        i1 = 0; i2 = 0; e = 1; #50;
        i1 = 1; i2 = 1; #50;
        i1 = 0; i2 = 1; #50;
        i1 = 1; i2 = 0; #50;
        i1 = 1; i2 = 1; #50;
        i1 = 0; i2 = 0; e = 0; #50;
        i1 = 1; i2 = 1; #50;
        i1 = 0; i2 = 1; #50;
        i1 = 1; i2 = 0; #50;
        i1 = 1; i2 = 1; #50;
    end
endmodule
*/
/*
module DFlipFlopSim ();
    reg    i1;
    reg    clk;
    wire   Q;
    wire   Q_neg;
    DFlipFlop   uut(i1, clk, Q, Q_neg);
    initial begin 
        i1 = 0; clk = 0; #50;   //reset to 0
        i1 = 0; clk = 1; #50;
        i1 = 0; clk = 0; #50;   

        i1 = 1; clk = 0; #50;   //set to 1
        i1 = 1; clk = 1; #50; 
        i1 = 1; clk = 0; #50;          
        
        i1 = 0; clk = 0; #50;  //reset to 0
        i1 = 0; clk = 1; #50;
        i1 = 0; clk = 0; #50;  
    end
endmodule
*/