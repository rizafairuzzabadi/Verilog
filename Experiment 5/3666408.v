`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU
// Engineer: 15017090 Muhammad Riza Fairuzzabadi & 070170364 Ai?e Hümeyra Boz
// 
// Create Date: 04/14/2021 04:14:16 PM
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


module TFlipFlopSim ();
    reg    i1;
    reg    clk;
    reg    set;
    wire   Q;
    wire   Q_neg;
    TFlipFlop   uut(i1, clk, set, Q, Q_neg);
    
    always #10 clk = ~clk;
    
    initial begin 
        clk = 1; set = 1; #20; 
        i1 = 0; set = 1;  #20;  
        i1 = 0; set = 0;  #20;  

        i1 = 1; set = 0;  #20;   
        i1 = 1; set = 0;  #20; 
        
        i1 = 0; set = 0; #20;  
        i1 = 0; set = 0;  #20;  
        
        i1 = 1; set = 0;  #20;   
        i1 = 1; set = 0;  #20;   
    end
endmodule


module JKFlipFlopSim ();
    reg    j;
    reg    k;
    reg    clk;
    reg    set;
    wire   Q;
    wire   Q_neg;
    JKFlipFlop   uut(j, k, clk, set, Q, Q_neg);
    
    always #10 clk = ~clk;
    
    initial begin 
        clk = 1; set = 1; #20; 
        j = 0; k = 0; set = 1; #20;
        j = 0; k = 0; set = 0; #20;

        j = 0; k = 1; set = 0; #20;
        j = 0; k = 1; set = 0; #20;
        
        j = 1; k = 0; set = 0; #20;
        j = 1; k = 0; set = 0; #20;
        
        j = 1; k = 1; set = 0; #20;
        j = 1; k = 1; set = 0; #20;
    end
endmodule

module part1sim();
    reg a;
    reg b;
    reg clk;
    reg set;
    wire z;
    part1   uut(a,b,clk,set,z);
    always #10 clk = ~clk;

        initial begin 
        clk = 1; set = 1; #20; 
        a = 0; b = 0; set = 1; #20;
        a = 0; b = 0; set = 0; #20;

        a = 0; b = 1; set = 0; #20;
        a = 0; b = 1; set = 0; #20;
        
        a = 1; b = 0; set = 0; #20;
        a = 1; b = 0; set = 0; #20;
        
        a = 1; b = 1; set = 0; #20;
        a = 1; b = 1; set = 0; #20;
    end
endmodule

module  countersim();
    reg [15:0] data; 
    reg load;
    reg clock; 
    reg direction;
    reg [3:0] value;
    reg clear;
    wire [15:0] O;
    
    counter    uut(data,load,clock,direction,value,clear,O);
    
    always #10 clock = ~clock;
    initial begin
    clock = 0;
    data = 16'd100; load = 0; direction = 1; value = 0; clear = 1;  #50; 
    data = 16'd100; load = 0; direction = 1; value = 0; clear = 1;  #50;
    
    data = 16'd100; load = 1; direction = 1; value = 4'd2; clear = 1;  #50;
    data = 16'd100; load = 1; direction = 1; value = 4'd2; clear = 1;  #50;
    
    data = 16'd100; load = 1; direction = 0; value = 4'd6; clear = 1;  #50;
    data = 16'd100; load = 1; direction = 0; value = 4'd6; clear = 1;  #50;
    
    data = 16'd100; load = 1; direction = 1; value = 4'd0; clear = 0;  #50; 
    data = 16'd100; load = 1; direction = 1; value = 4'd0; clear = 0;  #50;
    
    data = 16'd47; load = 0; direction = 1; value = 0; clear = 1;  #50; 
    data = 16'd47; load = 0; direction = 1; value = 0; clear = 1; #50;
    end
    
endmodule

module part4();
    reg clk;
    reg initiate;
    wire [15:0] o;
    
    count_0to40 uut(clk, initiate,o);
    //count_350to371 uut(clk, initiate,o);
    //count_93to5 uut(clk, initiate,o);
    //count_22525to22535 uut(clk, initiate,o);
    always #5 clk = ~clk;
    
    initial begin
    clk = 0;
    initiate = 0; #20;
    initiate = 1; #300;
    initiate = 0; #20;
    initiate = 1; #300;
    end
endmodule

    
