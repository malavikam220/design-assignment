`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 23:08:17
// Design Name: 
// Module Name: bcd
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


module bcd(input a0,a1,a2,a3,b0,b1,b2,b3,c_in,output c_out,s0,s1,s2,s3

    );
    wire w0,w1,w2,w3,c1,c2,d1,d2;
    rcadd add1(a0,a1,a2,a3,b0,b1,b2,b3,c_in,c1,w0,w1,w2,w3);
    assign d1=w3&w2;
    assign d2=w3&w1;
    assign c2=c1|d1|d2;
   
    rcadd add2(w0,w1,w2,w3,0,c2,c2,0,0,c_out,s0,s1,s2,s3);
        
endmodule
