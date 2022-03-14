`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2021 00:16:14
// Design Name: 
// Module Name: alumain
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


module alumain(
    input [2:0] fxn,      //taking fxn as an input so as to know any of the 8 fxnx we want
    input [5:0] a,b,               //a and b as input
    output [5:0] finalresult        //this is the overall final result to be displayed 
    );
    reg [5:0] temp;
    wire selin;                // this is a wire set in way that allows you to either add when 0 and subtract when 1
    assign selin = 1'b0;       // I am using the addition so, it is set =0
    wire [5:0] result1,result2,result3,result4,result6,result7,result8; // results 
    wire result5;            // SINCE WE WANT ONLY 1 BIT RESULT FOR A<B (EITHER 0 OR 1)
    wire overflowout, carryout;    //  overflow and carry wires 
    
    //the instantiations starts from here : 
    //for A
    alufirst DUT5 (.x1(a), .y1(b), .c1(result1)); 
    // for B
    alusecond DUT6 (.x2(a), .y2(b), .c2(result2)); 
    // for -A
    bit6_addsub DUT3  (.x(-a), .y(b-b), .sel(selin), .overflow(overflowout), .c_out(carryout), .sum(result3));
    // for -B
    bit6_addsub DUT4  (.x(a-a), .y(-b), .sel(selin), .overflow(overflowout), .c_out(carryout), .sum(result4)); 
    // A<B
    bit8 DUT7 (.x3(a), .y3(b), .c3(result5)); 
    // Bitwise xnor
    xnoralu DUT8(.i0(a[0]),.i1(b[0]),.op(result6[0])); 
    xnoralu DUT9(.i0(a[1]),.i1(b[1]),.op(result6[1]));
    xnoralu DUT10(.i0(a[2]),.i1(b[2]),.op(result6[2]));
    xnoralu DUT11(.i0(a[3]),.i1(b[3]),.op(result6[3]));
    xnoralu DUT12(.i0(a[4]),.i1(b[4]),.op(result6[4]));
    xnoralu DUT13(.i0(a[5]),.i1(b[5]),.op(result6[5]));
    // for A+B
    bit6_addsub DUT1  (.x(a), .y(b), .sel(selin), .overflow(overflowout), .c_out(carryout), .sum(result7));
    // for A-B 
    bit6_addsub DUT2  (.x(a), .y(-b), .sel(selin), .overflow(overflowout), .c_out(carryout), .sum(result8));
   
    always @(*)
    begin
        case (fxn)
        3'b000: temp = result1; // A
        3'b001: temp = result2; // B
        3'b010: temp = result3; // -A
        3'b011: temp = result4; // -B
        3'b100: temp = result5; // A<B
        3'b101: temp = result6; // BITWISE XNOR
        3'b110: temp = result7; // A+B
        3'b111: temp = result8; // A-B
           
       endcase
     end
    assign finalresult = temp;
    initial
    begin
    $monitor("A: %b  B:  %b  -A:  %b  -B: %b  A<B :  %b  A nxor B : %b  A+B :  %b  A-B :  %b  - finalresult(DEPENDING ON FXN VALUE) -  %b", result1, result2, result3, result4, result5, result6, result7, result8, finalresult);
    
    end
endmodule
