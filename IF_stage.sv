`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 10:18:58 AM
// Design Name: 
// Module Name: IF_stage
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


module IF_stage(
    input clk,
    input reset_n,
    input [31:0] ALUData,
    input PCSel,
    output [31:0] PC_out,
    output [31:0] Instruction
    );
    wire [31:0] PC,PC4,mux,Instruction_bus;
    MUX2x1_32bit muxPC(.Select(PCSel),.I0(PC4),.I1(ALUData),.Result(mux));
    PC_reg PC0(.clk(clk),.reset_n(reset_n),.Addr(mux),.Addr_out(PC));
    adder4 Adder0(.PC_input(PC),.out(PC4));
    IMEM IMEM0(.Addr(PC),.Instruction(Instruction_bus));
    IF_ID IF_ID0(.clk(clk),.reset_n(reset_n),.PC(PC),.Instruction(Instruction_bus),.PC_out(PC_out),.Instruction_out(Instruction));
endmodule
