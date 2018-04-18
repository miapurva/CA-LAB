//32-BIT FLOATING POINT MULTIPLIER
//http://ijves.com/wp-content/uploads/2012/07/IJVES-Y13-07139.pdf
//iverilog -o test pre_dot.v pre_circle.v prefixad32.v twoscomp.v csa.v sub.v multiplier1.v fpmultiplier.v fpmultiplier_tb.v
module fpmultiplier(A,B,num3,clk);

input [31:0]A,B;
input clk;
output [31:0]num3;
//sign bit
wire s1,s2;
wire s3;
/*assign s1=A[31];
assign s2=B[31];*/
//assign s3=s1^s2;
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
wire [31:0]a,na,inter,inter1;
wire cout,cout1;
assign e1[7:0]=exp1[7:0];
assign e1[31:8]=0;
assign e2[7:0]=exp2[7:0];
assign e2[31:8]=0;
assign a=32'b01111111; //subtract 127 because 2 biased exponenets are added
/*prefix16 p1(inter,cout1,e1,e2,1'b0,clk);//2 biased exponenets are added
subp sss1(e3,cout,inter,a,clk);*/

wire [31:0]nm1,nm2,nm3,nm4,nm5,nm6,nm7,nm8,nm9;
wire sd1;
wire dm1,dm2,dm3,dm4,dm5,dm6,dm7,dm8,si1,si2,si3,si4,si5,si6,si7,si8,si9,si10,si11,si12,si13,si14,si15,si16,si17,si18,si19,si20;
//Mantissa multiply
wire [31:0]m1,m2;
wire [63:0]m3;
assign m1[22:0]=man1[22:0];
assign m1[23]=1;
assign m1[31:24]=0;
assign m2[22:0]=man2[22:0];
assign m2[23]=1;
assign m2[31:24]=0;
multiplierp mrtr(m1,m2,m3,clk);
prefix16 p1(inter,cout1,e1,e2,1'b0,clk);//2 biased exponenets are added
subp sss1(e3,cout,inter,a,clk);

//9 stage dff
dff32 df1(e3,clk,nm1);
dff32 df2(nm1,clk,nm2);
dff32 df3(nm2,clk,nm3);
dff32 df4(nm3,clk,nm4);
dff32 df5(nm4,clk,nm5);
dff32 df6(nm5,clk,nm6);
dff32 df7(nm6,clk,nm7);
dff32 df8(nm7,clk,nm8);
dff32 df9(nm8,clk,nm9);

//cout 8 stages
dff df10(dm1,clk,cout);
dff df11(dm2,clk,dm1);
dff df12(dm3,clk,dm2);
dff df13(dm4,clk,dm3);
dff df14(dm5,clk,dm4);
dff df15(dm6,clk,dm5);
dff df16(dm7,clk,dm6);
dff df17(dm8,clk,dm7);
dff df18(dm9,clk,dm8);

//sign 19 stages
assign s1=A[31];
assign s2=B[31];
assign s3=s1^s2;
//dff ss1(s3,clk,sd1);
dff dii1(si1,clk,s3);
dff dii2(si2,clk,si1);
dff dii3(si3,clk,si2);
dff dii4(si4,clk,si3);
dff dii5(si5,clk,si4);
dff dii6(si6,clk,si5);
dff dii7(si7,clk,si6);
dff dii8(si8,clk,si7);
dff dii9(si9,clk,si8);
dff dii10(si10,clk,si9);
dff dii11(si11,clk,si10);
dff dii12(si12,clk,si11);
dff dii13(si13,clk,si12);
dff dii14(si14,clk,si13);
dff dii15(si15,clk,si14);
dff dii16(si16,clk,si15);
dff dii17(si17,clk,si16);
dff dii18(si18,clk,si17);
dff dii19(si19,clk,si18);

//multiplier mrtr(m1,m2,m3,clk);
//assign man3[22:0]=m3[45:23];
//assign man3=m3;

always@*
begin
if(m3[46] == 1 && m3[47]==0)
begin
 man3[22:0] = m3[45:23];
 exp3[7:0] = nm9[7:0];
end
if(m3[47] == 1)
begin
 man3[22:0] = m3[46:24];
 exp3[7:0] = nm9[7:0];
 exp3[7:0] = exp3[7:0]+1;
end
end

//sign bit s1 xor s2
//assign s3=s1^s2;
assign num3[31]=si19;
assign num3[30:23]=exp3[7:0];
assign num3[22:0]=man3[22:0];

endmodule