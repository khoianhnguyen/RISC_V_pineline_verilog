



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2024 12:37:28 AM
// Design Name: 
// Module Name: test
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


`include "yourcpu_io.sv"
`include "Packet.sv"
program automatic test(yourcpu_io.TB tb);
    integer i;
    Packet pkt[5:0];
    
    bit [31:0] inst;
    reg [7:0] memwrite [1023:0];
    initial begin
//        pkt1.opcode_limit;
        $display ("hello world");
        //Itype
        for (i=0;i<=5;i=i+1) begin
            pkt[i]=new();
            pkt[i].randomize();
            pkt[i].generator();
            pkt[i].display();
            inst= pkt[i].instruction;
            memwrite[i*4]=inst[31:24];
            memwrite[i*4+1]=inst[23:16];
            memwrite[i*4+2]=inst[15:8];
            memwrite[i*4+3]=inst[7:0];
        end
        $writememh ("E:\\RISC_V_PINELINE\\project_1\\project_1.srcs\\sources_1\\new\\IMEMFILE.mem",memwrite);
    end
endprogram

