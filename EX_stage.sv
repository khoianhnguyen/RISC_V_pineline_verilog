`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2024 08:17:45 PM
// Design Name: 
// Module Name: EX_stage
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


module EX_stage(
    input clk,reset_n,
    input [31:0] DataA,
    input [31:0] DataB,
    input [31:0] DataWB,
    input [31:0] DataM,
    input [31:0] Data_W_delay,
    input [31:0] Imm,
    input [1:0] ForwardingA,
    input [1:0] ForwardingB,
    input ASel,
    input BSel,
    input [3:0]ALUSel,
    input [2:0] funct3,
    input MemRW,
    input RegWEn,
    input [4:0] AddrD,
    input [1:0]WBSel,
    input [31:0] PC,
    output [2:0] funct3_out,
    output MemRW_out,
    output RegWEn_out,
    output [4:0] AddrD_out,
    output [1:0] WBSel_out,
    output [31:0] ALUData_out,
    output [31:0] DataB_out,
    output [31:0] PC_out
    );
    wire [31:0] DataForwardA,DataForwardB,DataASel_wire,DataBSel_wire,ALUData_wire;
    MUX4to1 M4T0(.Select(ForwardingA),.I0(DataA),.I1(DataWB),.I2(DataM),.I3(Data_W_delay),.Result(DataForwardA));
    MUX4to1 M4T1(.Select(ForwardingB),.I0(DataB),.I1(DataWB),.I2(DataM),.I3(Data_W_delay),.Result(DataForwardB));
    
    MUX2x1_32bit M2T0(.Select(ASel),.I1(PC),.I0(DataForwardA),.Result(DataASel_wire));
    MUX2x1_32bit M2T1(.Select(BSel),.I1(Imm),.I0(DataForwardB),.Result(DataBSel_wire));
    ALU ALU0(.Select(ALUSel),.A(DataASel_wire),.B(DataBSel_wire),.result(ALUData_wire));
    
    EX_MEM EX_MEM0(.clk(clk),.reset_n(reset_n),.PC(PC),.DataALU(ALUData_wire),.DataB(DataForwardB),.AddrD(AddrD),.RegWEn(RegWEn),.MemRW(MemRW),.WBSel(WBSel),.funct3(funct3),.PC_out(PC_out),.DataALU_out(ALUData_out),.DataB_out(DataB_out),.AddrD_out(AddrD_out),.RegWEn_out(RegWEn_out),.MemRW_out(MemRW_out),.WBSel_out(WBSel_out),.funct3_out(funct3_out));

endmodule
