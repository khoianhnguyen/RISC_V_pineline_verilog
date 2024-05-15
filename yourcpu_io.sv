`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 09:28:33 AM
// Design Name: 
// Module Name: yourcpu_io
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

interface yourcpu_io(input bit clk);
    logic reset_n;
    clocking cb @(posedge clk);
    output reset_n; 
    endclocking
    modport TB(clocking cb,output reset_n);
endinterface:yourcpu_io

