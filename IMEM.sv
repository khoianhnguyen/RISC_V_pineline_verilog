`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2024 09:58:50 PM
// Design Name: 
// Module Name: IMEM
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


module IMEM(
    input [31:0] Addr,
    output reg[31:0] Instruction
    );
    reg [7:0] IM [1023:0];
    initial begin
        $readmemh ("IMEMFILE.mem",IM);
    end
    always @(Addr) begin
        Instruction[31:24]<= IM[Addr];
        Instruction[23:16]<= IM[Addr+1];
        Instruction[15:8]<= IM[Addr+2];
        Instruction[7:0]<= IM[Addr+3];
    end
endmodule
