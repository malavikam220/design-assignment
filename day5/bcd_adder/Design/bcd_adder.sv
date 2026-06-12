`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 19:46:59
// Design Name: 
// Module Name: bcd_adder
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


module bcd_adder(
    input  [3:0] a,
    input  [3:0] b,
    output reg [4:0] sum
);
    reg [4:0] temp;

    always @(*) begin
        temp = a + b;
        if(temp > 9)
            sum = temp + 6;
        else
            sum = temp;
    end
endmodule
