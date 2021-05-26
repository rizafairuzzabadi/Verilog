`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU
// Engineer: Aise Humeyra Boz & Muhammad Riza Fairuzzabadi
// 
// Create Date: 04/27/2021 11:28:40 PM
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

module threstsim(); //3-state buffer
    reg    i;        
    reg    en;
    wire   out;
    threstbuffer   uut(i, en, out);
    
    initial begin 
        i = 0;  en = 0; #50;
        i = 1;  en = 0; #50;
        i = 0;  en = 1; #50;
        i = 1;  en = 1; #50;
    end
endmodule

module part1sim();
    reg [7:0] d1;
    reg [7:0] d2;
    reg sel;
    wire [7:0] Out;
    part1   uut(d1, d2, sel, Out);
    initial begin 
        d1 = 8'd12; d2 = 8'd14; sel = 0; #50;
        d1 = 8'd12; d2 = 8'd14; sel = 1; #50;
        d1 = 8'd12; d2 = 8'd14; sel = 0; #50;
        d1 = 8'd12; d2 = 8'd14; sel = 1; #50;
    end
endmodule

module part2sim();
    reg [7:0] d1;
    reg [7:0] d2;
    reg sel;
    wire [7:0] Out1;
    wire [7:0] Out2;
    part2   uut(d1, d2, sel, Out1, Out2);
    initial begin 
        d1 = 8'd12; d2 = 8'd14; sel = 0; #50;
        d1 = 8'd12; d2 = 8'd14; sel = 1; #50;
        d1 = 8'd12; d2 = 8'd14; sel = 0; #50;
        d1 = 8'd12; d2 = 8'd14; sel = 1; #50;
    end
endmodule

*/
module part3sim();
    reg [7:0] i;    
    reg res;
    reg linesel;
    reg readen;
    reg writen;
    reg clk;
    wire [7:0] out;
    
    part3   uut(i,  res, linesel, readen, writen, clk, out);
    
    always #10 clk = ~clk;
    
    initial begin 
        clk = 0;
        i = 8'd12; res = 1; linesel = 0; readen = 0; writen = 0;  #50;
        i = 8'd12; res = 1; linesel = 1; readen = 0; writen = 0;  #50;
        i = 8'd12; res = 1; linesel = 1; readen = 0; writen = 1;  #50;
        i = 8'd12; res = 1; linesel = 1; readen = 1; writen = 1;  #50;
        i = 8'd12; res = 0; linesel = 1; readen = 1; writen = 0;  #50;
        i = 8'd15; res = 1; linesel = 1; readen = 0; writen = 1;  #50;
        i = 8'd14; res = 1; linesel = 1; readen = 1; writen = 0;  #50;
        i = 8'd15; res = 1; linesel = 1; readen = 1; writen = 1;  #50;
        i = 8'd15; res = 0; linesel = 1; readen = 0; writen = 0;  #50;
        i = 8'd15; res = 1; linesel = 1; readen = 1; writen = 0;  #50;
    end
endmodule

/*
module part4sim();
    reg [7:0] data;
    reg [2:0] adr;
    reg chsl;
    reg reset;
    reg readen;
    reg writen;
    reg clk;
    wire [7:0] out;
    
    part4   uut(data, adr, chsl, reset, readen, writen, clk, out);
    
    always #5 clk = ~clk;
    
    initial begin 
        clk = 1;
        data = 8'd10; adr = 3'd7; chsl = 0 ; reset = 1; readen = 0; writen = 1; #45;
        data = 8'd11; adr = 3'd1; chsl = 1;  reset = 1; readen = 1; writen = 1; #50;
        data = 8'd12; adr = 3'd2; chsl = 1;  reset = 1; readen = 0; writen = 1; #50;
        data = 8'd13; adr = 3'd3; chsl = 1; reset = 1; readen = 1; writen = 1; #50;
        data = 8'd14; adr = 3'd4; chsl = 1; reset = 1; readen = 1; writen = 1; #50;
        data = 8'd15; adr = 3'd5; chsl = 1; reset = 1; readen = 1; writen = 1; #50;
        data = 8'd16; adr = 3'd6; chsl = 1; reset = 1; readen = 1; writen = 1; #50;
        data = 8'd17; adr = 3'd7; chsl = 1; reset = 1; readen = 1; writen = 1; #50;
        
        data = 8'd1; adr = 3'd1; chsl = 1; reset = 1; readen = 1; writen = 0; #50;
        data = 8'd1; adr = 3'd3; chsl = 1; reset = 1; readen = 1; writen = 0; #50;
        data = 8'd1; adr = 3'd5; chsl = 1; reset = 1; readen = 1; writen = 0; #50;
        data = 8'd1; adr = 3'd7; chsl = 1; reset = 1; readen = 1; writen = 0; #50;
        
        data = 8'd1; adr = 3'd0; chsl = 1; reset = 0; readen = 1; writen = 0; #50;
        
    end
endmodule


module part5sim();
    reg [7:0] dI;
    reg [4:0] adr;
    reg res;
    reg readen;
    reg writen;
    reg clk;
    wire [7:0] out;
    
    part5   uut(dI, adr, res, readen, writen, clk, out);
    
    always #5 clk = ~clk;
    
    initial begin 
        clk = 0;
        dI = 8'd0;  adr = 5'd0;  res = 1; readen = 1; writen = 1; #10;    //rise the res before falling edge
        dI = 8'd0;  adr = 5'd0;  res = 0; readen = 1; writen = 1; #50;    //reset all lines
        dI = 8'd25; adr = 5'd30; res = 1; readen = 1; writen = 1; #50;   //Write 25 to Address 30
        dI = 8'd15; adr = 5'd20; res = 1; readen = 0; writen = 1; #50;   //Write 15 to Address 20
        dI = 8'd0;  adr = 5'd12; res = 1; readen = 1; writen = 0; #50;   // Read Address 12
        dI = 8'd18; adr = 5'd10; res = 1; readen = 1; writen = 1; #50;   //Write 18 to Address 10
        dI = 8'd3;  adr = 5'd15; res = 1; readen = 1; writen = 0; #50;   //Read Address 15
        dI = 8'd4;  adr = 5'd30; res = 1; readen = 1; writen = 0; #50;   //Read Address 30
        dI = 8'd5;  adr = 5'd10; res = 1; readen = 1; writen = 0; #50;   //Read Address 10
    end
endmodule


module part6sim();
    reg [31:0] data;
    reg [4:0] adress;
    reg reset;
    reg readen;
    reg writen;
    reg clk;
    wire [31:0] Output;
    
    part6   uut(data, adress, reset, readen, writen, clk, Output);
    
    always #5 clk = ~clk;
    
    initial begin 
        clk = 0;
        data = 32'd34;  adress = 5'd1; reset = 1; readen = 1; writen = 1; # 50;
        data = 32'd45;  adress = 5'd2; reset = 1; readen = 1; writen = 1; # 50;
        data = 32'd120; adress = 5'd3; reset = 1; readen = 1; writen = 1; # 50;
        data = 32'd1;   adress = 5'd2; reset = 1; readen = 1; writen = 0; # 50;
        data = 32'd1;   adress = 5'd1; reset = 1; readen = 1; writen = 0; # 50;
        data = 32'd78;  adress = 5'd8; reset = 1; readen = 1; writen = 1; # 50;
        data = 32'd78;  adress = 5'd3; reset = 1; readen = 0; writen = 0; # 50;
        data = 32'd1;   adress = 5'd8; reset = 1; readen = 1; writen = 0; # 50;
        data = 32'd1;   adress = 5'd1; reset = 0; readen = 1; writen = 0; # 50;
        
    end
endmodule
*/