`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 00:18:53
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

module bcd_tb;

    reg a0,a1,a2,a3;
    reg b0,b1,b2,b3;
    reg c_in;

    wire s0,s1,s2,s3;
    wire c_out;

    bcd dut( a0,a1,a2,a3, b0,b1,b2,b3,c_in,c_out,s0,s1,s2,s3);
    initial
    begin      
        // 3 + 4 = 7
        {a3,a2,a1,a0} = 4'b0011;
        {b3,b2,b1,b0} = 4'b0100;
        c_in = 0;
        #10;

        // 5 + 6 = 11 (BCD correction needed)
        {a3,a2,a1,a0} = 4'b0101;
        {b3,b2,b1,b0} = 4'b0110;
        c_in = 0;
        #10;

        // 9 + 9 = 18
        {a3,a2,a1,a0} = 4'b1001;
        {b3,b2,b1,b0} = 4'b1001;
        c_in = 0;
        #10;

        // 8 + 7 + 1 = 16
        {a3,a2,a1,a0} = 4'b1000;
        {b3,b2,b1,b0} = 4'b0111;
        c_in = 1;
        #10;
        end

endmodule
