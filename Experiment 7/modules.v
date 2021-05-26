`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aise Humeyra Boz & Muhammad Riza Fairuzzabadi
// 
// Create Date: 05/05/2021 03:34:52 PM
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
module ProgramMemory(
    input wire[7:0] address,
    output reg[15:0] instruction
    );
    //Declaration of the ROM area
    reg [15:0] ROM_Data [0:255];
    //Read ROM data from the file
    initial $readmemh("ROM.mem", ROM_Data);
    //Read the selected data from ROM
    always @(*) begin
        instruction <= ROM_Data[address];
    end
endmodule
*/
module Decoder4_16(         //part1decoder
   input [3:0]   In,
   output [15:0] Out, 
   input wire Enable
);
    assign Out =    (In == 4'b0000 && Enable) ? 16'b0000_0000_0000_0001 :
                    (In == 4'b0001 && Enable) ? 16'b0000_0000_0000_0010 :
                    (In == 4'b0010 && Enable) ? 16'b0000_0000_0000_0100 :
                    (In == 4'b0011 && Enable) ? 16'b0000_0000_0000_1000 :
                    (In == 4'b0100 && Enable) ? 16'b0000_0000_0001_0000 :
                    (In == 4'b0101 && Enable) ? 16'b0000_0000_0010_0000 :
                    (In == 4'b0110 && Enable) ? 16'b0000_0000_0100_0000 :
                    (In == 4'b0111 && Enable) ? 16'b0000_0000_1000_0000 : 
                    (In == 4'b1000 && Enable) ? 16'b0000_0001_0000_0000 :
                    (In == 4'b1001 && Enable) ? 16'b0000_0010_0000_0000 :
                    (In == 4'b1010 && Enable) ? 16'b0000_0100_0000_0000 :
                    (In == 4'b1011 && Enable) ? 16'b0000_1000_0000_0000 :
                    (In == 4'b1100 && Enable) ? 16'b0001_0000_0000_0000 :
                    (In == 4'b1101 && Enable) ? 16'b0010_0000_0000_0000 :
                    (In == 4'b1110 && Enable) ? 16'b0100_0000_0000_0000 :
                    (In == 4'b1111 && Enable) ? 16'b1000_0000_0000_0000 : 16'b0000_0000_0000_0000;
endmodule

module Register_16bit(lineselect, clock, reset, dataIn,storedata);
    input lineselect;
    input clock;
    input reset;
    input [15:0] dataIn;
    output [15:0] storedata;
    reg [15:0] temp;

    always @(posedge clock)       //rising edge of the clock signal, store operation
    begin
        if(lineselect == 1) begin    //store the data value
            temp <= dataIn;
        end
    end  
    always @(negedge reset)     //falling edge of the reset signal, reset
    begin
        temp <= 16'd0;
    end
    assign storedata = temp;
endmodule

module Register_Part2(selA, selB, selWrite, dataIn, reset, writen, clock, dataA, dataB);
    input [3:0] selA;
    input [3:0] selB;
    input [3:0] selWrite;
    input [15:0] dataIn;
    input reset;
    input writen;
    input clock;
    output [15:0] dataA;
    output [15:0] dataB;
        
    wire [15:0] aradata [15:0];
    wire [15:0] dcd;
    
    Decoder4_16     decode3(selWrite, dcd,1);

    Register_16bit  line1(dcd == 16'b0000_0000_0000_0001 && writen, clock, reset, dataIn, aradata[0]);
    Register_16bit  line2(dcd == 16'b0000_0000_0000_0010 && writen, clock, reset, dataIn, aradata[1]);
    Register_16bit  line3(dcd == 16'b0000_0000_0000_0100 && writen, clock, reset, dataIn, aradata[2]);
    Register_16bit  line4(dcd == 16'b0000_0000_0000_1000 && writen, clock, reset, dataIn, aradata[3]);
    Register_16bit  line5(dcd == 16'b0000_0000_0001_0000 && writen, clock, reset, dataIn, aradata[4]);
    Register_16bit  line6(dcd == 16'b0000_0000_0010_0000 && writen, clock, reset, dataIn, aradata[5]);
    Register_16bit  line7(dcd == 16'b0000_0000_0100_0000 && writen, clock, reset, dataIn, aradata[6]);
    Register_16bit  line8(dcd == 16'b0000_0000_1000_0000 && writen, clock, reset, dataIn, aradata[7]);
    Register_16bit  line9(dcd == 16'b0000_0001_0000_0000 && writen, clock, reset, dataIn, aradata[8]);
    Register_16bit  line10(dcd == 16'b0000_0010_0000_0000 && writen, clock, reset, dataIn, aradata[9]);
    Register_16bit  line11(dcd == 16'b0000_0100_0000_0000 && writen, clock, reset, dataIn, aradata[10]);
    Register_16bit  line12(dcd == 16'b0000_1000_0000_0000 && writen, clock, reset, dataIn, aradata[11]);
    Register_16bit  line13(dcd == 16'b0001_0000_0000_0000 && writen, clock, reset, dataIn, aradata[12]);
    Register_16bit  line14(dcd == 16'b0010_0000_0000_0000 && writen, clock, reset, dataIn, aradata[13]);
    Register_16bit  line15(dcd == 16'b0100_0000_0000_0000 && writen, clock, reset, dataIn, aradata[14]);
    Register_16bit  line16(dcd == 16'b1000_0000_0000_0000 && writen, clock, reset, dataIn, aradata[15]);
    
    assign dataA = aradata[selA];
    assign dataB = aradata[selB];

endmodule

module ALU(
    input [2:0] Op,
    input [7:0] srcA,
    input [7:0] srcB,
    input clock,
    input reset,
    output reg [7:0] dst,
    output Zeroflag
    );
    reg temp = 0;   //For storing zeroflag value
    reg flag = 0;   //to determine if the operation updates the zeroflag 
    always @(posedge clock)
    begin
        case(Op)
            3'b000: begin
               dst = srcA & srcB;
            end
            3'b001: begin
                dst = srcA | srcB;
            end
            3'b010: begin
                dst = srcA + srcB;
                flag <= 1;
            end
            3'b011: begin
                dst = srcA - srcB;
                flag <= 1;
            end
            3'b100: begin
                dst = srcA ^ srcB;
            end
            3'b101: begin
                dst = srcA >> srcB;
            end
            3'b110: begin
                dst = srcA << srcB;
            end
            3'b111: begin
                dst = srcB;
            end
        endcase
        if(dst == 8'd0 && flag == 1)begin   //zeroflag
            temp <= 1;
        end
        else begin
            temp <= 0;
        end
    end
    always @(negedge reset) 
    begin
        temp <= 0;
    end
    assign Zeroflag = temp;
endmodule





