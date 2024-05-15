`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 11:47:52 PM
// Design Name: 
// Module Name: BranchComp
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


module BranchComp(
    input [31:0] A,
    input [31:0] B,
    input BrUn,
    output reg BrEq,
    output reg BrLT
    );
    reg [31:0] A_Un;
    reg [31:0] B_Un;
    always @(*) begin
        if (BrUn) begin
            if(A<B) begin
                BrEq<=1'b0;
                BrLT<=1'b1;
            end
            else if(A==B) begin
                BrEq<=1'b1;
                BrLT<=1'b0;
            end
            else begin
                BrEq<=1'b0;
                BrLT<=1'b0;
            end
        end
        else if(!BrUn) begin
            A_Un<= (A_Un[31]==1'b1)?!(A_Un-1):A_Un;
            B_Un<= (B_Un[31]==1'b1)?!(B_Un-1):B_Un;
            if(A_Un<B_Un) begin
                BrEq<=1'b0;
                BrLT<=1'b1;
            end
            else if(A_Un==B_Un) begin
                BrEq<=1'b1;
                BrLT<=1'b0;
            end
            else begin
                BrEq<=1'b0;
                BrLT<=1'b0;
            end
        end
    end
endmodule
