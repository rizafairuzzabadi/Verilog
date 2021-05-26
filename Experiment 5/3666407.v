`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU
// Engineer: 15017090 Muhammad Riza Fairuzzabadi & 070170364 Ai?e Hümeyra Boz
// 
// Create Date: 04/14/2021 04:05:15 PM
// Design Name: 
// Module Name: module
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


module DLatch(
    input wire D, 
    input wire E, 
    input wire RST,
    output wire Q,
    output wire Q_neg
);
    assign Qi1 = ~(D & E); // Qi1 = (D & E)'
    assign Qi2 = ~(~D & E); // Qi2 = (D' & E)'
    assign Qres = ~(Qi1 & Q_neg); // Q = (Qi1 & Q_neg)'
    assign Q = Qres & ~RST; 
    assign Q_neg = ~(Qi2 & Q); // Q_neg = (Qi2 & Q)'
endmodule

module DFlipFlop(
    input wire D, 
    input wire CLK,
    input wire RST,
    output wire Q,
    output wire Q_neg
);
    DLatch  bir(D, ~CLK, RST, O1, O1_neg); 
    DLatch  iki(O1, CLK, RST, Q, Q_neg);
endmodule

module TFlipFlop(
    input wire T, 
    input wire CLK,
    input wire RST,
    output wire Q,
    output wire Q_neg
);
    DFlipFlop   bir((T^Q), CLK, RST, Q, Q_neg);
endmodule

module JKFlipFlop(
    input wire J, 
    input wire K,
    input wire CLK,
    input wire RST,
    output wire Q,
    output wire Q_neg
);
    wire a; 
    wire b;
    assign a = Q_neg & J; 
    assign b = Q & ~K;
    TFlipFlop   bir((a|b), CLK, RST, Q, Q_neg);
endmodule

module part1(
    input wire a,
    input wire b,
    input wire clk,
    input wire rst,
    output wire z
);
    wire nand1;
    wire or1;
    wire J; 
    wire K; 
    wire T;
    wire Q0;
    wire Q0_neg;
    wire Q1;
    wire Q1_neg;
    wire ando;
    assign nand1 = ~(a & b);
    assign or1  = a | b;
    assign J = nand1 | Q0;
    assign K = nand1 | Q1_neg;
    assign T = or1 & Q1_neg;
    TFlipFlop   tfp(T, clk, rst, Q0, Q0_neg);
    JKFlipFlop  jkfp(J,K,clk, rst, Q1, Q1_neg);
    assign ando = nand1 & Q0_neg;
    assign z = ando | Q1_neg;
endmodule

module counter(
    input [15:0] data,
    input load, 
    input clk, 
    input direction, 
    input [3:0] mentvalue,
    input clear,
    output [15:0] O
);
    reg [15:0] counter;
    always @(posedge clk)
    begin
        if(load == 1)begin
            if(direction)begin
                counter <= counter + mentvalue;
            end
            else begin
                counter <= counter - mentvalue;
            end
        end
        if(load == 0)begin 
            counter <= data; 
        end  
        if(clear == 0)begin
            counter <= 16'd0;
        end
    end
    assign O = counter;
endmodule


module count_0to40(
        input clk,
        input initiate,
        output [15:0] O
    );
    reg [15:0] ctr;
    reg clear = 1;
    reg load = 1;
    always @(posedge clk) 
    begin
        if(O == 36)begin
            clear <= 0;
        end
        else begin
            load <= 1;
            clear <= 1;
        end
    end 
    always @(posedge clk)
    begin
        if(!initiate)begin
            load <= 0;
            ctr  <= 0;
        end
        else begin
            load <= 1;
            ctr  <= O;
        end
    end
    always @(posedge clk) 
    begin
        if(clear == 0)begin
            load <= 0;
            ctr  <= 0;
        end
    end
    counter count(ctr, load, clk, 1, 4'd2, 1, O);
endmodule

module count_350to371(
        input clk,
        input initiate,
        output [15:0] O
    );
    reg [15:0] ctr;
    reg clear = 1;
    reg load = 1;
    always @(posedge clk) 
    begin
        if(O == 365)begin
            clear <= 0;
        end
        else begin
            load <= 1;
            clear <= 1;
        end
    end 
    always @(posedge clk)
    begin
        if(!initiate)begin
            load <= 0;
            ctr  <= 350;
        end
        else begin
            load <= 1;
            ctr  <= O;
        end
    end
    always @(posedge clk) 
    begin
        if(clear == 0)begin
            load <= 0;
            ctr  <= 350;
        end
    end
    counter count(ctr, load, clk, 1, 4'd3, 1, O);
endmodule

module count_93to5(
        input clk,
        input initiate,
        output [15:0] O
    );
    reg [15:0] ctr;
    reg clear = 1;
    reg load = 1;
    always @(posedge clk) 
    begin
        if(O == 13)begin
            clear <= 0;
        end
        else begin
            load <= 1;
            clear <= 1;
        end
    end 
    always @(posedge clk)
    begin
        if(!initiate)begin
            load <= 0;
            ctr  <= 93;
        end
        else begin
            load <= 1;
            ctr  <= O;
        end
    end
    always @(posedge clk) 
    begin
        if(clear == 0)begin
            load <= 0;
            ctr  <= 93;
        end
    end
    counter count(ctr, load, clk, 0, 4'd4, 1, O);
endmodule

module count_22525to22535(
        input clk,
        input initiate,
        output [15:0] O
    );
    reg [15:0] ctr;
    reg clear = 1;
    reg load = 1;
    always @(posedge clk) 
    begin
        if(O == 22533)begin
            clear <= 0;
        end
        else begin
            load <= 1;
            clear <= 1;
        end
    end 
    always @(posedge clk)
    begin
        if(!initiate)begin
            load <= 0;
            ctr  <= 22525;
        end
        else begin
            load <= 1;
            ctr  <= O;
        end
    end
    always @(posedge clk) 
    begin
        if(clear == 0)begin
            load <= 0;
            ctr  <= 22525;
        end
    end
    counter count(ctr, load, clk, 1, 4'd1, 1, O);
endmodule
