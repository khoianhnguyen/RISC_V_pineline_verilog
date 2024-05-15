`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2024 10:29:14 PM
// Design Name: 
// Module Name: Registerf_ile
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


module Register_file(
    input clk,
    input reset_n,
    input RegWEn,
    input [4:0] AddrA,
    input [4:0] AddrB,
    input [4:0] AddrD,
    input [31:0] DataD,
    output [31:0] DataA,
    output  [31:0] DataB
    );
    reg [31:0] RF [31:0];
    integer i;
    always @(posedge clk or negedge reset_n ) begin
        if(!reset_n) begin
            for (i=0;i<=31;i=i+1) begin
                RF[i]<=0;
            end
        end
        else if(RegWEn) begin
            RF[AddrD] <= DataD;
        end
    end
    assign DataA= RF[AddrA];
    assign DataB= RF[AddrB];
endmodule
