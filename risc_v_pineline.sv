`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 11:04:00 PM
// Design Name: 
// Module Name: risc_v_pineline
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


module risc_v_pineline(
    input clk,
    input reset_n
    );
    wire [31:0] PC_out,Instruction,DataDWB,DataA,DataB,PC_ID,Imm_ID,PC_EX,ALUDataEX,DataBEX,PC4_MEM,DataALU_MEM,DataR_MEM,WBData,Data_W_delay;
    wire [31:0] DataWB,DataM;
    wire [4:0] AddrDWB,AddrDID,AddrDEX,AddrDMEM,AddrAID,AddrBID,AddrD_delay; 
    wire PCSel,RegWEnWB,RegWEnID,RegWEnEX,MemRWID,ASelID,BSelID,MemRWEX,RegWEnMEM,RegWEn_delay;
    wire [3:0] ALUSel_ID;
    wire [1:0] WBSelID,WBSelMEM,WBSelEX; 
    wire [1:0] ForwardingA,ForwardingB;
    wire [2:0] funct3ID,funct3EX;
//    assign ForwardingA=2'b00;
//    assign ForwardingB=2'b00; 
    assign AddrDWB=AddrDMEM;
    assign RegWEnWB=RegWEnMEM;
    assign DataDWB=WBData;
    assign DataM=ALUDataEX;
    assign DataWB=WBData;
    IF_stage IF(.clk(clk),.reset_n(reset_n),.ALUData(ALUDataEX),.PCSel(PCSel),.PC_out(PC_out),.Instruction(Instruction));
    ID_stage ID(.clk(clk),.reset_n(reset_n),.Instruction(Instruction),.RegWEnWB(RegWEnWB),.AddrDWB(AddrDWB),.DataDWB(DataDWB),.PC(PC_out),.DataA(DataA),.DataB(DataB),.PC_out(PC_ID),.AddrD(AddrDID),.Imm(Imm_ID),.ALUSel(ALUSel_ID),.RegWEn(RegWEnID),.ASel(ASelID),.BSel(BSelID),.PCSel(PCSel),.WBSel(WBSelID),.funct3(funct3ID),.MemRW(MemRWID),.AddrA_out(AddrAID),.AddrB_out(AddrBID));
    EX_stage EX(.clk(clk),.reset_n(reset_n),.DataA(DataA),.DataB(DataB),.DataWB(DataWB),.DataM(DataM),.Imm(Imm_ID),.ForwardingA(ForwardingA),.ForwardingB(ForwardingB),.ASel(ASelID),.BSel(BSelID),.ALUSel(ALUSel_ID),.funct3(funct3ID),.MemRW(MemRWID),.RegWEn(RegWEnID),.AddrD(AddrDID),.WBSel(WBSelID),.PC(PC_ID),.funct3_out(funct3EX),.MemRW_out(MemRWEX),.RegWEn_out(RegWEnEX),.AddrD_out(AddrDEX),.WBSel_out(WBSelEX),.ALUData_out(ALUDataEX),.DataB_out(DataBEX),.PC_out(PC_EX),.Data_W_delay(Data_W_delay));
    MEM_stage MEM(.clk(clk) ,.reset_n(reset_n),.PC(PC_EX),.Addr(ALUDataEX),.WBSel(WBSelEX),.MemRW(MemRWEX),.DataW(DataBEX),.RegWEn(RegWEnEX),.AddrD(AddrDEX),.funct3(funct3EX),.PC4_out(PC4_MEM),.DataALU(DataALU_MEM),.DataR(DataR_MEM),.AddrD_out(AddrDMEM),.RegWEn_out(RegWEnMEM),.WBSel_out(WBSelMEM));
    MUX3to1 WB(.Select(WBSelMEM),.I0(DataR_MEM),.I1(DataALU_MEM),.I2(PC4_MEM),.result(WBData));
    Hazard_unit Hazard(.reset_n(reset_n),.RegWriteM(RegWEnEX),.RegWriteW(RegWEnMEM),.RD_M(AddrDEX),.RD_W(AddrDWB),.Rs1_E(AddrAID),.Rs2_E(AddrBID),.ForwardAE(ForwardingA),.ForwardBE(ForwardingB),.RD_W_delay(AddrD_delay),.RegWriteW_delay(RegWEn_delay));
    WB_delay WB_delay0(.clk(clk),.reset_n(reset_n),.AddrD(AddrDMEM),.RegWEn(RegWEnMEM),.DataD(WBData),.AddrD_out(AddrD_delay),.DataD_out(Data_W_delay),.RegWEn_out(RegWEn_delay));
endmodule
