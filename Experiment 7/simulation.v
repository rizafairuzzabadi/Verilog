`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 08:33:54 PM
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
module decoderSim();
   reg [3:0]   In;
   wire [15:0] Out; 
   reg EN;
   
   Decoder4_16  uut(In,Out,EN);
   initial begin
        In = 4'd0; EN = 1; #50;
        In = 4'd1; EN = 0; #50;
        In = 4'd2; EN = 1; #50;
        In = 4'd3; EN = 0; #50;
        In = 4'd4; EN = 1; #50;
        In = 4'd5; EN = 0; #50;
        In = 4'd6; EN = 1; #50;
        In = 4'd7; EN = 0; #50;
        In = 4'd8; EN = 1; #50;
        In = 4'd9; EN = 0; #50;
        In = 4'd10; EN = 1; #50;
        In = 4'd11; EN = 0; #50;
        In = 4'd12; EN = 1; #50;
        In = 4'd13; EN = 0; #50;
        In = 4'd14; EN = 1; #50;
        In = 4'd15; EN = 0; #50;
   end
endmodule

module Register1Sim();
    reg linesel;
    reg clk;
    reg rst;
    reg [15:0] in;
    wire [15:0] stored;
    
    Register_16bit  uut(linesel,clk,rst,in,stored);
   
    always #10 clk = ~clk;

   
    initial begin
        clk = 0;
        linesel = 1; rst = 0; in = 16'd12; #50;
        linesel = 0; rst = 0; in = 16'd12; #50;
        linesel = 1; rst = 1; in = 16'd70; #50;
        linesel = 1; rst = 1; in = 16'd40; #50;
        linesel = 0; rst = 0; in = 16'd70; #50;
    end
endmodule
*/
/*
module RegisterPart2Sim();
    reg [3:0] selA;
    reg [3:0] selB;
    reg [3:0] selWrite;
    reg [15:0] dataIn;
    reg reset;
    reg writeEn;
    reg clk;
    wire [15:0] dataA;
    wire [15:0] dataB;
    
    Register_Part2  uut(selA, selB, selWrite, dataIn, reset, writeEn, clk, dataA, dataB);
   
    always #5 clk = ~clk;

   
    initial begin
        clk = 0;
        selA = 4'd0; selB = 4'd1; selWrite = 4'd1; dataIn = 16'd24; reset = 0; writeEn = 1; #50;
        selA = 4'd0; selB = 4'd1; selWrite = 4'd0; dataIn = 16'd34; reset = 1; writeEn = 1; #50;
        
        selA = 4'd0; selB = 4'd1; selWrite = 4'd1; dataIn = 16'd1; reset = 1; writeEn = 0; #50;
        selA = 4'd0; selB = 4'd1; selWrite = 4'd0; dataIn = 16'd1; reset = 1; writeEn = 0; #50; 
               
        selA = 4'd3; selB = 4'd4; selWrite = 4'd3; dataIn = 16'd17; reset = 1; writeEn = 1; #50;
        selA = 4'd4; selB = 4'd3; selWrite = 4'd4; dataIn = 16'd24; reset = 1; writeEn = 1; #50;
        
        selA = 4'd3; selB = 4'd4; selWrite = 4'd3; dataIn = 16'd17; reset = 1; writeEn = 0; #50;
        selA = 4'd3; selB = 4'd4; selWrite = 4'd4; dataIn = 16'd17; reset = 1; writeEn = 1; #50;
        selA = 4'd4; selB = 4'd3; selWrite = 4'd4; dataIn = 16'd24; reset = 1; writeEn = 0; #50;
        
        selA = 4'd3; selB = 4'd1; selWrite = 4'd1; dataIn = 16'd24; reset = 0; writeEn = 1; #50;
    end
endmodule
*/
module ALUsim();
reg [2:0] op; 
reg [7:0] srca;
reg [7:0] srcb;
reg clk;
reg rst;
wire [7:0] dst;
wire zflag;
ALU      uut(op,srca,srcb,clk,rst,dst,zflag);

always #5 clk = ~clk;

initial begin
    clk = 0;
    op=3'b000; srca=8'd3; srcb=8'd2; rst=0; #50;
    op=3'b001; srca=8'd4; srcb=8'd5; rst=1; #50;
    op=3'b010; srca=8'd1; srcb=8'd2; rst=1; #50;
    op=3'b011; srca=8'd3; srcb=8'd3; rst=1; #50;
    op=3'b100; srca=8'd5; srcb=8'd6; rst=1; #50;
    op=3'b101; srca=8'd1; srcb=8'd3; rst=1; #50;
    op=3'b110; srca=8'd5; srcb=8'd4; rst=1; #50;
    op=3'b111; srca=8'd1; srcb=8'd2; rst=1; #50;
    op=3'b010; srca=8'd6; srcb=8'd2; rst=0; #50;
end
endmodule


