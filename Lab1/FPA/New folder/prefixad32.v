module pre32(s,cout,x,y,cin,clk);

output [31:0]s;
output cout;
input [31:0]x,y;
input cin,clk;

wire [31:0]g,a,p;
wire [48:0]g1,a1;
wire [31:0]c; 
assign c[0]=cin;

//CALCULATING g,a,p VALUES
assign g=x&y;
assign p=x^y;
assign a=g|p;

//stage 1

pre_dot d1(g[0],a[0],c[0],c[1]);
pre_circle c1(g[2],a[2],g[1],a[1],g1[0],a1[0]);
pre_circle c2(g[4],a[4],g[3],a[3],g1[1],a1[1]);
pre_circle c3(g[6],a[6],g[5],a[5],g1[2],a1[2]);
pre_circle c4(g[8],a[8],g[7],a[7],g1[3],a1[3]);
pre_circle c5(g[10],a[10],g[9],a[9],g1[4],a1[4]);
pre_circle c6(g[12],a[12],g[11],a[11],g1[5],a1[5]);
pre_circle c7(g[14],a[14],g[13],a[13],g1[6],a1[6]);
pre_circle c8(g[16],a[16],g[15],a[15],g1[7],a1[7]);
pre_circle c9(g[18],a[18],g[17],a[17],g1[8],a1[8]);
pre_circle c10(g[20],a[20],g[19],a[19],g1[9],a1[9]);
pre_circle c11(g[22],a[22],g[21],a[21],g1[10],a1[10]);
pre_circle c12(g[24],a[24],g[23],a[23],g1[11],a1[11]);
pre_circle c13(g[26],a[26],g[25],a[25],g1[12],a1[12]);
pre_circle c14(g[28],a[28],g[27],a[27],g1[13],a1[13]);
pre_circle c15(g[30],a[30],g[29],a[29],g1[14],a1[14]);

//stage 2
pre_dot d2(g[1],a[1],c[1],c[2]);
pre_dot d3(g1[0],a1[0],c[1],c[3]);
pre_circle c16(g[5],a[5],g1[1],a1[1],g1[15],a1[15]);
pre_circle c17(g1[2],a1[2],g1[1],a1[1],g1[16],a1[16]);
pre_circle c18(g[9],a[9],g1[3],a1[3],g1[17],a1[17]);
pre_circle c19(g1[4],a1[4],g1[3],a1[3],g1[18],a1[18]);
pre_circle c20(g[13],a[13],g1[5],a1[5],g1[19],a1[19]);
pre_circle c21(g1[6],a1[6],g1[5],a1[5],g1[20],a1[20]);
pre_circle c22(g[17],a[17],g1[7],a1[7],g1[21],a1[21]);
pre_circle c23(g1[8],a1[8],g1[7],a1[7],g1[22],a1[22]);
pre_circle c24(g[21],a[21],g1[9],a1[9],g1[23],a1[23]);
pre_circle c25(g1[10],a1[10],g1[9],a1[9],g1[24],a1[24]);
pre_circle c26(g[25],a[25],g1[11],a1[11],g1[25],a1[25]);
pre_circle c27(g1[12],a1[12],g1[11],a1[11],g1[26],a1[26]);
pre_circle c28(g[29],a[29],g1[13],a1[13],g1[27],a1[27]);
pre_circle c29(g1[14],a1[14],g1[13],a1[13],g1[28],a1[28]);

//stage 3
pre_dot d4(g[3],a[3],c[3],c[4]);
pre_dot d5(g1[1],a1[1],c[3],c[5]);
pre_dot d6(g1[15],a1[15],c[3],c[6]);
pre_dot d7(g1[16],a1[16],c[3],c[7]);
pre_circle c30(g[11],a[11],g1[18],a1[18],g1[29],a1[29]);
pre_circle c31(g1[5],a1[5],g1[18],a1[18],g1[30],a1[30]);
pre_circle c32(g1[19],a1[19],g1[18],a1[18],g1[31],a1[31]);
pre_circle c33(g1[20],a1[20],g1[18],a1[18],g1[32],a1[32]);
pre_circle c34(g[19],a[19],g1[22],a1[22],g1[33],a1[33]);
pre_circle c35(g1[9],a1[9],g1[22],a1[22],g1[34],a1[34]);
pre_circle c36(g1[23],a1[23],g1[22],a1[22],g1[35],a1[35]);
pre_circle c37(g1[24],a1[24],g1[22],a1[22],g1[36],a1[36]);
pre_circle c38(g[27],a[27],g1[26],a1[26],g1[37],a1[37]);
pre_circle c39(g1[13],a1[13],g1[26],a1[26],g1[38],a1[38]);
pre_circle c40(g1[27],a1[27],g1[26],a1[26],g1[39],a1[39]);
pre_circle c41(g1[28],a1[28],g1[26],a1[26],g1[40],a1[40]);

//stage 4
pre_dot d8(g[7],a[7],c[7],c[8]);
pre_dot d9(g1[3],a1[3],c[7],c[9]);
pre_dot d10(g1[17],a1[17],c[7],c[10]);
pre_dot d11(g1[18],a1[18],c[7],c[11]);
pre_dot d12(g1[29],a1[29],c[7],c[12]);
pre_dot d13(g1[30],a1[30],c[7],c[13]);
pre_dot d14(g1[31],a1[31],c[7],c[14]);
pre_dot d15(g1[32],a1[32],c[7],c[15]);
pre_circle c42(g[23],a[23],g1[36],a1[36],g1[41],a1[41]);
pre_circle c43(g1[11],a1[11],g1[36],a1[36],g1[42],a1[42]);
pre_circle c44(g1[25],a1[25],g1[36],a1[36],g1[43],a1[43]);
pre_circle c45(g1[26],a1[26],g1[36],a1[36],g1[44],a1[44]);
pre_circle c46(g1[37],a1[37],g1[36],a1[36],g1[45],a1[45]);
pre_circle c47(g1[38],a1[38],g1[36],a1[36],g1[46],a1[46]);
pre_circle c48(g1[39],a1[39],g1[36],a1[36],g1[47],a1[47]);
pre_circle c49(g1[40],a1[40],g1[36],a1[36],g1[48],a1[48]);

//stage 5
pre_dot d16(g[15],a[15],c[15],c[16]);
pre_dot d17(g1[7],a1[7],c[15],c[17]);
pre_dot d18(g1[21],a1[21],c[15],c[18]);
pre_dot d19(g1[22],a1[22],c[15],c[19]);
pre_dot d20(g1[33],a1[33],c[15],c[20]);
pre_dot d21(g1[34],a1[34],c[15],c[21]);
pre_dot d22(g1[35],a1[35],c[15],c[22]);
pre_dot d23(g1[36],a1[36],c[15],c[23]);
pre_dot d24(g1[41],a1[41],c[15],c[24]);
pre_dot d25(g1[42],a1[42],c[15],c[25]);
pre_dot d26(g1[43],a1[43],c[15],c[26]);
pre_dot d27(g1[44],a1[44],c[15],c[27]);
pre_dot d28(g1[45],a1[45],c[15],c[28]);
pre_dot d29(g1[46],a1[46],c[15],c[29]);
pre_dot d30(g1[47],a1[47],c[15],c[30]);
pre_dot d31(g1[48],a1[48],c[15],c[31]);

//stage 6
 pre_dot d32(g[31],a[31],c[31],cout);

assign s=p^c;

endmodule