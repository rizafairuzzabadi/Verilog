`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU
// Engineer: Aise Humeyra Boz & Muhammad Riza Fairuzzabadi | 070170364 . 150170908
// 
// Create Date: 03/30/2021 06:00:27 PM
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

module AND( //AND Gate
    input wire A,
    input  wire B,
    output wire  C
    );
    assign C = A & B;
endmodule

module NOT( //NOT Gate
    input wire A,
    output wire B
    );
    assign B = ~A;
endmodule

module OR(  //OR Gate
    input wire A,
    input wire B,
    output wire C
     );
    assign C = A | B;
endmodule

module XOR( //XOR Gate
    input wire A, 
    input wire B, 
    output wire C 
    );
    assign C = (A &(~B))|((~A) & B);
endmodule

module XOR16( //XOR Gate
    input wire [15:0] A, 
    input wire [15:0] B,
    output wire [15:0] C 
    );
    assign C = A ^ B;
endmodule


module HalfAdder( //Half Adder
    input wire A, //A + B = S
    input wire B, 
    output wire S, 
    output wire Cout 
    );
    XOR     bir(A,B,S); //S=A^B
    AND     iki(A,B,Cout);  //Cout=A&B
endmodule


module FullAdder( //Full Adder
    input wire A, 
    input wire B, 
    input wire Cin,
    output wire S, 
    output wire Cout 
    );
    HalfAdder   Half1(A,B,O1,C1); //A+B=O1, C1
    HalfAdder   Half2(Cin,O1,S,C2);   //Cin+O1=S, C2
    OR          OR0(C1, C2, Cout); //C1|C2=Cout
endmodule

module FourBitFA( // 4-Bit Full Adder
    input wire [3:0] A, 
    input wire [3:0] B, 
    input wire Cin,
    output wire [3:0] S, 
    output wire Cout
    );
    wire C1,C2,C3;
    FullAdder   Full1(A[0],B[0],Cin,S[0],C1);//A[0]+B[0]=S[0], C1
    FullAdder   Full2(A[1],B[1],C1,S[1],C2); //A[1]+B[1]=S[1], C2
    FullAdder   Full3(A[2],B[2],C2,S[2],C3); //A[2]+B[2]=S[2], C3
    FullAdder   Full4(A[3],B[3],C3,S[3],Cout); //A[3]+B[3]=S[3], C4
endmodule

module SixteenBitFA( // 16-Bit Full Adder
    input wire [15:0] A, 
    input wire [15:0] B, 
    input wire Cin,
    output wire [15:0] S, 
    output wire Cout
    );
    wire C1,C2,C3;
    FourBitFA   Full1(A[3:0],B[3:0],Cin,S[3:0],C1); //A[3:0]+B[3:0] = S[3:0]
    FourBitFA   Full2(A[7:4],B[7:4],C1,S[7:4],C2); //A[7:4]+B[7:4] = S[3:0]
    FourBitFA   Full3(A[11:8],B[11:8],C2,S[11:8],C3); // A[11:8]+B[11:8] = S[3:0]
    FourBitFA   Full4(A[15:12],B[15:12],C3,S[15:12],Cout); //A[15:12]+B[15:12] = S[3:0]
endmodule

module AdderSubstractor( // 4-Bit Full Adder
    input wire [15:0] A, 
    input wire [15:0] B, 
    input wire Cin,
    input wire S,
    output wire [15:0] O, 
    output wire Cout,
    output wire overflag,   //overflow flag
    output wire borrowflag,     
    output wire validity     // check validity
    );    wire     C1,C2,C3;
    wire    [15:0] O1;
    genvar  i;
    for(i=0; i<16; i = i + 1) begin
        XOR   xor1(Cin, B[i], O1[i]);   
    end
    SixteenBitFA  FullA(A,O1,Cin,O,Cout);  //A + O1  = O 
    XOR     check1(Cout, O[15], ChO1);  //checking for overflow
    AND     check2(ChO1, S, overflag);
    NOT     not1(Cout, NCout);          //checking for borrow
    NOT     not2(S, NotS); 
    AND     and1(NCout, NotS, ChO2); 
    AND     and2(Cin, ChO2, borrowflag);
    OR      or0(overflag, borrowflag, ChO3);   //checking validity
    NOT     not3(ChO3, validity);
endmodule

module Part7(   //3A - 2B
    input wire [15:0] A, 
    input wire [15:0] B,
    input wire S,
    output wire [15:0] O, 
    output wire Cout,
    output wire overflag,   //overflow flag
    output wire borrowflag,     
    output wire validity  
);
    wire C3x1;
    wire [15:0] O3x1;
    wire [15:0] O3x;
    wire C2x;
    wire [15:0] O2x;

    SixteenBitFA        FullA1(A,A,0,O3x1,C3x1);   //3A
    SixteenBitFA        FullA2(O3x1,A,0,O3x,C3x);

    SixteenBitFA        FullB(B,B,0,O2x,C2x);    //2B
    AdderSubstractor    Subtr(O3x, O2x, 1, S, O, Cout, overflag, borrowflag, validity); //3A - 2B
endmodule
