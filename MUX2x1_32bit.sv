`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2024 09:54:45 PM
// Design Name: 
// Module Name: MUX2x1_32bit
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


module MUX2x1_32bit(
    input Select,
    input [31:0] I0,
    input [31:0] I1,
    output [31:0] Result
    );
    assign Result= (!Select)?I0:I1;
endmodule
