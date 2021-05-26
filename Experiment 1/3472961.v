`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AND(
    input  A,
    input  B,
    output  C
    );
    assign C = A & B;
endmodule

module NOT(
    input  A,
    output  B
    );
    assign B = ~A;
endmodule

module OR(
    input  A,
    input  B,
    output  C
     );
    assign C = A | B;
endmodule


module F1(
    input A,
    input B,
    output a);           
    AND     bir(A, B, AB); 
    OR      iki(A, AB, a);
endmodule

/*
module F2(
    input A,
    input B,
    output a);
    
    OR      bir(A, B, o1);
    NOT     iki(B, o2);
    OR      uc(A, o2, o3);        
    AND     dort(o1, o3, a); 
   
endmodule*/
/*
module F3(
    input A,
    input B,
    output a);
    
    OR     bir(A, B, AB);
    AND    iki(AB, A, a);        
    
endmodule
*/
/*
module F4(
    input A,
    input B,
    input C,
    output O);
    
    NOT    not1(A, nota);
    NOT    not2(B, notb);
    NOT    not3(C, notc);
    OR     bir(nota, notb, o1);
    OR     iki(A, notc, o2);  
    AND    uc(o1, o2, O);   
    
endmodule*/
/*
module F5(
    input A,
    input B,
    input C,
    input D,
    output O);
    
    NOT    not1(C, notc);
    NOT    not2(D, notd);
    AND    bir(C, notd, O1);
    AND    iki(D, notc, O2);
    OR     uc(O1, O2, O);
    
endmodule*/
