`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 02:21:54 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input clk,
    input reset_n,
    input [31:0] PC,
    input [31:0] Instruction,
    output reg [31:0] PC_out,
    output reg [31:0] Instruction_out
    );
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            PC_out<=0;
            Instruction_out<=0;
        end
        else begin
             PC_out<=PC;
             Instruction_out<=Instruction;
        end 
    end
endmodule
