//Lab5_1_add_minus
module Lab5_1_add_minus(a, b, select, out, overflow);

input[3:0] a;
input[3:0] b;
input select;
output[3:0] out;
output overflow;

reg[3:0] out;
reg overflow;

always@(a, b, select)
begin
out = (select == 1)? a+b: a-b;
if ((select == 1 && a+b >= 5'b 10000)||(select == 0 && a<b ))
	overflow = 1;
else
	overflow = 0;
end

endmodule 