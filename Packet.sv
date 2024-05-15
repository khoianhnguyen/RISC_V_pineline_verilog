
`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 08:57:20 PM
// Design Name: 
// Module Name: Packet
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
`ifndef PACKET
`define PACKET
class Packet; 
     rand bit [6:0] opcode;
     rand bit [4:0] rs1,rs2,rd;
     rand bit [11:0] imm;
     rand bit [2:0] funct3;
     rand bit [6:0] funct7;
     string name;
     bit [31:0] instruction;
     constraint opcode_limit{
        opcode inside {7'b0110011,7'b0010011/*,7'b0000011*/};
     }
     constraint funct3_funct7_limit{
        if(opcode==7'b0110011) {
            funct3 inside{3'b000}; 
            if(funct3==3'b000) funct7 inside{7'b0100000,7'b0000000};
            else if(funct3==3'b101) funct7 inside{7'b0100000,7'b0000000};
        }
        else if(opcode ==7'b0010011) {
            funct3 inside{3'b000,3'b110,3'b111};
        }
     }
     extern function new (string name="Packet");
     extern function generator();
     extern function void display(string prefix="NOTE");
endclass
function Packet:: new(string name);
    this.name=name;
endfunction:new
function Packet:: generator();
    if(this.opcode==7'b0110011)begin
        this.instruction <= {this.funct7,this.rs2,this.rs1,this.funct3,this.rd,this.opcode };
    end
    else if(this.opcode==7'b0010011) begin
        this.instruction <= {this.imm,this.rs1,this.funct3,this.rd,this.opcode};
    end
    else begin 
        this.instruction<= {this.imm[11:5],this.rs2,this.rs1,this.funct3,this.imm[4:0],this.opcode};
    end
endfunction: generator
function Packet::display(string prefix);
    $display ("Instruction: %h",this.instruction);
    if(this.instruction[6:0]==7'b0110011) begin
        $display ("Rtype");
        $display ("%b %b %b %b %b %b ",this.funct7,this.rs2,this.rs1,this.funct3,this.rd,this.opcode );
        $display ("rd: %d",this.rd);
        $display ("rs1: %d",this.rs1);
        $display ("rs2: %d",this.rs2);
    end
    else if (this.instruction[6:0]==7'b0010011) begin
        $display ("Itype");
        $display ("%b %b %b %b %b ",this.imm,this.rs1,this.funct3,this.rd,this.opcode);
        $display ("rd: %d",this.rd);
        $display ("rs1: %d",this.rs1);
        $display ("imm: %d",this.imm);
    end
    else begin
        $display ("Stype");
        $display ("%b %b %b %b %b %b ",this.imm[11:5],this.rs2,this.rs1,this.funct3,this.imm[4:0],this.opcode);
        end
endfunction: display
`endif 