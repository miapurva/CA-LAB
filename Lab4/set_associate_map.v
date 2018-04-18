
module set_associative_map(addr,check);

input [11:0]addr;
output check;
reg check;
reg result1,result2,result3,result4,result5,result6,result7,result8;
wire [31:0]mainmem[127:0];
wire [31:0]cache[7:0];
wire [5:0]tag[7:0];

integer i,j,k;


	assign mainmem[	0	]=32'd0	;
	assign mainmem[	1	]=32'd1	;
	assign mainmem[	2	]=32'd2	;
	assign mainmem[	3	]=32'd	3	;
	assign mainmem[	4	]=32'd	4	;
	assign mainmem[	5	]=32'd	5	;
	assign mainmem[	6	]=32'd	6	;
	assign mainmem[	7	]=32'd	7	;
	assign mainmem[	8	]=32'd	8	;
	assign mainmem[	9	]=32'd	9	;
	assign mainmem[	10	]=32'd	10	;
	assign mainmem[	11	]=32'd	11	;
	assign mainmem[	12	]=32'd	12	;
	assign mainmem[	13	]=32'd	13	;
	assign mainmem[	14	]=32'd	14	;
	assign mainmem[	15	]=32'd	15	;
	assign mainmem[	16	]=32'd	16	;
	assign mainmem[	17	]=32'd	17	;
	assign mainmem[	18	]=32'd	18	;
	assign mainmem[	19	]=32'd	19	;
	assign mainmem[	20	]=32'd	20	;
	assign mainmem[	21	]=32'd	21	;
	assign mainmem[	22	]=32'd	22	;
	assign mainmem[	23	]=32'd	23	;
	assign mainmem[	24	]=32'd	24	;
	assign mainmem[	25	]=32'd	25	;
	assign mainmem[	26	]=32'd	26	;
	assign mainmem[	27	]=32'd	27	;
	assign mainmem[	28	]=32'd	28	;
	assign mainmem[	29	]=32'd	29	;
	assign mainmem[	30	]=32'd	30	;
	assign mainmem[	31	]=32'd	31	;
	assign mainmem[	32	]=32'd	32	;
	assign mainmem[	33	]=32'd	33	;
	assign mainmem[	34	]=32'd	34	;
	assign mainmem[	35	]=32'd	35	;
	assign mainmem[	36	]=32'd	36	;
	assign mainmem[	37	]=32'd	37	;
	assign mainmem[	38	]=32'd	38	;
	assign mainmem[	39	]=32'd	39	;
	assign mainmem[	40	]=32'd	40	;
	assign mainmem[	41	]=32'd	41	;
	assign mainmem[	42	]=32'd	42	;
	assign mainmem[	43	]=32'd	43	;
	assign mainmem[	44	]=32'd	44	;
	assign mainmem[	45	]=32'd	45	;
	assign mainmem[	46	]=32'd	46	;
	assign mainmem[	47	]=32'd	47	;
	assign mainmem[	48	]=32'd	48	;
	assign mainmem[	49	]=32'd	49	;
	assign mainmem[	50	]=32'd	50	;
	assign mainmem[	51	]=32'd	51	;
	assign mainmem[	52	]=32'd	52	;
	assign mainmem[	53	]=32'd	53	;
	assign mainmem[	54	]=32'd	54	;
	assign mainmem[	55	]=32'd	55	;
	assign mainmem[	56	]=32'd	56	;
	assign mainmem[	57	]=32'd	57	;
	assign mainmem[	58	]=32'd	58	;
	assign mainmem[	59	]=32'd	59	;
	assign mainmem[	60	]=32'd	60	;
	assign mainmem[	61	]=32'd	61	;
	assign mainmem[	62	]=32'd	62	;
	assign mainmem[	63	]=32'd	63	;
	assign mainmem[	64	]=32'd	64	;
	assign mainmem[	65	]=32'd	65	;
	assign mainmem[	66	]=32'd	66	;
	assign mainmem[	67	]=32'd	67	;
	assign mainmem[	68	]=32'd	68	;
	assign mainmem[	69	]=32'd	69	;
	assign mainmem[	70	]=32'd	70	;
	assign mainmem[	71	]=32'd	71	;
	assign mainmem[	72	]=32'd	72	;
	assign mainmem[	73	]=32'd	73	;
	assign mainmem[	74	]=32'd	74	;
	assign mainmem[	75	]=32'd	75	;
	assign mainmem[	76	]=32'd	76	;
	assign mainmem[	77	]=32'd	77	;
	assign mainmem[	78	]=32'd	78	;
	assign mainmem[	79	]=32'd	79	;
	assign mainmem[	80	]=32'd	80	;
	assign mainmem[	81	]=32'd	81	;
	assign mainmem[	82	]=32'd	82	;
	assign mainmem[	83	]=32'd	83	;
	assign mainmem[	84	]=32'd	84	;
	assign mainmem[	85	]=32'd	85	;
	assign mainmem[	86	]=32'd	86	;
	assign mainmem[	87	]=32'd	87	;
	assign mainmem[	88	]=32'd	88	;
	assign mainmem[	89	]=32'd	89	;
	assign mainmem[	90	]=32'd	90	;
	assign mainmem[	91	]=32'd	91	;
	assign mainmem[	92	]=32'd	92	;
	assign mainmem[	93	]=32'd	93	;
	assign mainmem[	94	]=32'd	94	;
	assign mainmem[	95	]=32'd	95	;
	assign mainmem[	96	]=32'd	96	;
	assign mainmem[	97	]=32'd	97	;
	assign mainmem[	98	]=32'd	98	;
	assign mainmem[	99	]=32'd	99	;
	assign mainmem[	100	]=32'd	100	;
	assign mainmem[	101	]=32'd	101	;
	assign mainmem[	102	]=32'd	102	;
	assign mainmem[	103	]=32'd	103	;
	assign mainmem[	104	]=32'd	104	;
	assign mainmem[	105	]=32'd	105	;
	assign mainmem[	106	]=32'd	106	;
	assign mainmem[	107	]=32'd	107	;
	assign mainmem[	108	]=32'd	108	;
	assign mainmem[	109	]=32'd	109	;
	assign mainmem[	110	]=32'd	110	;
	assign mainmem[	111	]=32'd	111	;
	assign mainmem[	112	]=32'd	112	;
	assign mainmem[	113	]=32'd	113	;
	assign mainmem[	114	]=32'd	114	;
	assign mainmem[	115	]=32'd	115	;
	assign mainmem[	116	]=32'd	116	;
	assign mainmem[	117	]=32'd	117	;
	assign mainmem[	118	]=32'd	118	;
	assign mainmem[	119	]=32'd	119	;
	assign mainmem[	120	]=32'd	120	;
	assign mainmem[	121	]=32'd	121	;
	assign mainmem[	122	]=32'd	122	;
	assign mainmem[	123	]=32'd	123	;
	assign mainmem[	124	]=32'd	124	;
	assign mainmem[	125	]=32'd	125	;
	assign mainmem[	126	]=32'd	126	;
	assign mainmem[	127	]=32'd	127	;

	//cache
	
	assign	cache[0]=32'd 1;
	assign	cache[1]=32'd 2;
	assign	cache[2]=32'd 3;
	assign	cache[3]=32'd 4;
	assign	cache[4]=32'd 1;
	assign	cache[5]=32'd 2;
	assign	cache[6]=32'd 3;
	assign	cache[7]=32'd 4;

	assign tag[0]=6'd56;
	assign tag[1]=6'd11;
	assign tag[2]=6'd50;
	assign tag[3]=6'd42;
	assign tag[4]=6'd61;
	assign tag[5]=6'd18;
	assign tag[6]=6'd59;
	assign tag[7]=6'd8;

