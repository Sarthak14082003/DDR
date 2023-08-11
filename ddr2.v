module combine(reset,clock,wr,rd,wr_add,rd_add,data_in,data_out);
input reset,clock,wr,rd;
input[2:0]wr_add,rd_add;
input [7:0]data_in;
wire [7:0]x;
wire [7:0]y;
output reg[7:0]data_out;
pos_opr M1(.reset(reset),.clock(clock),.wr(wr),.rd(rd),.wr_add(wr_add),.rd_add(rd_add),.data_in(data_in),.data_out(x));
neg_opr M2(.reset(reset),.clock(clock),.wr(wr),.rd(rd),.wr_add(wr_add),.rd_add(rd_add),.data_in(data_in),.data_out(y));

always@(clock,x,y)
begin
if(clock==1)
data_out<=x;
else if(clock==0)
data_out<=y;
end
endmodule

module pos_opr (reset,clock,wr,rd,wr_add,rd_add,data_in,data_out);  //module for only posedge circuit
input reset,clock,wr,rd;
input[2:0]wr_add,rd_add;
input[7:0]data_in;
output reg[7:0]data_out;
integer i;
reg[7:0]mem[15:0];
always@(posedge clock)
begin
if(reset)
 for(i=0;i<15;i=i+1)
  begin
   mem[i]<=0;
  end
else
  begin
   if(wr)
     mem[wr_add]<=data_in;
   else if(rd)
    data_out<=mem[rd_add];
  end
end
endmodule

module neg_opr(reset,clock,rd,wr,rd_add,wr_add,data_in,data_out);//module for only negedge circuit
input reset,clock,rd,wr;
input[2:0]rd_add,wr_add;
input[7:0]data_in;
output reg[7:0]data_out;
reg[7:0]mem[15:0];
integer i;
always@(negedge clock)
begin
if(reset)
 begin
  for(i=0;i<15;i=i+1)
  mem[i]<=0;
 end
else
begin
if(wr)
begin
 mem[wr_add]<=data_in;
end
else if(rd)
begin
 data_out<=mem[rd_add];
end
end
end
endmodule