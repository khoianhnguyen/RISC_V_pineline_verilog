`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 09:21:45 AM
// Design Name: 
// Module Name: Immgenrator
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


module Immgenrator(
    input [31:0] Instruction,
    output reg [31:0] Imm
    );
    always @(*) begin
        case (Instruction[6:0]) 
            7'b0110111: Imm<={{12{Instruction[31]}},Instruction[31:12]};
            7'b1101111: Imm<={{13{Instruction[31]}},Instruction[19:12],Instruction[20],Instruction[30:21]};
            7'b1100111: Imm<={{20{Instruction[31]}},Instruction[31:20]};
            7'b1100011: begin   
                            if(Instruction[14:12]==3'b110 || Instruction[14:12]==3'b111) begin 
                                Imm<={{20{1'b0}},Instruction[31],Instruction[7],Instruction[30:25],Instruction[11:8]};
                            end
                            else if(Instruction[14:12]==3'b000||Instruction[14:12]==3'b001||Instruction[14:12]==3'b100||Instruction[14:12]==3'b101) begin
                                Imm<={{21{Instruction[31]}},Instruction[7],Instruction[30:25],Instruction[11:8]};
                            end
                            end 
            7'b0000011: begin
                            if (Instruction[14:12]==3'b100||Instruction[14:12]==3'b101) begin
                                Imm<={{20{1'b0}},Instruction[31:20]};
                            end
                            else if(Instruction[14:12]==3'b000||Instruction[14:12]==3'b001||Instruction[14:12]==3'b010) begin
                                Imm<={{20{Instruction[31]}},Instruction[31:20]};
                            end
                        end
            7'b0100011: begin   
                            Imm<={{20{Instruction[31]}},Instruction[31:25],Instruction[11:7]};
                        end
            7'b0010011: begin
                            Imm<=(Instruction[14:12]==3'b011)?{{20{1'b0}},Instruction[31:20]}:{{20{Instruction[31]}},Instruction[31:20]};
                        end
            default: Imm<=32'hxxxxxxxx;
        endcase
    end
endmodule
