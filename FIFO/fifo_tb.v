`timescale 1ns / 1ps
module fifo_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] buf_in;
	reg wr_en;
	reg rd_en;

	// Outputs
	wire [7:0] buf_out;
	wire empty;
	wire full;
	wire [2:0] counter;

	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.clk(clk), 
		.rst(rst), 
		.buf_in(buf_in), 
		.buf_out(buf_out), 
		.wr_en(wr_en), 
		.rd_en(rd_en), 
		.empty(empty), 
		.full(full), 
		.counter(counter)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		buf_in = 0;
		wr_en = 0;
		rd_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst=1;
		  wr_en=1;
		  #20;
		  
		  buf_in=8'h1;
		  #20;
		  
		  buf_in=8'h2;
		  #20;
		  
		  buf_in=8'h3;
		  #20;
		  
		  buf_in=8'h4;
		  #20;
		  
		  buf_in=8'h5;
		  #20;
		  
		  buf_in=8'h6;
		  #20;
		  
		  buf_in=8'h7;
		  #20;

		  
		  wr_en=0;
		  rd_en=1;
		  
end
always #10 clk=~clk;
      
endmodule