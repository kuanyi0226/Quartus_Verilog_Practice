//Counter:
module Counter(clk, reset, updown, count);
input clk, reset, updown;
output [3:0] count; //0~15

reg [3:0] count;

always @(clk)
begin 
	if (!reset)
	begin
		count = 4'b0000;
	end
	
	else
	begin
		if(updown)
		begin
			count = count +1;
		end
		
		else
		begin
			count = count -1;
		end
		
	end
	
end


endmodule
