module cache_tb();

reg [21:0]a;
wire s;

direct_mapping d1(a,s);

initial
begin
a=22'b0000_0000_0000_0111_0000_00;
end
/*
initial
begin
$monitor($time, "%b %b", a,s);
end
*/
endmodule