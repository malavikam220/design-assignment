`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 11:41:16
// Design Name: 
// Module Name: seqdet2
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


module seqdet2(input clk,rst,din,output reg detected

    );
    //states
    parameter idle=2'b00;
    parameter s1=2'b01;
    parameter s2=2'b10;
    parameter s3=2'b11;
    reg [1:0] ps,ns;        //present state, next state
    //present state logic
    always @(posedge clk)
    begin
    if (rst) begin           // if reset=1 idle state 
    ps<=idle;               //present state logic is sequential
    end
    else
    ps<=ns;
    end
    
    //next state begins(combinational logic)
    always @(*)
    begin
    detected=0;
    case(ps)
    idle: begin
    if (din==0) 
      ns=idle;
    else
      ns=s1;
    end
    s1: begin 
    if (din==0)
        ns=idle;
    else 
        ns=s2;    
    end
    
    s2: begin 
    if (din==0)
        ns=idle;
    else 
        ns=s3;    
    end
    
    s3: begin 
    if (din==0)begin
        ns=s1;
        detected=1; 
     end   
     else 
        ns=s3; 
     end    
   endcase
   end
endmodule
