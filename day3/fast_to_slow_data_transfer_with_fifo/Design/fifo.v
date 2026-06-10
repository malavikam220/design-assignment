`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 12:05:44
// Design Name: 
// Module Name: fifo
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

module fifo(input clk,rst,wr_en,rd_en,input [7:0] data_in,output reg [7:0] data_out, output full,empty
  );
reg [7:0] mem [0:7];
reg [2:0] wr_ptr,rd_ptr;
integer i;

assign full  = ((wr_ptr + 3'b001) == rd_ptr);
assign empty = (wr_ptr == rd_ptr);

always @(posedge clk)
begin
    if(rst)
    begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        data_out <= 0;

        for(i=0;i<8;i=i+1)
            mem[i] <= 0;
    end
    else
    begin

        if(wr_en && !full)
        begin
            mem[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1'b1;
        end

        if(rd_en && !empty)
        begin
            data_out <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1'b1;
        end

    end
end

endmodule
