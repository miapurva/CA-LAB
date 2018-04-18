module pre_circle(gl,al,gr,ar,gout,aout);

input gl,al,gr,ar;
output gout,aout;

assign gout=gl |(gr&al);
assign aout=al&ar;

endmodule

