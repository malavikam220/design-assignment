`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 20:55:30
// Design Name: 
// Module Name: mod_out
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

module mod_out( input clk,rst,input [7:0] din,output reg [7:0] d_out,output reg rd_en
  );

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;

reg [1:0] state,next_state;

always @(posedge clk)
begin
    if(rst)
        state <= S0;
    else
        state <= next_state;
end

always @(*)
begin
    next_state = state;
    rd_en = 0;

    case(state)
        S0:
            next_state = S1;
        S1:
            next_state = S2;
        S2:
        begin
            rd_en = 1;
            next_state = S0;
        end
        default:
            next_state = S0;
    endcase
end

always @(posedge clk)
begin
    if(rst)
        d_out <= 8'd0;
    else if(rd_en)
        d_out <= din;
end

endmodule
