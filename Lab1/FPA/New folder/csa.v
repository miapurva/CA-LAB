module csa(p0,p1,p2,u,v);

input [63:0]p0,p1,p2;
//input clk;
output [63:0]u,v;

assign v[0]=0; 
assign u=p0 ^ p1 ^ p2;
assign v[63:1]=(p0 & p1) | (p1 & p2 ) | (p2 & p0);
endmodule