`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 09:06:02 PM
// Design Name: 
// Module Name: ID_stage
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


module ID_stage(
    input clk,
    input reset_n,
    input RegWEnWB,
    input [31:0]PC,
    input [31:0]Instruction,
    input [4:0] AddrDWB,
    input [31:0] DataDWB,
    output [31:0] PC_out,
    output [31:0] DataA,
    output [31:0] DataB,
    output [4:0] AddrD,AddrA_out,AddrB_out,
    output [31:0] Imm,
    output [3:0] ALUSel,
    output RegWEn,
    output MemRW,
    output ASel,
    output BSel,
    output PCSel,
    output [1:0] WBSel,
    output [2:0] funct3  
    );

    wire [4:0] AddrA_wire,AddrB_wire;
    wire BrEq_wire,BrLT_wire,PCSel_wire;
    wire RegWEn_wire;
    wire BrUn_wire;
    wire [3:0] ALUSel_wire;
    wire MemRW_wire;
    wire [1:0] WBSel_wire;
    wire [2:0] funct3_wire;
    wire [31:0] Imm_wire,DataA_wire,DataB_wire;
    wire [4:0] AddrD_wire;
    assign AddrD_wire=Instruction[11:7];
    assign AddrA_wire=Instruction[19:15];
    assign AddrB_wire=Instruction[24:20];
    Register_file RF0(.clk(clk),.reset_n(reset_n),.RegWEn(RegWEnWB),.AddrA(AddrA_wire),.AddrB(AddrB_wire),.DataD(DataDWB),.AddrD(AddrDWB),.DataA(DataA_wire),.DataB(DataB_wire));
    Control ctrl(.Instruction(Instruction),.BrEq(BrEq_wire),.BrLT(BrLT_wire),.PCSel(PCSel_wire),.ASel(DataASel_wire),.BSel(DataBSel_wire),.ALUSel(ALUSel_wire),.MemRW(MemRW_wire),.WBSel(WBSel_wire),.funct3(funct3_wire),.RegWEn(RegWEn_wire));
    Immgenrator IMM0(.Instruction(Instruction),.Imm(Imm_wire));
    BranchComp Br0(.A(DataA_wire),.B(DataB_wire),.BrUn(BrUn_wire),.BrEq(BrEq_wire),.BrLT(BrLT_wire));
    ID_EX ID_EX0(.clk(clk),.reset_n(reset_n),.PC(PC),.DataB(DataB_wire),.DataA(DataA_wire),.Imm(Imm_wire),.RegWEn(RegWEn_wire),.DataASel(DataASel_wire),.DataBSel(DataBSel_wire),.MemRW(MemRW_wire),.funct3(funct3_wire),.AddrD(AddrD_wire),.ALUSel(ALUSel_wire),.PCSel(PCSel_wire),.WBSel(WBSel_wire),.AddrD_out(AddrD),.PC_out(PC_out),.DataA_out(DataA),.DataB_out(DataB),.MemRW_out(MemRW),.RegWEn_out(RegWEn),.ALUSel_out(ALUSel),.Imm_out(Imm),.WBSel_out(WBSel),.funct3_out(funct3),.DataASel_out(ASel),.DataBSel_out(BSel),.PCSel_out(PCSel),.AddrA(AddrA_wire),.AddrB(AddrB_wire),.AddrA_out(AddrA_out),.AddrB_out(AddrB_out));
endmodule
