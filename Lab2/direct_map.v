module direct_mapping(in,p);

input [21:0]in;
output p;
reg p;

reg [127:0]memory[262143:0];
reg [127:0]cache[4095:0];
reg [5:0]tag[4095:0];
	
integer i;

initial
begin
	for(i=0;i<=262143;i=i+1)
	begin
		memory[i][7:0]=8'b00000000;
		memory[i][15:8]=8'b00000001;
		memory[i][23:16]=8'b00000010;
		memory[i][31:24]=8'b00000011;
		memory[i][39:32]=8'b00000100;
		memory[i][47:40]=8'b00000101;
		memory[i][55:48]=8'b00000110;
		memory[i][63:56]=8'b00000111;
		memory[i][71:64]=8'b00001000;
		memory[i][79:72]=8'b00001001;
		memory[i][87:80]=8'b00001010;
		memory[i][95:88]=8'b00001011;
		memory[i][103:96]=8'b00001100;
		memory[i][111:104]=8'b00001101;
		memory[i][119:112]=8'b00001110;
		memory[i][127:120]=8'b00001111;
	end
		
	for(i=0;i<4095;i=i+1)
	begin
		tag[i]=6'b000010;
		
	end
	
	for(i=0;i<4095;i=i+1)
	begin
		cache[i][7:0]=8'b00000000;
		cache[i][15:8]=8'b00000001;
		cache[i][23:16]=8'b00000010;
		cache[i][31:24]=8'b00000011;
		cache[i][39:32]=8'b00000100;
		cache[i][47:40]=8'b00000101;
		cache[i][55:48]=8'b00000110;
		cache[i][63:56]=8'b00000111;
		cache[i][71:64]=8'b00001000;
		cache[i][79:72]=8'b00001001;
		cache[i][87:80]=8'b00001010;
		cache[i][95:88]=8'b00001011;
		cache[i][103:96]=8'b00001100;
		cache[i][111:104]=8'b00001101;
		cache[i][119:112]=8'b00001110;
		cache[i][127:120]=8'b00001111;
	end
end

integer j;

always @ (in[15:4])
	j=in[15:4];
	
always @ (j)
begin
	if(tag[j]==in[21:16])
	begin
		p=1'b1;
	end
	else
	begin
		p=1'b0;
	end
end

reg [127:0]bus;


integer k;
/*
always @ (~p)
begin
	k=in[21:4];
	bus[7:0]=8'd0;
	bus[7:0]=memory[k][7:0];
	cache[j]=bus;
	tag[j]=in[21:16];
end
*/

always @ (~p)
begin
	k=in[21:4];
	cache[j]=memory[k];
end

initial
begin
#10 $display("%d %b %b \t %d \n %b \n %b \n %b \n Cache hit/miss(1|0)=%b", j, tag[i], in[21:16], k, memory[k], bus, cache[j], p);
end

endmodule