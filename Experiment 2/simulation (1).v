`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU
// Engineer: Aise Humeyra Boz & Muhammad Riza Fairuzzabadi | 070170364 . 150170908
// 
// Create Date: 16.03.2021 11:24:20
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
// Additional Comments:Uncomment the code before running each module
// 
//////////////////////////////////////////////////////////////////////////////////

//Uncomment the code before running each module

/*
module Part1();
    reg     i1; //Input reg
    reg     i2;
    reg     i3;
    reg     i4;
    wire    o;
    P1  uut(i1, i2, i3, i4, o); //Calls/Instantiates P1 Module
    initial begin
        i1 = 0;   i2 = 0;   i3 = 0; i4 = 0; #50; //Assign every possible 0/1 to inputs
        i1 = 0;   i2 = 0;   i3 = 0; i4 = 1; #50;
        i1 = 0;   i2 = 0;   i3 = 1; i4 = 0; #50;
        i1 = 0;   i2 = 0;   i3 = 1; i4 = 1; #50;
        i1 = 0;   i2 = 1;   i3 = 0; i4 = 0; #50;
        i1 = 0;   i2 = 1;   i3 = 0; i4 = 1; #50;
        i1 = 0;   i2 = 1;   i3 = 1; i4 = 0; #50;
        i1 = 0;   i2 = 1;   i3 = 1; i4 = 1; #50;
        i1 = 1;   i2 = 0;   i3 = 0; i4 = 0; #50;
        i1 = 1;   i2 = 0;   i3 = 0; i4 = 1; #50;
        i1 = 1;   i2 = 0;   i3 = 1; i4 = 0; #50;
        i1 = 1;   i2 = 0;   i3 = 1; i4 = 1; #50;
        i1 = 1;   i2 = 1;   i3 = 0; i4 = 0; #50;
        i1 = 1;   i2 = 1;   i3 = 0; i4 = 1; #50;
        i1 = 1;   i2 = 1;   i3 = 1; i4 = 0; #50;
        i1 = 1;   i2 = 1;   i3 = 1; i4 = 1; #50;
    end
endmodule
*/
/*
module Part2();
    reg     i1; //Input reg
    reg     i2;
    reg     i3;
    reg     i4;
    wire    o;
    P2  uut(i1, i2, i3, i4, o); //Calls/Instantiates P2 Module
    initial begin
        i1 = 0;   i2 = 0;   i3 = 0; i4 = 0; #50; //Assign every possible 0/1 to inputs
        i1 = 0;   i2 = 0;   i3 = 0; i4 = 1; #50;
        i1 = 0;   i2 = 0;   i3 = 1; i4 = 0; #50;
        i1 = 0;   i2 = 0;   i3 = 1; i4 = 1; #50;
        i1 = 0;   i2 = 1;   i3 = 0; i4 = 0; #50;
        i1 = 0;   i2 = 1;   i3 = 0; i4 = 1; #50;
        i1 = 0;   i2 = 1;   i3 = 1; i4 = 0; #50;
        i1 = 0;   i2 = 1;   i3 = 1; i4 = 1; #50;
        i1 = 1;   i2 = 0;   i3 = 0; i4 = 0; #50;
        i1 = 1;   i2 = 0;   i3 = 0; i4 = 1; #50;
        i1 = 1;   i2 = 0;   i3 = 1; i4 = 0; #50;
        i1 = 1;   i2 = 0;   i3 = 1; i4 = 1; #50;
        i1 = 1;   i2 = 1;   i3 = 0; i4 = 0; #50;
        i1 = 1;   i2 = 1;   i3 = 0; i4 = 1; #50;
        i1 = 1;   i2 = 1;   i3 = 1; i4 = 0; #50;
        i1 = 1;   i2 = 1;   i3 = 1; i4 = 1; #50;
    end
endmodule*/
/*
module Part3();
    reg     i1; //Input reg
    reg     i2;
    reg     i3;
    reg     i4;
    wire    o;
    P3  uut(i1, i2, i3, i4, o); //Calls/Instantiates P3 Module
    initial begin
        i1 = 0;   i2 = 0;   i3 = 0; i4 = 0; #50; //Assign every possible 0/1 to inputs
        i1 = 0;   i2 = 0;   i3 = 0; i4 = 1; #50;
        i1 = 0;   i2 = 0;   i3 = 1; i4 = 0; #50;
        i1 = 0;   i2 = 0;   i3 = 1; i4 = 1; #50;
        i1 = 0;   i2 = 1;   i3 = 0; i4 = 0; #50;
        i1 = 0;   i2 = 1;   i3 = 0; i4 = 1; #50;
        i1 = 0;   i2 = 1;   i3 = 1; i4 = 0; #50;
        i1 = 0;   i2 = 1;   i3 = 1; i4 = 1; #50;
        i1 = 1;   i2 = 0;   i3 = 0; i4 = 0; #50;
        i1 = 1;   i2 = 0;   i3 = 0; i4 = 1; #50;
        i1 = 1;   i2 = 0;   i3 = 1; i4 = 0; #50;
        i1 = 1;   i2 = 0;   i3 = 1; i4 = 1; #50;
        i1 = 1;   i2 = 1;   i3 = 0; i4 = 0; #50;
        i1 = 1;   i2 = 1;   i3 = 0; i4 = 1; #50;
        i1 = 1;   i2 = 1;   i3 = 1; i4 = 0; #50;
        i1 = 1;   i2 = 1;   i3 = 1; i4 = 1; #50;
    end
endmodule*/
/*
module Part4();
    reg     i1; //Input reg
    reg     i2;
    reg     i3;
    wire    F2;
    wire    F3;
    P4  uut(i1, i2, i3, F2, F3); //Calls/Instantiates P3 Module
    initial begin
        i1 = 0;   i2 = 0; i3 = 0;  #50; //Assign every possible 0/1 to inputs
        i1 = 0;   i2 = 0; i3 = 1;  #50;
        i1 = 0;   i2 = 1; i3 = 0;  #50;
        i1 = 0;   i2 = 1; i3 = 1;  #50;
        i1 = 1;   i2 = 0; i3 = 0;  #50;
        i1 = 1;   i2 = 0; i3 = 1;  #50;
        i1 = 1;   i2 = 1; i3 = 0;  #50;
        i1 = 1;   i2 = 1; i3 = 1;  #50;
    end
endmodule

*/