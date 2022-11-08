module MooreMachine(Clk, Reset, In_Data, Out_Data);
input Clk, Reset, In_Data;
output [3:0] Out_Data;

reg[3:0] Out_Data;
reg[2:0] State, NextState;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

//State Register
always @(posedge Clk or negedge Reset) //notice: Reset must be negedge
begin 
	if(!Reset)
		State = S0;
	else
		State = NextState;
end

//Next State Logic
always @(In_Data or State)
begin
	case(State)
		S0:begin
				if(In_Data == 0)
					NextState = S1;
				else
					NextState = S3;
			end
		S1:begin
				if(In_Data == 0)
					NextState = S2;
				else
					NextState = S5;
			end
		S2:begin
				if(In_Data == 0)
					NextState = S3;
				else
					NextState = S0;	
			end
		S3:begin
				if(In_Data == 0)
					NextState = S4;
				else
					NextState = S1;	
			end
		S4:begin
				if(In_Data == 0)
					NextState = S5;
				else
					NextState = S2;	
			end
		S5:begin
				if(In_Data == 0)
					NextState = S0;
				else
					NextState = S4;	
			end
	
	endcase
end

//Output logic
always @(State)
begin
	case(State)
		S0: Out_Data = 4'b0000;
		S1: Out_Data = 4'b0001;
		S2: Out_Data = 4'b0010;
		S3: Out_Data = 4'b0011;
		S4: Out_Data = 4'b0100;
		S5: Out_Data = 4'b0101;
		default: Out_Data = 4'b0000;
	endcase

end

endmodule