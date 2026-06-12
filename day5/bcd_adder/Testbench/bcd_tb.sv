`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 19:52:46
// Design Name: 
// Module Name: bcd_tb
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

interface bcd_if;
    logic [3:0] a,b;
    logic [4:0]s;
endinterface
module bcd_tb;
    bcd_if bif();
    bcd_adder dut(bif.a,bif.b,bif.s);
    initial begin
        bif.a = 4'd4;
        bif.b = 4'd5;
        #10;

        bif.a = 4'd7;
        bif.b = 4'd2;
        #10;

        bif.a = 4'd8;
        bif.b = 4'd3;
    end
    initial begin
        $monitor("BCD Addition: %0d + %0d = %0b",
                  bif.a, bif.b, bif.s);
        #30;
        $finish;
    end
endmodule
