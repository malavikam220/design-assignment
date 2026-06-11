`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 21:14:59
// Design Name: 
// Module Name: tb_bram
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


module tb_bram(

    );

reg clk;
reg arstn;
reg wrenb;

reg [7:0] wradd;
reg [7:0] rdadd;
reg [7:0] data_in;

wire [7:0] data_out;
design_1_wrapper DUT
(
    .clk(clk),
    .arstn(arstn),
    .wrenb(wrenb),
    .wradd(wradd),
    .rdadd(rdadd),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    arstn = 0;
    wrenb = 0;
    wradd = 0;
    rdadd = 0;
    data_in = 0;

    #20;
    arstn = 1;

    //-------------------------
    // WRITE 55 TO ADDRESS 10
    //-------------------------
    @(posedge clk);
    wrenb = 1;
    wradd = 8'd10;
    data_in = 8'h55;

    @(posedge clk);
    wrenb = 0;

    //-------------------------
    // READ ADDRESS 10
    //-------------------------
    rdadd = 8'd10;

    #20;

    //-------------------------
    // WRITE AA TO ADDRESS 20
    //-------------------------
    @(posedge clk);
    wrenb = 1;
    wradd = 8'd20;
    data_in = 8'hAA;

    @(posedge clk);
    wrenb = 0;

    //-------------------------
    // READ ADDRESS 20
    //-------------------------
    rdadd = 8'd20;

    #20;

    $finish;

end

endmodule

