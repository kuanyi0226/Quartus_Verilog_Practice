module Lab5_2_encoder(in,out,valid);
input [7:0]in;
output valid;
output [2:0]out;
reg valid;
reg [2:0]out;

always @(in)
begin
case(in)
8'h01: out = 3'b000;
8'h02: out = 3'b001;
8'h04: out = 3'b010;
8'h08: out = 3'b011;
8'h10: out = 3'b100;
8'h20: out = 3'b101;
8'h40: out = 3'b110;
8'h80: out = 3'b111;
default: out = 3'b000;
endcase

if(out == 3'b000 && in != 8'h01)
	begin
	valid = 1'b0;
	end
else
	begin
	valid = 1'b1;
	end


end
endmodule