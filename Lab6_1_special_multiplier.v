module Lab6_1_special_multiplier(in, out);
input [3:0] in; //4-bit input(0~15)
output [6:0] out; //7-bit output, for seven-segment display
reg [6:0] out;
//out: gfedcba

always @(in)
begin
case(in)
//0~2: same as input
4'b0000: out = 7'b0111111;//0
4'b0001: out = 7'b0000110;//1
4'b0010: out = 7'b1011011;//2
//3~5: *2+1
4'b0011: out = 7'b0000111;//7
4'b0100: out = 7'b1101111;//9
4'b0101: out = 7'b1111100;//11,b
//6~8: *2-1
4'b0110: out = 7'b1111100;//11,b
4'b0111: out = 7'b1011110;//13,d
4'b1000: out = 7'b1110001;//15,F
//else: 0
default: out = 7'b0111111;//0
endcase

end

endmodule