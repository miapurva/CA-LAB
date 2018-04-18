module pre_dot(gl,al,gr,gout);

input gl,al,gr;
output gout;

assign gout=gl|(al&gr);

endmodule
