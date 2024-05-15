`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 09:27:59 PM
// Design Name: 
// Module Name: Control
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


module Control(
    input [31:0] Instruction,
    input BrEq,
    input BrLT,
    output reg PCSel,
    output reg RegWEn,
    output reg BrUn,
    output reg ASel,
    output reg BSel,
    output reg [3:0] ALUSel,
    output reg MemRW,
    output reg [1:0] WBSel,
    output reg [2:0] funct3
    );
    always @(*) begin
        case (Instruction[6:0]) 
            7'b0110011: begin   //Rtype
                            PCSel<=1'b0;
                            RegWEn<= 1'b1;
                            BrUn<=1'bx;
                            ASel<=1'b0;
                            BSel<=1'b0;
                            MemRW<=1'b0;
                            WBSel<= 2'b01;
                            funct3<=3'bxxx;
                            case(Instruction[14:12]) 
                                        3'b000: begin
                                        if(Instruction[31:25]==7'b0000000) ALUSel<= 4'b0000;
                                        else if( Instruction[31:25]==7'b01000000) ALUSel<=4'b0001;
                                        end
                                        3'b100: ALUSel<= 4'b0100;
                                        3'b110: ALUSel<= 4'b0011;
                                        3'b111: ALUSel<= 4'b0010;
                                        3'b001: ALUSel<= 4'b0101;
                                        3'b101: ALUSel<= 4'b0110;
                                        3'b010: ALUSel<= 4'b1000;
                                        3'b011: ALUSel<= 4'b1000;
                            endcase
                        end
            7'b0010011: begin//Itype
                            PCSel<=1'b0;
                            RegWEn<= 1'b1;
                            BrUn<=1'bx;
                            ASel<=1'b0;
                            BSel<=1'b1;
                            MemRW<=1'b0;
                            WBSel<=2'b01;
                            funct3<=3'bxxx;
                             case(Instruction[14:12]) 
                                        3'b000: ALUSel<= 4'b0000;
                                        3'b100: ALUSel<= 4'b0100;
                                        3'b110: ALUSel<= 4'b0011;
                                        3'b111: ALUSel<= 4'b0010;
                                        3'b001: ALUSel<= 4'b0101;
                                        3'b101: ALUSel<= 4'b0110;
                                        3'b010: ALUSel<= 4'b1000;
                                        3'b011: ALUSel<= 4'b1000;
                            endcase
                        end
                7'b0000011: begin//IType load
                            PCSel<=1'b0;
                            RegWEn<=1'b1;
                            BrUn<=1'bx;
                            ASel<=1'b0;
                            BSel<=1'b1;
                            MemRW<=1'b0;
                            WBSel<=2'b00;
                            funct3<=Instruction[14:12];
                            ALUSel<= 4'b0000;
                        end
                7'b1100011: begin //Btype
                            RegWEn<=1'b0;
                            ASel<=1'b1;
                            BSel<=1'b1;
                            MemRW<=1'b0;
                            WBSel<=2'b00;//don't care
                            funct3<=Instruction[14:12];//don't care
                            ALUSel<= 4'b0000;
                            case (Instruction[14:12])
                                3'b000: begin//beq
                                    BrUn<=1'b1;
                                    if (BrEq==1) PCSel=1'b1;
                                    else if(BrEq==0) PCSel<=1'b0;
                                end
                                3'b001: begin//bneq
                                    BrUn<=1'b1;
                                    if (BrEq==0) PCSel=1'b1;
                                    else if(BrEq==0) PCSel<=1'b0;
                                end
                                3'b100: begin//blt
                                    BrUn<=1'b1;
                                    if (BrLT==1) PCSel=1'b1;
                                    else if(BrLT==0) PCSel<=1'b0;
                                end
                                3'b101: begin//bge
                                    BrUn<=1'b1;
                                    if (BrLT==0) PCSel=1'b1;
                                    else if(BrLT==0) PCSel<=1'b0;
                                end
                                3'b110: begin//bltu
                                    BrUn<=1'b0;
                                    if (BrLT==1) PCSel=1'b1;
                                    else if(BrLT==0) PCSel<=1'b0;
                                end
                                3'b111: begin//bgeu
                                    BrUn<=1'b0;
                                    if (BrLT==0) PCSel=1'b1;
                                    else if(BrLT==0) PCSel<=1'b0;
                                end
                                
                            endcase
                        end
                7'b0100011: begin//Stype
                            PCSel<=1'b0;
                            RegWEn<=1'b0;
                            BrUn<=1'bx;
                            ASel<=1'b0;
                            BSel<=1'b1;
                            MemRW<=1'b1;
                            WBSel<=2'b00;
                            funct3<=Instruction[14:12];
                            ALUSel<= 4'b0000;
                        end
                7'b1101111: begin//Jtype
                            PCSel<=1'b1;
                            RegWEn<=1'b1;
                            BrUn<=1'bx;
                            BSel<=1'b1;
                            MemRW<=1'b0;
                            WBSel<=2'b10;
                            funct3<=Instruction[14:12];
                            ALUSel<= 4'b0000;
                            if (Instruction[14:12]==3'b000) ASel<=1'b0;
                            else ASel<=1'b1;
                        end  
                7'b0110111: begin//Lui
                            PCSel<=1'b0;
                            RegWEn<=1'b1;
                            BrUn<=1'bx;
                            BSel<=1'b1;
                            ASel<=1'b0;
                            MemRW<=1'b0;
                            WBSel<=2'b01;
                            funct3<=Instruction[14:12];
                            ALUSel<= 4'b0111;
                        end  
                7'b0010111: begin//Auipc
                            PCSel<=1'b0;
                            RegWEn<=1'b1;
                            BrUn<=1'bx;
                            BSel<=1'b1;
                            ASel<=1'b1;
                            MemRW<=1'b0;
                            WBSel<=2'b01;
                            funct3<=Instruction[14:12];
                            ALUSel<= 4'b1001;
                        end
                default: begin
                            PCSel<=1'b0;
                            RegWEn<=1'b0;
                            BrUn<=1'bx;
                            BSel<=1'b0;
                            ASel<=1'b0;
                            MemRW<=1'b0;
                            WBSel<=2'b00;
                            funct3<=Instruction[14:12];
                            ALUSel<= 4'bxxxx;
                end
        endcase
    end
    
endmodule
