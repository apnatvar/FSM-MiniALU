`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2021 19:31:39
// Design Name: 
// Module Name: e1
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


module greater(
        input wire[1:0] p, q,
        output wire r

    );
   
    wire a , b, c;
   // bitwise comparison
    assign a = p[0]&~q[1]&q[0]; 
    assign b = p[1]&~q[1];
    assign c = p[1]&p[0]&~q[0];
   
    assign r = a|b|c;
   
   
endmodule