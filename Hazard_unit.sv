`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 08:51:55 PM
// Design Name: 
// Module Name: Hazard_unit
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


module Hazard_unit(
    input reset_n, RegWriteM, RegWriteW,RegWriteW_delay,
    input [4:0] RD_M, RD_W,RD_W_delay, Rs1_E, Rs2_E,
    output [1:0] ForwardAE, ForwardBE );
  
    
    
    assign ForwardAE = (reset_n == 1'b0) ? 2'b00 : 
                       ((RegWriteM == 1'b1)  & (RD_M == Rs1_E)) ? 2'b10 :
                       ((RegWriteW == 1'b1)  & (RD_W == Rs1_E)) ? 2'b01 : 
                       ((RegWriteW_delay == 1'b1)  & (RD_W_delay == Rs1_E)) ? 2'b11 :2'b00;
                       
    assign ForwardBE = (reset_n == 1'b0) ? 2'b00 : 
                       ((RegWriteM == 1'b1)  & (RD_M == Rs2_E)) ? 2'b10 :
                       ((RegWriteW == 1'b1)  & (RD_W == Rs2_E)) ? 2'b01 : 
                       ((RegWriteW_delay == 1'b1)  & (RD_W_delay == Rs2_E)) ? 2'b11 :2'b00;

endmodule
