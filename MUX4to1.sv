`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 04:56:44 PM
// Design Name: 
// Module Name: MUX4to1
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


module MUX4to1(
    input [1:0] Select,
    input [31:0] I0,
    input [31:0] I1,
    input [31:0] I2,
    input [31:0] I3,
    output [31:0] Result
    );
    assign Result= (Select==2'b00)? I0: (Select==2'b01)?I1:(Select==2'b10)?I2:(Select==2'b11)?I3:(Select==2'bxx)?I0:I0;
endmodule
