module sub(x,y,s1,cout);

input [31:0]x,y;
input clk;
output [31:0]s1;
reg [31:0]s1;
wire [31:0]s;
wire [31:0]y2;
//output [31:0]y2;
//output [31:0]s;
wire [31:0]y1,y3,y4,y5;
wire arrrrr;
output cout;
wire cin;
assign cin=1'b0;
twoscomp t(y,y1);
pre32 p(s,cout,x,y1,cin);
//assign arrrrr=s[31];

always@*
begin
if(cout == 1'b0)
begin
 s1=~s;
 s1=s1+1;
end
if(cout == 1'b1)
 s1=s; 
end
endmodule