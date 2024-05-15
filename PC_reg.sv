`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2024 10:21:57 PM
// Design Name: 
// Module Name: PC_reg
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


module PC_reg(
    input clk,
    input reset_n,
    input [31:0] Addr,
    output reg [31:0] Addr_out
    );
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) Addr_out <=0;
        else Addr_out<= Addr;
    end
endmodule
