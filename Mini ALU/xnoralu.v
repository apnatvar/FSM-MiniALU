`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2021 01:12:38
// Design Name: 
// Module Name: xnoralu
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

// using the logic of xnor gate 
// xnor is a gate that gives high value when both the inputs given are equal and low when different 
module xnoralu
   (
    input wire i0, i1,
    output wire op
   );

   wire p0, p1;

   assign op = p0 | p1;   // op = A'b' + AB -------logic for xnor 
   assign p0 = ~i0 & ~i1;
   assign p1 = i0 & i1;

endmodule
