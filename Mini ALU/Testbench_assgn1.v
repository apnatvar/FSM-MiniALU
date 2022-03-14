`timescale 1ns / 1ps
module testbench_assgn1;
    // signal are declared :
    reg [5:0] in1, in2;
    reg [2:0] fm;
    wire out;
    
    // instantiation of the circuit under the test
    alumain uut (.a(in1), .b(in2), .fxn(fm), .finalresult(out) );
    
    //  Generate the test vectors
    initial
    begin
    
    in1 = 6'b001010;
    in2 = 6'b101111;
    fm = 3'b100;     // give the value of fxn corresponding to the function we want to test. Here its 100 which corresponds to A<B
   
    end
    
    initial
    begin
    $monitor("A: %b  B: %b  Result:  %b %b ", in1, in2, fm, out);  //print the result obtained
    
    end
 
endmodule
