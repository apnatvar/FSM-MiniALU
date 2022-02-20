`timescale 1ns / 1ps
module counter
    (
    input wire clk, reset, 
	input in, //the 
	input max_tick, //max_tick_reg
    //output reg [9:0] count //THE 10-BIT OUTPUT REGISTER FOR THE COUNTER
    output wire [3:0] d3, d2, d1, d0 // to return each individual digits of that 
//will be represented at the seven segment display
    );

    //reg [23:0] count_reg;
    //wire [23:0] next_count;
    reg [3:0] d3_out, d2_out, d1_out, d0_out;
    reg [3:0] d3_next, d2_next, d1_next, d0_next;
    
   always @(posedge clk)
    begin
       //count_reg <= next_count;
       d3_out <= d3_next;
       d2_out <= d2_next;
       d1_out <= d1_next;
       d0_out <= d0_next;
    end
    
   always @*
    begin
       d0_next = d0_out;
       d1_next = d1_out;
       d2_next = d2_out;
       d3_next = d3_out;
       
       if (max_tick)//reset if the LFSR has completed 2 ^ 20 cycles and max_tick is 1
          begin
             d0_next = 4'b0;
             d1_next = 4'b0;
             d2_next = 4'b0;
             d3_next = 4'b0;
          end
          
       else if (in)
//to count we are incrementing the digit at unit's place by one
          if (d0_out != 9) //if this digit has reached 9, then we set the unit's digit to 0
//and increment the digit at ten's place
             d0_next = d0_out + 1;
          else
             begin
                d0_next = 4'b0;
                if (d1_out != 9) //if this digit has reached 9, then we set the ten's digit to 0
//and increment the digit at hundred's place
                   d1_next = d1_out + 1;
                else
                   begin
                      d1_next = 4'b0;
                      if (d2_out != 9) //if this digit has reached 9, then we set the hundred's digit to 0
//and increment the digit at thousand's place
                         d2_next = d2_out + 1;
                      else
                         begin
                             d2_next = 4'b0;
                             if(d3_out != 9) //if the counter at this point is 9999 and another increment is required
// the counter resets to 0000 and starts counting all over again/
                                 d3_next = d3_out + 1;
                             else 
                                 d3_next = 4'b0;
                         end
                   end
             end
    end
	//assigning the logic outputs to the module outputs
    assign d0 = d0_out;
    assign d1 = d1_out;
    assign d2 = d2_out;
    assign d3 = d3_out;
    
endmodule