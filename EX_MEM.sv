`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 09:44:46 PM
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
    input clk,reset_n,
    input [31:0] PC,
    input [31:0] DataALU,
    input [31:0] DataB,
    input [4:0] AddrD,
    input RegWEn,
    input MemRW,
    input [1:0] WBSel,
    input [2:0] funct3,
    output reg [31:0] PC_out,
    output reg [31:0] DataALU_out,
    output reg [31:0] DataB_out,
    output reg [4:0] AddrD_out,
    output reg RegWEn_out,
    output reg MemRW_out,
    output reg [1:0] WBSel_out,
    output reg [2:0] funct3_out
    );
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
        PC_out<=0;
        DataALU_out<=0;
        DataB_out<=0;
        AddrD_out<=0;
        RegWEn_out<=0;
        MemRW_out<=0;
        WBSel_out<=0;
        funct3_out<=0;
        end
        else begin
        PC_out<=PC;
        DataALU_out<=DataALU;
        DataB_out<=DataB;
        AddrD_out<=AddrD;
        RegWEn_out<=RegWEn;
        MemRW_out<=MemRW;
        WBSel_out<=WBSel;
        funct3_out<=funct3;
        end
    end
endmodule
