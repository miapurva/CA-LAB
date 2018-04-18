 
module associativemaptest();

reg[11:0]addr;
wire check; 

associativemap d1(addr,check);
initial
begin
addr=12'b110110110000;
#10
addr=12'b000000000111;
#10
addr=12'b000100000111;
end

initial
begin
$monitor($time,"addr:%d ,check:%d" ,addr,check);
end

endmodule