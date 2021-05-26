`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Part1();
    reg     i1;
    reg     i2;
    wire    o;
    F1  uut(i1, i2, o);
    initial begin
        i1 = 1;   i2 = 0;   #50;
        i1 = 1;   i2 = 1;   #50;
        i1 = 0;   i2 = 0;   #50;
        i1 = 0;   i2 = 1;   #50;
    end
    
endmodule

/*
module Part2();
    reg     i1;
    reg     i2;
    wire    o;
    F2  uut(i1, i2, o);
    initial begin
        i1 = 1;   i2 = 0;   #50;
        i1 = 1;   i2 = 1;   #50;
        i1 = 0;   i2 = 0;   #50;
        i1 = 0;   i2 = 1;   #50;
    end
    
endmodule*/
/*
module Part3();
    reg     i1;
    reg     i2;
    reg     i3;
    reg     i4;
    wire    o1;
    wire    o2;
    F1  uut(i1, i2, o1);
    F3  abc(i3, i4, o2);
    initial begin
        i1 = 1;   i2 = 0;   #200;
        i1 = 1;   i2 = 1;   #200;
        i1 = 0;   i2 = 0;   #200;
        i1 = 0;   i2 = 1;   #200;
    end
    initial begin
        i3 = 1;   i4 = 0;   #200;
        i3 = 1;   i4 = 1;   #200;
        i3 = 0;   i4 = 0;   #200;
        i3 = 0;   i4 = 1;   #200;
   end 
endmodule*/
/*
module Part4();
    reg     i1;
    reg     i2;
    reg     i3;
    wire    o;
    
    F4  uut(i1, i2, i3, o);
    initial begin
        i1 = 0;   i2 = 0; i3 = 0;  #50;
        i1 = 0;   i2 = 0; i3 = 1;  #50;
        i1 = 0;   i2 = 1; i3 = 0;  #50;
        i1 = 0;   i2 = 1; i3 = 1;  #50;
        i1 = 1;   i2 = 0; i3 = 0;  #50;
        i1 = 1;   i2 = 0; i3 = 1;  #50;
        i1 = 1;   i2 = 1; i3 = 0;  #50;
        i1 = 1;   i2 = 1; i3 = 1;  #50;
    end
endmodule*/
/*
module Part5();
    reg     i1;
    reg     i2;
    reg     i3;
    reg     i4;
    wire    o;
    F5  uut(i1, i2, i3, i4, o);
    initial begin
        i3 = 1;   i4 = 0;   #100;
        i3 = 1;   i4 = 1;   #100;
        i3 = 0;   i4 = 0;   #100;
        i3 = 0;   i4 = 1;   #100;
    end
    
endmodule*/

