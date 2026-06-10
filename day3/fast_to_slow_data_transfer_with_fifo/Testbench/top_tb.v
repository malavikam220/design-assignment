`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 21:04:49
// Design Name: 
// Module Name: top_tb
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

module top_tb;

    reg clk,rst;
    reg [7:0] s_in;
    wire [7:0] d_out;
    integer i;
    
    top dut (
        .clk(clk),
        .rst(rst),
        .s_in(s_in),
        .d_out(d_out)
    );

    always #5 clk = ~clk;

    initial begin
        
        clk  = 0;
        rst  = 1;
        s_in = 0;

        #20;
        rst = 0;

        // Send 15 consecutive data values
        for(i=1; i<=15; i=i+1)
        begin
            @(posedge clk);
            s_in <= i;
        end

    end

endmodule