/*
always @ (addr[5])
	k=addr[5];
*/
//always @ (k)
/*
initial
begin
	if(addr[5]==0)
	begin
		compare a1(tag[0],addr[11:6],result1);
		compare a2(tag[1],addr[11:6],result2);
		compare a3(tag[2],addr[11:6],result3);
		compare a4(tag[3],addr[11:6],result4);
		assign check=result1|result2|result3|result4;
		#10 $display("Checkbit =%b ",check);
	end
	else
	begin
		compare a5(tag[5],addr[11:6],result5);
		compare a6(tag[6],addr[11:6],result6);
		compare a7(tag[7],addr[11:6],result7);
		compare a8(tag[8],addr[11:6],result8);
		assign check=result5|result6|result7|result8;
		#10 $display("Checkbit =%b ",check);
	end
end
*/
integer p;
initial
begin
assign p=addr[5];
end

always @ (p)
begin
	//compare a5(tag[5],addr[11:6],result5);
	if(tag[4]==addr[11:6])
	begin
		result5=1'b1;
	end
	else
	begin
		result5=1'b0;
	end
	//compare a6(tag[6],addr[11:6],result6);
	if(tag[5]==addr[11:6])
	begin
		result6=1'b1;
	end
	else
	begin
		result6=1'b0;
	end
	//compare a7(tag[7],addr[11:6],result7);
	if(tag[6]==addr[11:6])
	begin
		result7=1'b1;
	end
	else
	begin
		result7=1'b0;
	end
	//compare a8(tag[8],addr[11:6],result8);
	if(tag[7]==addr[11:6])
	begin
		result8=1'b1;
	end
	else
	begin
		result8=1'b0;
	end
	check=result5|result6|result7|result8;
	//$display("Checkbit =%b ",check);
end

always @ (~p)
begin
	//compare a1(tag[0],addr[11:6],result1);
	if(tag[0]==addr[11:6])
	begin
		result1=1'b1;
	end
	else
	begin
		result1=1'b0;
	end
	//compare a2(tag[1],addr[11:6],result2);
	if(tag[1]==addr[11:6])
	begin
		result2=1'b1;
	end
	else
	begin
		result2=1'b0;
	end
	//compare a3(tag[2],addr[11:6],result3);
	if(tag[2]==addr[11:6])
	begin
		result3=1'b1;
	end
	else
	begin
		result3=1'b0;
	end
	//compare a4(tag[3],addr[11:6],result4);
	if(tag[3]==addr[11:6])
	begin
		result4=1'b1;
	end
	else
	begin
		result4=1'b0;
	end
	check=result1|result2|result3|result4;
	//$display("Checkbit =%b ",check);
end

endmodule