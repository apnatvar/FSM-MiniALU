`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2021 17:12:08
// Design Name: 
// Module Name: bit6_addsub
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


module bit6_addsub(
    input [5:0] x,
    input [5:0] y,
    input sel,
    output overflow,
    output c_out,
    output [5:0] sum
    );
    wire [5:0] sel_y;
    wire [5:0] c_outs;
    
    assign sel_y = (sel)? !y : y;
    
    FullAdder b0 (x[0], sel_y[0], sel, sum[0], c_outs[0]);
    FullAdder b1 (x[1], sel_y[1], c_outs[0], sum[1], c_outs[1]);
    FullAdder b2 (x[2], sel_y[2], c_outs[1], sum[2], c_outs[2]);
    FullAdder b3 (x[3], sel_y[3], c_outs[2], sum[3], c_outs[3]);
    FullAdder b4 (x[4], sel_y[4], c_outs[3], sum[4], c_outs[4]);
    FullAdder b5 (x[5], sel_y[5], c_outs[4], sum[5], c_outs[5]);
    xor validgen (overflow, c_outs[4], c_outs[5]);
    assign c_out = c_outs[5];
          
endmodule
