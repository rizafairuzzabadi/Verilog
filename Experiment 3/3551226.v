`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU
// Engineer: Aise Humeyra Boz & Muhammad Riza Fairuzzabadi | 070170364 . 150170908
// 
// Create Date: 03/30/2021 06:01:37 PM
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
module Sim1();  //Part 2
    reg     i1; //Input reg
    reg     i2;
    wire    o;
    wire    co;
    HalfAdder   uut(i1, i2, o, co);
    initial begin
        i1 = 0; i2 = 0; #50;
        i1 = 0; i2 = 1; #50;
        i1 = 1; i2 = 0; #50;
        i1 = 1; i2 = 1; #50;
     end
endmodule
*/
/*
module Sim2();     //Part 3 Sim
    reg     i1; //Input reg
    reg     i2;
    reg    cin;
    wire    o;
    wire    co;
    FullAdder   uut(i1, i2, cin, o, co);
    initial begin
        i1 = 0; i2 = 0; cin = 0; #50;
        i1 = 0; i2 = 1; cin = 0; #50;
        i1 = 1; i2 = 0; cin = 0; #50;
        i1 = 1; i2 = 1; cin = 0; #50;
        i1 = 0; i2 = 0; cin = 1; #50;
        i1 = 0; i2 = 1; cin = 1; #50;
        i1 = 1; i2 = 0; cin = 1; #50;
        i1 = 1; i2 = 1; cin = 1; #50;
     end
endmodule
*/
/*
module Sim3();  //Part 4
    reg   [3:0]  i1; //Input reg
    reg   [3:0]  i2;
    reg    cin;
    wire   [3:0] o;
    wire    co;
    FourBitFA   uut(i1, i2, cin, o, co);
    initial begin
        i1 = 4'd7;   i2 = 4'd1;   cin = 0;  #50;  //7+1, cin = 0
        i1 = 4'd2;   i2 = 4'd8;   cin = 0;  #50; //2+8, cin = 0
        i1 = 4'd2;   i2 = 4'd3;   cin = 0;  #50; //2+3, cin = 0
        i1 = 4'd14;  i2 = 4'd10;  cin = 0;  #50; //14+10, cin = 0
        i1 = 4'd10;  i2 = 4'd5;   cin = 0;  #50; //10+5, cin = 0
        i1 = 4'd15;  i2 = 4'd4;   cin = 0;  #50; //15+4, cin = 0
        i1 = 4'd6;   i2 = 4'd5;   cin = 0;  #50; //6+5, cin = 0
        i1 = 4'd8;   i2 = 4'd5;   cin = 0;  #50; //8+5, cin = 0
     end
endmodule*/
/*
module Sim4(); //Part 5
    reg   [15:0]  i1; //Input reg
    reg   [15:0]  i2;
    reg    cin;
    wire   [15:0] o;
    wire    co;
    SixteenBitFA   uut(i1, i2, cin, o, co);
    initial begin
        i1 = 16'd29;      i2 = 16'd3;     cin = 0;  #50; //29+3, cin = 0
        i1 = 16'd21;      i2 = 16'd83;    cin = 0;  #50; //21+83, cin = 0
        i1 = 16'd16800;   i2 = 16'd16900; cin = 0;  #50; //16800+16900, cin = 0
        i1 = 16'd65534;   i2 = 16'd65100; cin = 0;  #50; //65534+65100, cin=0
        i1 = 16'd202;     i2 = 16'd97;    cin = 0;  #50; //202+97, cin = 0
        i1 = 16'd44;      i2 = 16'd19;    cin = 0;  #50; //44+19, cin = 0
        i1 = 16'd644;     i2 = 16'd255;   cin = 0;  #50; //644+255, cin=0
        i1 = 16'd86;      i2 = 16'd572;   cin = 0;  #50; //86+572, cin = 0
     end
endmodule*/
/*
module Sim5();  //part6
    reg   [15:0]  i1; //Input reg
    reg   [15:0]  i2;
    reg    cin;
    reg    S;
    wire   [15:0] o;
    wire Cout;
    wire overflag;  //overflow flag
    wire borrowflag;     
    wire validity;   // check validity
    AdderSubstractor uut(i1, i2, cin, S, o, Cout, overflag, borrowflag, validity);
    initial begin
        i1 = 16'd29;      i2 = 16'd3;     cin = 1;   S=0;    #50;  //29-3, S=0
        i1 = 16'd21;      i2 = 16'd83;    cin = 0;   S=0;    #50;  //21+83, S=0
        i1 = 16'd16800;   i2 = 16'd16900; cin = 0;   S=1;    #50;  //16800+16900,S=1
        i1 = 16'd103;     i2 = 16'd145;   cin = 1;   S=0;    #50;  //103-145, S=0
        i1 = 16'd202;     i2 = 16'd97;    cin = 0;   S=0;    #50;  //202+97, S=0
        i1 = 16'd32400;   i2 = 16'd32200; cin = 0;   S=1;    #50;  //32400+32200, S=1
        i1 = 16'd6478;    i2 = 16'd2585;  cin = 1;   S=0;    #50;  //6478-2585, S=0
        i1 = 16'd8 ;      i2 = 16'd52;    cin = 1;   S=0;    #50;  //8-52, S=0
     end
endmodule
*/

module Part7Sim();
    reg   [15:0]  i1; //Input reg
    reg   [15:0]  i2;
    reg    S;
    wire  [15:0] o;
    wire Cout;
    wire overflag;  //overflow flag
    wire borrowflag;     
    wire validity;   // check validity
    Part7    uut(i1, i2, S, o, Cout, overflag, borrowflag, validity);
    initial begin
        i1 = 16'd3105;      i2 = 16'd11275;    S=0;    #50; //3*3105-2*11275, S=0
        i1 = 16'd21;        i2 = 16'd83;       S=0;    #50;  //3*21-2*83, S=0
        i1 = 16'd24;        i2 = 16'd32;       S=0;    #50;  //3*24-2*32, S=0
        i1 = 16'd16386;     i2 = 16'd353;      S=0;    #50;  //3*16386-2*353, S=0
        i1 = 16'd202;       i2 = 16'd97;       S=0;    #50;  //3*202-2*97, S=0
        i1 = 16'd44;        i2 = 16'd9;        S=0;    #50;  //3*44-2*9, S=0
        i1 = 16'd64;        i2 = 16'd65535;    S=0;    #50;  //3*64-2*65535, S=0
        i1 = 16'd8 ;        i2 = 16'd52;       S=0;    #50;  //3*8-2*52, S=0
        i1 = 16'd3105;      i2 = 16'd11275;    S=1;    #50;  //3*3105-2*11275, S=1
        i1 = 16'd21;        i2 = 16'd83;       S=1;    #50;  //3*21-2*83, S=1
        i1 = 16'd24;        i2 = 16'd32;       S=1;    #50;  //3*24-2*32, S=1
        i1 = 16'd16386;     i2 = 16'd353;      S=1;    #50;  //3*16386-2*353, S=1
        i1 = 16'd202;       i2 = 16'd97;       S=1;    #50;  //3*202-2*97, S=1
        i1 = 16'd44;        i2 = 16'd9;        S=1;    #50;  //3*44-2*9, S=1
        i1 = 16'd64;        i2 = 16'd65535;    S=1;    #50;  //3*64-2*65535, S=1
        i1 = 16'd8 ;        i2 = 16'd52;       S=1;    #50;  //3*8-2*52, S=1
     end
endmodule

