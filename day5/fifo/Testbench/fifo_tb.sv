`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 20:57:00
// Design Name: 
// Module Name: fifo_tb
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
interface fifo_if;
    logic clk,rst,wr_en,rd_en,full,empty;
    logic [7:0] din,dout;
endinterface

module fifo_tb;

    fifo_if aif();
    fifo dut (aif.clk,aif.rst,aif.wr_en,aif.rd_en,aif.din,aif.dout,aif.full,aif.empty
    );

    
    always #5 aif.clk = ~aif.clk;
    initial begin
    aif.clk   = 0;
    aif.rst   = 1;
    aif.wr_en = 0;
    aif.rd_en = 0;
    aif.din   = 0;

    #10;
    aif.rst = 0;

    // Write operation
   @(posedge aif.clk);
    aif.wr_en = 1;
    aif.din = 10;
    $display("WRITE : %0d", aif.din);

    @(posedge aif.clk);
    aif.din = 20;
    $display("WRITE : %0d",aif.din);

    @(posedge aif.clk);
    aif.din = 30;
    $display("WRITE : %0d", aif.din);


    // Read operation
    @(posedge aif.clk);
    
    aif.rd_en = 1;
    
    @(posedge aif.clk);
    #1;
    $display("READ : %0d",aif.dout);

    @(posedge aif.clk);
    #1;
    $display("READ : %0d",aif.dout);

    @(posedge aif.clk);
    #1;
    $display("READ : %0d", aif.dout);
    
   

    aif.rd_en = 0;

    #20;
    $finish;
    end
endmodule
