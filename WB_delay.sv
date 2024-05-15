`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 05:06:43 PM
// Design Name: 
// Module Name: WB_delay
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


module WB_delay(
    input clk,
    input reset_n,
    input RegWEn,
    input [4:0] AddrD,
    input [31:0] DataD,
    output reg RegWEn_out,
    output reg [4:0] AddrD_out,
    output reg [31:0] DataD_out
    );
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            AddrD_out<=0;
            DataD_out<=0;
            RegWEn_out<=0;
        end
        else begin
            RegWEn_out<=RegWEn; 
            AddrD_out<=AddrD;
            DataD_out<=DataD;
        end
    end
endmodule
