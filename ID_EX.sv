`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 03:00:27 PM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
    input clk,
    input reset_n,
    input [31:0] PC,
    input [31:0] DataB,
    input [31:0] DataA, 
    input [31:0] Imm,
    input RegWEn,
    input [1:0] WBSel,
    input  DataASel,
    input  DataBSel,
    input MemRW,
    input [2:0] funct3,
    input [4:0] AddrD,AddrA,AddrB,
    input [3:0] ALUSel,
    input PCSel,
    output reg [4:0] AddrD_out,AddrA_out,AddrB_out,
    output reg [31:0] PC_out,
    output reg [31:0] DataB_out,
    output reg [31:0] DataA_out,    
    output reg MemRW_out,
    output reg RegWEn_out,
    output reg [3:0] ALUSel_out,
    output reg [31:0] Imm_out,
    output reg [1:0] WBSel_out,
    output reg [2:0] funct3_out,
    output reg DataASel_out,
    output reg DataBSel_out,
    output reg PCSel_out
    );
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
        DataA_out<=0;
        Imm_out<=0;
        PC_out<=0;
        DataB_out<=0;
        MemRW_out<=0;
        RegWEn_out<=0;
        WBSel_out<=0;
        funct3_out<=0;
        AddrD_out<=0;
        DataASel_out<=0;
        DataBSel_out<=0;
        ALUSel_out<=0;
        PCSel_out<=0;
        AddrA_out<=0;
        AddrB_out<=0;
        end
        else begin
        DataA_out<=DataA;
        Imm_out<=Imm;
        PC_out<=PC;
        DataB_out<=DataB;
        MemRW_out<=MemRW;
        RegWEn_out<=RegWEn;
        WBSel_out<=WBSel;
        funct3_out<=funct3;
        AddrD_out<=AddrD;
        DataASel_out<=DataASel;
        DataBSel_out<=DataBSel;
        ALUSel_out<=ALUSel; 
        PCSel_out<=PCSel;
        AddrA_out<=AddrA;
        AddrB_out<=AddrB;
        end
    end
endmodule
