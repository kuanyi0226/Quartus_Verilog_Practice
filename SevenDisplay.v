//Seven Display: transfer the counter into seven-seg display
module SevenDisplay(count, out);
input [3:0] count;
output [6:0] out;

reg [6:0] out;

always @(count)
begin
	case(count)
		4'b0001: out = 7'b1111001;//1
		4'b0010: out = 7'b1111001;//2
		4'b0011: out = 7'b1111001;//3
		4'b0100: out = 7'b1111001;//4
		4'b0101: out = 7'b1111001;//5
		4'b0110: out = 7'b1111001;//6
		4'b0111: out = 7'b1111001;//7
		4'b1000: out = 7'b1111001;//8
		4'b1001: out = 7'b1111001;//9
		4'b1010: out = 7'b1111001;//10
		4'b1011: out = 7'b1111001;//11
		4'b1100: out = 7'b1111001;//12
		4'b1101: out = 7'b1111001;//13
		4'b1110: out = 7'b1111001;//14
		4'b1111: out = 7'b1111001;//15
		default: out = 7'b1000000;//else
	endcase




end


endmodule