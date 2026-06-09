`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 23:45:22
// Design Name: 
// Module Name: usr
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


module usr(
    input clk,
    input [1:0] mod,
    input sr_in, sl_in,
    input [3:0] d,
    output reg [3:0] q
);

always @(posedge clk)
begin
    case(mod)
        2'b00: q <= q;                     // Hold
        2'b01: q <= {sr_in, q[3:1]};      // Shift Right
        2'b10: q <= {q[2:0], sl_in};      // Shift Left
        2'b11: q <= d;                    // Parallel Load
    endcase
end

endmodule
