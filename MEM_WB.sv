`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 09:58:47 AM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
    input clk,reset_n,
    input [31:0] PC4,
    input [31:0] DataALU,
    input [31:0] DataR,
    input [4:0] AddrD,
    input RegWEn,
    input [1:0] WBSel,
    output reg[31:0] PC4_out,
    output reg[31:0] DataALU_out,
    output reg[31:0] DataR_out,
    output reg[4:0] AddrD_out,
    output reg RegWEn_out,
    output reg[1:0] WBSel_out
    );
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            PC4_out<=0;
            DataALU_out<=0;
            AddrD_out<=0;
            RegWEn_out<=0;
            WBSel_out<=0;
            DataR_out<=0;
        end
        else begin
            PC4_out<=PC4;
            DataR_out<=DataR;
            DataALU_out<=DataALU;
            AddrD_out<=AddrD;
            RegWEn_out<=RegWEn;
            WBSel_out<=WBSel;
        end
    end
endmodule
