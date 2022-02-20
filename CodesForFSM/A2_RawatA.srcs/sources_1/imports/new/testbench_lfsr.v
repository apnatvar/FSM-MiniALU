`timescale 1ns / 1ps
module testbench_lfsr(

    );
    reg clk,rst_n;
    wire max_tick_reg;
    wire [15:0] Q_out;
    
    lfsr UUT(.clk(clk),.rst_n(rst_n),.Q_out(Q_out),.max_tick_reg(max_tick_reg));
    localparam T = 20;
	//the clock will have the same time throughout the simulation
	always
		begin
			clk = 1'b1;
			#(T/2);
			clk = 1'b0;
			#(T/2);
		end
	
    
	//the time values are used from the testbench created in part A of lab F
	initial 
		begin
			 rst_n = 1'b1; 	
			 //sh_en = 1'b1;	
		//	#50 rst_n = 1'b0;
			#200 rst_n = 1'b0;
			//#22 rst_n = 1'b0;
		end 

endmodule
