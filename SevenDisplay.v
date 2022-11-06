//Seven Display: transfer the output from MooreMachine into seven-seg display

module SevenDisplay(Out_Data, Seven_Out);
input [2:0] Out_Data;
output [6:0] Seven_Out;

reg [6:0] Seven_Out;

always @(Out_Data)
begin
	case(Out_Data)
		3'b001: Seven_Out = 7'b1111001;//1
		3'b010: Seven_Out = 7'b0100100;//2
		3'b011: Seven_Out = 7'b0110000;//3
		3'b100: Seven_Out = 7'b0011001;//4
		3'b101: Seven_Out = 7'b0010010;//5
		default: Seven_Out = 7'b1000000;//else(include 0)
	endcase

end


endmodule