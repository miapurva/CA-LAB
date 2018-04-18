module compare(tagbit,addr,out);
input [5:0]tagbit,addr;
output out;
reg out;
 


always@*
begin
if(tagbit==addr)
  begin
  out=1'b1;
  end
else
  begin
  out=1'b0;
  end
end


endmodule