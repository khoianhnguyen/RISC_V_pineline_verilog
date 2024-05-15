`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 09:15:17 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] Select,
    output reg [31:0] result
    );
    always @(*) begin
        case (Select)
        4'b0000: result<= A+B;
        4'b0001: result<= A-B;
        4'b0010: result<= A&B;
        4'b0011: result<= A|B;
        4'b0100: result<= A^B;
        4'b0101: result<= A<<B;
        4'b0110: result<= A>>B;
        4'b0111: result<= B<<12;
        4'b1000: result<= (A<B)?1:0;
        4'b1001: result<= A + B<<12;
        default: result<=32'hxxxxxxxx;
    endcase 
    end
endmodule
