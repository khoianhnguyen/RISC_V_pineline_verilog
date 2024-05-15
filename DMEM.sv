`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 09:23:43 PM
// Design Name: 
// Module Name: DMEM
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


module DMEM(
    input clk,
    input reset_n,
    input [31:0] Addr,
    input [31:0] DataW,
    input MemRW,
    input [2:0] funct3,
    output [31:0] DataR
    );
    reg [7:0] DM [1023:0];
    reg [31:0] Dataout;
    integer i;
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            for (i=0;i<=1023;i=i+1) begin
            DM[i]<=0;
            end
        end
        else if(MemRW) begin
            Dataout<=32'hxxxxxxxx; 
            case(funct3)
                3'b000: DM[Addr]<= DataW[7:0];
                3'b001: begin
                        DM[Addr]<= DataW[7:0];
                        DM[Addr+1]<= DataW[15:8];
                end
                3'b010: begin
                        DM[Addr]<= DataW[7:0];
                        DM[Addr+1]<= DataW[15:8];
                        DM[Addr+2]<= DataW[23:16];
                        DM[Addr+3]<= DataW[31:24];
                end
            endcase
        end
        else begin
            case(funct3) 
                3'b000: Dataout <= {{25{DM[Addr][7]}},DM[Addr][6:0]};
                3'b001: Dataout <= {{17{DM[Addr+1][7]}},DM[Addr+1][6:0],DM[Addr]};
                3'b010: Dataout <= {DM[Addr+3],DM[Addr+2],DM[Addr+1],DM[Addr]};
                3'b100: Dataout <= {{24{1'b0}},DM[Addr]};
                3'b101: Dataout <= {{16'b0000},DM[Addr+1],DM[Addr]};
            endcase
        end
    end
    assign DataR = (MemRW==0)?Dataout:32'hxxxxxxxx;
endmodule
