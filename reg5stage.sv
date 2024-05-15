`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2024 10:19:52 AM
// Design Name: 
// Module Name: reg5stage
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


module reg5stage(
    input clk,
    input reset,
    input [1:0] I,
    output [1:0] O
    );
    wire [1:0] reg1,reg2,reg3,reg4;
    register regi0(.clk(clk),.reset(reset),.I(I),.O(reg1));
    register regi1(.clk(clk),.reset(reset),.I(reg1),.O(reg2));
    register regi2(.clk(clk),.reset(reset),.I(reg2),.O(reg3));
    register regi3(.clk(clk),.reset(reset),.I(reg3),.O(reg4));
    register regi4(.clk(clk),.reset(reset),.I(reg4),.O(O));
endmodule
