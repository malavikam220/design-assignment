`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 21:29:05
// Design Name: 
// Module Name: decoder2_4tb
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


module decoder2_4tb(

    );
    reg [1:0]a_tb;
    wire [3:0]d_tb;
    decoder2_4 dut(a_tb,d_tb);
    initial
    begin
    a_tb=2'b00;
    #10;
    a_tb=2'b01;
    #10;
    a_tb=2'b10;
    #10;
    a_tb=2'b11;
    $monitor("the value of d_tb is %b",d_tb);
    end
endmodule
