module Half_Add(a,b,sum,carry);
input a, b;
output sum, carry;
reg sum, carry;

always @(a,b)
begin 
	sum = (a^b);
	carry = (a&b);

end



endmodule