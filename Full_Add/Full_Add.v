module Full_Add(sum, c_out, a, b, c_in);
input a, b, c_in;
output sum, c_out;
reg sum, c_out;

always @(a,b,c_in)
begin
	sum = ((a^b) ^ c_in);
	c_out = (a&b | (a^b)& c_in);
end


endmodule


