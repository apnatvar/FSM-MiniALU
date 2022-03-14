`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2021 00:56:19
// Design Name: 


module bit8(
        input wire [5:0] x3, y3,
        output wire  c3
    );
   //instantiating the greater and equal modules
    wire q, w, e, r; //declared multiple wires so as to apply logic at the end 
    greater g1 (.p(x3[1:0]), .q(y3[1:0]), .r(q));
    greater g2 (.p(x3[3:2]), .q(y3[3:2]), .r(w));
    greater g3 (.p(x3[5:4]), .q(y3[5:4]), .r(e));
    //greater g4 (.a(x3[7:6]), .b(y3[7:6]), .r(c3));
   
    wire s, d, f, g;  //wires so as to apply logic at the end 
    equal e1 (.a(x3[1:0]), .b(y3[1:0]), .aeqb(s));
    equal e2 (.a(x3[3:2]), .b(y3[3:2]), .aeqb(d));
    equal e3 (.a(x3[5:4]), .b(y3[5:4]), .aeqb(f));
    //equal e4 (.a(x3[7:6]), .b(y3[7:6]), .aeqb(c3));
   
   assign r = 1'b0;
   assign g = 1'b1;
   
    assign c3 = (r|g&(e|f&(w|d&(q|s)))); // the final logic to get the desired result
    
    
   
   
endmodule