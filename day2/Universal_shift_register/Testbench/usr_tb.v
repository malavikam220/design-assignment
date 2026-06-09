`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 15:39:12
// Design Name: 
// Module Name: usr_tb
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


module usr_tb;

reg clk_tb;
reg [1:0] mod_tb;
reg sr_in_tb, sl_in_tb;
reg [3:0] d_tb;
wire [3:0] q_tb;

usr dut(clk_tb, mod_tb, sr_in_tb, sl_in_tb, d_tb,q_tb);
initial 
    begin
    {clk_tb, mod_tb, sr_in_tb, sl_in_tb,d_tb}=0;
    end
    always #5 clk_tb = ~clk_tb;

initial
begin

    // Parallel Load
    mod_tb = 2'b11;
    d_tb= 4'b1010;
    #10;

    // Hold
    mod_tb = 2'b00;
    #10;

    // Shift Right
    mod_tb= 2'b01;
    sr_in_tb= 1'b1;
    #10;

    // Shift Left
    mod_tb = 2'b10;
    sl_in_tb = 1'b0;
    #10;

end

endmodule
