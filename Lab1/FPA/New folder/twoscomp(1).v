module twoscomp(a,out1);

input [31:0]a;
wire [31:0]out;
output [31:0]out1;
wire cout;
//input clk;

assign out=~a;
//dff32 d1(out,clk,out1);
pre32 p(out1,cout,out,32'd0,1'b1);
endmodule