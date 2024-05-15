`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2024 10:36:02 AM
// Design Name: 
// Module Name: MEM_stage
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


module MEM_stage(
    input clk,
    input reset_n,
    input [31:0]PC,
    input [31:0] Addr,
    input MemRW,
    input [31:0] DataW,
    input RegWEn,
    input [4:0]AddrD,
    input [1:0] WBSel,
    input [2:0]funct3,
    output [31:0] PC4_out,
    output [31:0] DataALU,
    output [31:0] DataR,
    output [4:0] AddrD_out,
    output RegWEn_out,
    output [1:0] WBSel_out
    );
    wire [31:0] PC4_wire,DataR_wire;
    DMEM DM(.clk(clk),.reset_n(reset_n),.funct3(funct3),.DataW(DataW),.Addr(Addr),.MemRW(MemRW),.DataR(DataR));
    adder4 add4(.PC_input(PC),.out(PC4_wire));
    MEM_WB MEM_WB0(.clk(clk),.reset_n(reset_n),.DataALU(Addr),.PC4(PC4_wire),.DataR(DataR_wire),.AddrD(AddrD),.RegWEn(RegWEn),.WBSel(WBSel),.PC4_out(PC4_out),.DataALU_out(DataALU),.DataR(DataR),.AddrD_out(AddrD_out),.RegWEn_out(RegWEn_out),.WBSel_out(WBSel_out));
endmodule 
