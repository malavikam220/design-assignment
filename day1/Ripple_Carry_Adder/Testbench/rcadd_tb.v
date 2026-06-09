`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 23:31:15
// Design Name: 
// Module Name: rcadd_tb
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

module rcadd_tb;

    reg a0,a1,a2,a3;
    reg b0,b1,b2,b3;
    reg c_in;

    wire s0,s1,s2,s3;
    wire c_out;

    rcadd dut(
        a0,a1,a2,a3,
        b0,b1,b2,b3,
        c_in,
        c_out,
        s0,s1,s2,s3
    );

    initial
    begin

        // Test Case 1: 0000 + 0000
        {a3,a2,a1,a0} = 4'b0000;
        {b3,b2,b1,b0} = 4'b0000;
        c_in = 0;
        #10;

        // Test Case 2: 0011 + 0101 = 1000
        {a3,a2,a1,a0} = 4'b0011;
        {b3,b2,b1,b0} = 4'b0101;
        c_in = 0;
        #10;

        // Test Case 3: 1111 + 0001 = 10000
        {a3,a2,a1,a0} = 4'b1111;
        {b3,b2,b1,b0} = 4'b0001;
        c_in = 0;
        #10;

        // Test Case 4: 1010 + 0101 + Cin=1 = 10000
        {a3,a2,a1,a0} = 4'b1010;
        {b3,b2,b1,b0} = 4'b0101;
        c_in = 1;
        #10;
        $monitor(" A=%b%b%b%b B=%b%b%b%b Cin=%b Sum=%b%b%b%b Cout=%b",
                  a3,a2,a1,a0, b3,b2,b1,b0, c_in, s3,s2,s1,s0, c_out);
    end

endmodule
