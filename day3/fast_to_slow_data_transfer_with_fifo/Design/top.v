`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 20:58:32
// Design Name: 
// Module Name: top
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

module top(
    input clk,rst,input [7:0] s_in, output [7:0] d_out
   );

wire [7:0] s_out,fifo_out;
wire fifo_full,fifo_empty,rd_en;

face_mod U1(
    .clk(clk),
    .s_in(s_in),
    .s_out(s_out)
);
   
fifo U2(
    .clk(clk),
    .rst(rst),
    .wr_en(~fifo_full),     
    .rd_en(rd_en),
    .data_in(s_out),
    .data_out(fifo_out),
    .full(fifo_full),
    .empty(fifo_empty)
);

mod_out U3(
    .clk(clk),
    .rst(rst),
    .din(fifo_out),
    .d_out(d_out),
    .rd_en(rd_en)
);

endmodule
