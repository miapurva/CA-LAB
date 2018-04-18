//32-BIT FLOATING POINT MULTIPLIER
//http://ijves.com/wp-content/uploads/2012/07/IJVES-Y13-07139.pdf
//iverilog -o test pre_dot.v pre_circle.v prefixad32.v twoscomp.v csa.v sub.v multiplier1.v fpmultiplier.v fpmultiplier_tb.v
module fpmultiplier(A,B,num3);

input [31:0]A,B;
output [31:0]num3;
//sign bit
wire s1,s2,s3;
assign s1=A[31];
assign s2=B[31];
//exponent
wire [7:0]exp1,exp2;
reg [7:0]exp3;
assign exp1[7:0]=A[30:23];
assign exp2[7:0]=B[30:23];
wire [4:0]sel;
//mantissa
wire [22:0]man1,man2;
reg [22:0]man3;
assign man1[22:0]=A[22:0];
assign man2[22:0]=B[22:0];

//Exponent manipulation
wire [31:0]e1,e2,e3,ep3;
wire [31:0]a,na,inter;
wire cout,cout1;
assign e1[7:0]=exp1[7:0];
assign e1[31:8]=0;
assign e2[7:0]=exp2[7:0];
assign e2[31:8]=0;
assign a=32'b01111111; //subtract 127 because 2 biased exponenets are added
pre32 p1(inter,cout1,e1,e2,1'b0);//2 biased exponenets are added
sub sss1(inter,a,e3,cout);

//Mantissa multiply
wire [31:0]m1,m2;
wire [64:0]m3;
assign m1[22:0]=man1[22:0];
assign m1[23]=1;
assign m1[31:24]=0;
assign m2[22:0]=man2[22:0];
assign m2[23]=1;
assign m2[31:24]=0;
multiplier mm1(m1,m2,m3);
//assign man3[22:0]=m3[45:23];
//assign man3=m3;

always@*
begin
if(m3[46] == 1 && m3[47]==0)
begin
 man3[22:0] = m3[45:23];
 exp3[7:0] = e3[7:0];
end
if(m3[47] == 1)
begin
 man3[22:0] = m3[46:24];
 exp3[7:0] = e3[7:0];
 exp3[7:0] = exp3[7:0]+1;
end
end

//sign bit s1 xor s2
assign s3=s1^s2;
assign num3[31]=s3;
assign num3[30:23]=exp3[7:0];
assign num3[22:0]=man3[22:0];

endmodule