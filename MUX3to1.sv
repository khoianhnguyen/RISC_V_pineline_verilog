`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2024 01:58:07 PM
// Design Name: 
// Module Name: MUX3to1
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


module MUX3to1(
    input [31:0] I0,
    input [31:0] I1,
    input [31:0] I2,
    input [1:0] Select,
    output [31:0] result
    );
    assign result=(Select==2'b00)?I0:(Select==2'b01)?I1:(Select==2'b10)?I2:32'hxxxxxxxx;
endmodule
