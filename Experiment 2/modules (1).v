`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU
// Engineer: Aise Humeyra Boz & Muhammad Riza Fairuzzabadi | 070170364 . 150170908
// 
// Create Date: 16.03.2021 11:21:44
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
// Additional Comments:Uncomment the code before running each module
// 
//////////////////////////////////////////////////////////////////////////////////

//Uncomment the code before running each module

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

module NAND( //NAND Gate
    input wire A,
    input wire B,
    output wire C
     );
    assign C = ~(A & B);
endmodule
/*
module P1(  //Part1
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    output wire O);        
    NOT     not1(A, nota);  //'a
    NOT     not2(B, notb); //'b
    NOT     not3(C, notc); //'c
    NOT     not4(D, notd); //'d
    AND     and1(nota, notb, NANB); //a'b'
    AND     and2(A, notd, NDA); //ad'
    AND     and3(notc, B, BNC); //c'b
    AND     and31(BNC, D, BNCD); //bc'd
    OR      or10(NANB,NDA, o1); //a'b' + ad'
    OR      or11(o1, BNCD, O); //a'b' + ad' + bc'd
endmodule
*/
/*
module P2(  //Part2
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    output wire O);        
    NAND     not1(A,A, nota); //'a
    NAND     not2(B,B, notb); //'b
    NAND     not3(C,C, notc); //'c
    NAND     not4(D,D, notd); //'d
    NAND     nand1(nota, notb, NANDAB); //(a'b')'
    NAND     nand2(A, notd, NANDAND); //(ad')'
    NAND     nand3(notc, B, NANDBNC); //(bc')'
    NAND     nand31(NANDBNC, NANDBNC, notNANDBNC); //((bc')')' = bc'
    NAND     nand32(notNANDBNC, D, NANDBNCD); //(bc'd)'
    NAND     nandO1(NANDAB, NANDBNCD, o1);  //((a'b')'(bc'd)')' 
    NAND     nandO12(o1, o1, NANDo1); // (((a'b')'(bc'd)')')' = (a'b')'(bc'd)'
    NAND     nandO2(NANDo1, NANDAND, O); //(((a'b')'(bc'd)')(ad')')' = ((a'b')'(bc'd)')'+(ad') = a'b'+bc'd+ad'
endmodule
*/
/*
module MUX( //MUX Circuit (General)
    input wire I0,
    input wire I1, 
    input wire I2,
    input wire I3,
    input wire I4,
    input wire I5,
    input wire I6,
    input wire I7,
    input wire  A, 
    input wire  B, 
    input wire  C,  
    output wire O);  //Below is to assign which input is selected according to A, B, and C values.
    assign O = (I0 & ~A & ~B & ~C) | (I1 & ~A & ~B & C) | (I2 & ~A & B & ~C) | (I3 & ~A & B & C) | (I4 & A & ~B & ~C) | (I5 & A & ~B & C) | (I6 & A & B & ~C) | (I7 & A & B & C);
endmodule

module P3(  //Part3
    input wire  A,  
    input wire  B,  
    input wire  C,  
    input wire  D,
    output wire O);
    NOT   notd(D, NOTD); //'d
    MUX   mux(1,1,D,0,NOTD,NOTD,1,NOTD,A,B,C,O);    //Assign 1, 0 and D/'D values to the MUX inputs accordingly
endmodule
*/
/*
module DEC(   //Decoder Circuit (General)
    input wire A,
    input wire B,
    input wire C,
    output wire O0, //Decoder Outputs
    output wire O1,
    output wire O2,
    output wire O3,
    output wire O4,
    output wire O5, 
    output wire O6,
    output wire O7
);
    assign O0 = ~A & ~B &~C; //Assigns Decoder outputs according to A B C values
    assign O1 = ~A & ~B & C;
    assign O2 = ~A & B & ~C;
    assign O3 = ~A & B & C; 
    assign O4 = A & ~B & ~C;
    assign O5 = A & ~B & C; 
    assign O6 = A & B & ~C;
    assign O7 = A & B & C;
endmodule

module P4(
    input wire A,    
    input wire B,
    input wire C,
    output wire F2, //F2 Expression Output
    output wire F3  //F3 Exp. Output
);
    DEC     dec(A,B,C,O0,O1,O2,O3,O4,O5,O6,O7); //Calls DEC with ABC values, gets O1 - O7 values.
    OR      or1(O1, O3, OR1);   //a'b'c + a'bc = a'c
    OR      or12(OR1, O5, F2);  //abc' + a'c
    OR      or2(O3, O7, OR2);   //a'bc + abc = bc
    OR      or22(OR2, O4, F3);  //ab'c' + bc
endmodule
*/
