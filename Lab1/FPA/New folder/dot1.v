module dot(gout,gl,al,gr);
output gout;
input gr,gl,al;
assign gout = gl | (al & gr);
endmodule
