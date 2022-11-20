//Seven Display: transfer the output from MooreMachine into seven-seg display
//notice: seven-display's input must be "4-bit"
module SevenDisplay(Out_Data, Seven_Out);
input [3:0] Out_Data;
output [6:0] Seven_Out;

reg [6:0] Seven_Out;

always @(Out_Data)
begin
	case(Out_Data)
		4'b0001: Seven_Out = 7'b1111001;//1
		4'b0010: Seven_Out = 7'b0100100;//2
		4'b0011: Seven_Out = 7'b0110000;//3
		4'b0100: Seven_Out = 7'b0011001;//4
		4'b0101: Seven_Out = 7'b0010010;//5
		default: Seven_Out = 7'b1000000;//else(include 0)
	endcase

end


endmodule