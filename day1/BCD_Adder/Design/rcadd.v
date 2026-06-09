`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 22:35:18
// Design Name: 
// Module Name: rcadd
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


module rcadd(input a0,a1,a2,a3,b0,b1,b2,b3,c_in, output c_out,s0,s1,s2,s3
    );
    wire w1,w2,w3;
    fulladder FA1(a0,b0,c_in,s0,w1);
    fulladder FA2(a1,b1,w1,s1,w2);
    fulladder FA3(a2,b2,w2,s2,w3);
    fulladder FA4(a3,b3,w3,s3,c_out);
    
endmodule
