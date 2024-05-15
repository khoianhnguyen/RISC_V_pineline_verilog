`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2024 01:56:39 PM
// Design Name: 
// Module Name: RISC_V_sinlecycle
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


module RISC_V_singlecycle(
    input clk,
    input reset_n
    );
    wire [31:0] PCSel_PC,PC_bus,Instruction,Imm_bus,DataA_bus,DataB_bus,ASel_ALU,BSel_ALU,ALU_bus,PC4_bus,DataR_bus,wb_bus;
    wire PCSel,RegWEn,BrUn,BrEq,BrLT,ASel,BSel,MemRW;
    wire [3:0] ALUSel;
    wire [2:0] funct3;
    wire [1:0] WBSel;
    wire [4:0] AddrA,AddrB,AddrD;
    assign AddrA=Instruction[19:15];
    assign AddrB=Instruction[24:20];
    assign AddrD=Instruction[11:7];
    MUX2x1_32bit M0(.Select(PCSel),.I0(PC4_bus),.I1(ALU_bus),.Result(PCSel_PC));
    PC_reg P(.clk(clk),.reset_n(reset_n),.Addr(PCSel_PC),.Addr_out(PC_bus));
    adder4 A(.PC_input(PC_bus),.out(PC4_bus));
    IMEM I0(.Addr(PC_bus),.Instruction(Instruction));
    Register_file R0(.clk(clk),.reset_n(reset_n),.RegWEn(RegWEn),.AddrA(AddrA),.AddrB(AddrB),.AddrD(AddrD),.DataD(wb_bus),.DataA(DataA_bus),.DataB(DataB_bus));
    Immgenrator Imm0(.Instruction(Instruction),.Imm(Imm_bus));
    BranchComp B0(.A(DataA_bus),.B(DataB_bus),.BrUn(BrUn),.BrEq(BrEq),.BrLT(BrLT));
    MUX2x1_32bit ASel0(.Select(ASel),.I0(DataA_bus),.I1(PC_bus),.Result(ASel_ALU));
    MUX2x1_32bit BSel0(.Select(BSel),.I0(DataB_bus),.I1(Imm_bus),.Result(BSel_ALU));
    ALU ALU0(.A(ASel_ALU),.B(BSel_ALU),.Select(ALUSel),.result(ALU_bus));
    DMEM DataMemory(.clk(clk),.reset_n(reset_n),.MemRW(MemRW),.Addr(ALU_bus),.DataW(DataB_bus),.funct3(funct3),.DataR(DataR_bus));
    MUX3to1 MUX3(.I0(DataR_bus),.I1(ALU_bus),.I2(PC4_bus),.Select(WBSel),.result(wb_bus));
    Control ctrl(.Instruction(Instruction),.BrEq(BrEq),.BrLT(BrLT),.PCSel(PCSel),.RegWEn(RegWEn),.BrUn(BrUn),.ASel(ASel),.BSel(BSel),.ALUSel(ALUSel),.MemRW(MemRW),.WBSel(WBSel),.funct3(funct3));
endmodule
