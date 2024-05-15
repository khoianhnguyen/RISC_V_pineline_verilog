`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2024 12:32:37 AM
// Design Name: 
// Module Name: yourcpu_test_top
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

module yourcpu_test_top;
    bit SystemClock;
    yourcpu_io top_io(SystemClock);
    test t(top_io);
    risc_v_pineline DUT(.clk(SystemClock),.reset_n(top_io.TB.reset_n));
    initial begin
        top_io.TB.reset_n=0;
        SystemClock=0;
        #40 top_io.TB.reset_n=1;
    end
    always #5 SystemClock=!SystemClock;
endmodule
