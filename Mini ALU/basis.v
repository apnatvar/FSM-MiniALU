`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2021 19:38:12
// Design Name: 
// Module Name: basis
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

// Listing 1.1
module basis
   // I/O ports
   (
    input wire i0, i1,
    output wire eq, gr
   );

   // signal declaration
   wire p0, p1;

   // body
   // sum of two product terms
   assign eq = p0 | p1;

   // product terms
   assign p0 = ~i0 & ~i1;
   assign p1 = i0 & i1;

endmodule
