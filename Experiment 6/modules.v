`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU
// Engineer: Aise Humeyra Boz & Muhammad Riza Fairuzzabadi
// 
// Create Date: 04/27/2021 11:28:22 PM
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


module threstbuffer(            //3-state buffer
    input   wire [7:0] in,
    input   wire en,
    output  wire [7:0] o
);                  
    assign o = en? in : 8'bz;   //output = if enable == 1 then in OR Z high impd.
endmodule   
/*
module part1(                   //Part 1 Circuit
    input  wire [7:0] data1,      
    input  wire [7:0] data2,
    input  wire select,
    output wire [7:0] Output
);                                                  //above module is instantiated
    threstbuffer   busa(data1,~select,Output);      //NOT done using operator
    threstbuffer   busb(data2,select,Output);       
    //assign Output = select ? o1 : 8'bZ;           //direct alternative
    //assign Output = select ? o2 : 8'bZ;
endmodule

module part2(                   //Part 2, 2 driver 2 readers 8-bit data bus
    input  wire [7:0] data1,    
    input  wire [7:0] data2,
    input  wire select,
    output wire [7:0] Output1,
    output wire [7:0] Output2
);
    wire [7:0] aradata;                         //aradata : 8-bit middle bus
    part1          bus1(data1,data2,select,aradata);   //first part, done by part 1 module
    threstbuffer   busa(aradata,~select,Output1); //second part, done manually with 3-state bf. 
    threstbuffer   busb(aradata,select,Output2);
endmodule
*/
module part3(   //8bit Memory Line Module
    input  wire [7:0] data,
    input  wire reset,
    input  wire linesel,            //enable
    input  wire readen,             //read en
    input  wire writen,             //write enable
    input  clk,
    output wire [7:0] Output
);
    reg    [7:0] temp;
    //wire   [7:0] aradata;
    assign outen = readen && linesel;   //output = outen? output : Z
    always @(posedge clk)       //rising edge of the clock signal, store operation
    begin
        if(writen && linesel == 1) begin    //store the data value
            temp <= data;
        end
    end  
    always @(negedge reset)     //falling edge of the reset signal, reset
    begin
        temp <= 8'd0;
    end
    //threstbuffer buous(temp, 1, aradata);       //to enable reset even if read is 0.
    threstbuffer buout(temp,outen,Output);  //1 3-state buffer instantiation
endmodule

/*
module part4(               //8-Byte Memory Module
    input [7:0] data,
    input [2:0] adress,     //8 Adress Combination
    input chipsel,
    input reset,
    input readen,
    input writen,
    input clk,
    output [7:0] Output
);
    wire selc; 
    threstbuffer   buo1(1, chipsel, selc);
    threstbuffer   buo2(0, ~chipsel, selc);
                                      //adress XOR di == 0 to determine which adress
    part3          bus1b(data, reset, (adress ^ 3'd0) == 3'd0 && selc, readen, writen, clk, Output);
    part3          bus2b(data, reset, (adress ^ 3'd1) == 3'd0 && selc, readen, writen, clk, Output);
    part3          bus3b(data, reset, (adress ^ 3'd2) == 3'd0 && selc, readen, writen, clk, Output);
    part3          bus4b(data, reset, (adress ^ 3'd3) == 3'd0 && selc, readen, writen, clk, Output);
    part3          bus5b(data, reset, (adress ^ 3'd4) == 3'd0 && selc, readen, writen, clk, Output);
    part3          bus6b(data, reset, (adress ^ 3'd5) == 3'd0 && selc, readen, writen, clk, Output);
    part3          bus7b(data, reset, (adress ^ 3'd6) == 3'd0 && selc, readen, writen, clk, Output);
    part3          bus8b(data, reset, (adress ^ 3'd7) == 3'd0 && selc, readen, writen, clk, Output);   
endmodule                           

module part5(       //32 byte memory module
    input [7:0] data,
    input [4:0] adress, //MS 2 bit -> chipsel  LS 3 bit -> part4_adress
    input reset,
    input readen,
    input writen,
    input clk,
    output [7:0] Output
);                                          //adress XNOR di == 11 to determine which adress
    part4          bus5a(data, adress[2:0],  ~(adress[4:3] ^ 2'b00) == 2'b11, reset, readen, writen, clk, Output);
    part4          bus5b(data, adress[2:0],  ~(adress[4:3] ^ 2'b01) == 2'b11, reset, readen, writen, clk, Output);
    part4          bus5c(data, adress[2:0],  ~(adress[4:3] ^ 2'b10) == 2'b11, reset, readen, writen, clk, Output);
    part4          bus5d(data, adress[2:0],  ~(adress[4:3] ^ 2'b11) == 2'b11, reset, readen, writen, clk, Output);
endmodule

module part6(   //128 byte memory module
    input [31:0] data,  //32 bit
    input [4:0] adress,
    input reset,
    input readen,
    input writen,
    input clk,
    output [31:0] Output
);
    wire [7:0] outa, outb,outc,outd;
    
    part5          busfin1(data[7:0], adress, reset, readen, writen, clk, outa);    //first 8 bit
    part5          busfin2(data[15:8], adress, reset, readen, writen, clk, outb);   //second 8 bit
    part5          busfin3(data[23:16], adress, reset, readen, writen, clk, outc);  //third 8 bit
    part5          busfin4(data[31:24], adress, reset, readen, writen, clk, outd);  //fourth 8 bit
    
    assign Output = {outd, outc,outb,outa}; //concatenation
 
endmodule
*/

