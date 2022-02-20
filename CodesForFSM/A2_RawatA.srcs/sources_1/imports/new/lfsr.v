`timescale 1ns / 1ps

module lfsr #(
    parameter seed = 21'b11110100101100100000
//    parameter seed = 21'b111111111111111111111// forbidden value
//    parameter seed = 21'b00000000000000000000
//    parameter seed = 21'b111100100000
//    parameter seed = 21'b1100000
//    parameter seed = 21'b111101
//    parameter seed = 21'b1100001111
//    parameter seed = 21'b1110000001100100000
//    parameter seed = 21'b1111010100100000
//    parameter seed = 21'b1100101100100000
    )
    (
    input clk, rst_n,
    output [20:0] Q_out,
    output reg max_tick_reg
    //output wire y1, 
    //output wire [15:0] c1
    );
    //localparam seed = given_seed; 
   // reg counter;
    reg [20:0] Q_state;
    wire [20:0] Q_ns;
    wire Q_fb;//, count0s, count1s;
   // wire copy_max_tick_reg;
    /*initial
    begin
     max_tick_reg = 15'b0;
    end*/
    
     always @ (posedge clk) //positive edge triggered
        begin
        if (rst_n)//!rst_n)//|| max_tick_reg == 15'b111111111111111) //initial setting or all interations of lfsr over
            begin //starting or restarting the lfsr
            Q_state <= seed; 
           // max_tick_reg <= 21'b0;
            end
        else //if (sh_en) //from the format in the slides
            begin  //making new states
            Q_state <= Q_ns; //non-blocking assignment
            //if (Q_state == seed)max_tick_reg = 15'b1;
            end
        end

    assign Q_fb = ~(Q_state[20] ^ Q_state[18]); //from the xilinx pdf
    assign Q_ns = {Q_state[19:0], Q_fb}; // new state generation 
    assign Q_out = Q_state; //output
    //advanced a(Q_state[15],clk,rst_n,max_tick_reg,count0s,count1s);
    //unsuccesful - advanced 
    
    always @ (posedge clk) //to check if the current Q state is == seed and adjust
    //the value of max_tick_reg accordingly
    begin
        if (Q_out == seed)max_tick_reg = 1;
        else max_tick_reg = 0;
    end
    //assign copy_max_tick_reg = max_tick_reg;
    //fsm DUT_fsm(.clk(clk),.reset(rst_n),.lfsr_bit(Q_state[20]),.y(y1),.c(c1),.mtr_bit(copy_max_tick_reg));
    
endmodule
