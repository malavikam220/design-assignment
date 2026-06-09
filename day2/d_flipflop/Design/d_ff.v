`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 12:34:45
// Design Name: 
// Module Name: d_ff
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


module d_ff(input d,rst,clk,output reg q,qbar

    );
    always @(posedge clk) 
    begin
        if (rst) begin
        q<=1'b0;
        qbar<=1'b1;
        end
    else begin q<=d; 
    qbar<=~d;
    end
    end
endmodule
