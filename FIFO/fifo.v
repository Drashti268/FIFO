`timescale 1ns / 1ps
module fifo(clk,rst,buf_in,buf_out,wr_en,rd_en,empty,full,counter);
input rst,clk,wr_en,rd_en;
input [7:0]buf_in;
output reg [7:0] buf_out;
output reg empty,full;
output reg [2:0]counter;

reg [2:0]rd_ptr,wt_ptr;
reg [7:0] mem[7:0];

always @ (counter)
begin
          empty<= (counter==3'b000)?1'b1:1'b0;
	  full<=(counter==3'b111)?1'b1:1'b0;
end
always @ (posedge clk)
begin
if(!rst)
begin
                 counter<=0;
		 wt_ptr<=0;
		 rd_ptr<=0;
end
else if ((!full && wr_en) && (!empty && rd_en))
begin       
		 counter<=counter;
		 wt_ptr<=wt_ptr;
		 rd_ptr<=rd_ptr;
	
end
else if ((!full && wr_en))
begin
                 counter<=counter+1;
		 wt_ptr<=wt_ptr+1;
		 mem[wt_ptr]<=buf_in;
end
else if ((!empty && rd_en))
begin
                 counter<=counter-1;
		 rd_ptr<=rd_ptr+1;
		 buf_out<= mem[rd_ptr];
end
else
begin
                 counter<=counter;
		 wt_ptr<=wt_ptr;
		 rd_ptr<=rd_ptr;
	
	
end
end




endmodule
