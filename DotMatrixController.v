module DotMatrixController(div_clk, rst, gyr, dot_row, dot_col);
input div_clk, rst; 
input [2:0] gyr;
output [7:0] dot_row;
output [7:0] dot_col;

reg [7:0] dot_row;
reg [7:0] dot_col;
reg [2:0] row_count;

always@ (posedge div_clk or negedge rst)
begin
	if(~rst) begin
		dot_row <= 8'b0;
		dot_col <= 8'b0;
		row_count <= 0;
	end
	else begin
		case(gyr)
			//green
			3'd0: begin
						row_count <= row_count + 1;
						case(row_count)//row
							3'd0: dot_row <= 8'b01111111;
							3'd1: dot_row <= 8'b10111111;
							3'd2: dot_row <= 8'b11011111;
							3'd3: dot_row <= 8'b11101111;
							3'd4: dot_row <= 8'b11110111;
							3'd5: dot_row <= 8'b11111011;
							3'd6: dot_row <= 8'b11111101;
							3'd7: dot_row <= 8'b11111110;
						endcase
						case(row_count)//col
							3'd0: dot_col <= 8'b00001100;
							3'd1: dot_col <= 8'b00001100;
							3'd2: dot_col <= 8'b00011001;
							3'd3: dot_col <= 8'b01111110;
							3'd4: dot_col <= 8'b10011000;
							3'd5: dot_col <= 8'b00011000;
							3'd6: dot_col <= 8'b00101000;
							3'd7: dot_col <= 8'b01001000;	
						endcase
					end
			//yellow
			3'd1: begin
						row_count <= row_count + 1;
						case(row_count)//row
							3'd0: dot_row <= 8'b01111111;
							3'd1: dot_row <= 8'b10111111;
							3'd2: dot_row <= 8'b11011111;
							3'd3: dot_row <= 8'b11101111;
							3'd4: dot_row <= 8'b11110111;
							3'd5: dot_row <= 8'b11111011;
							3'd6: dot_row <= 8'b11111101;
							3'd7: dot_row <= 8'b11111110;
						endcase
						case(row_count)//col
							3'd0: dot_col <= 8'b00000000;
							3'd1: dot_col <= 8'b00100100;
							3'd2: dot_col <= 8'b00111100;
							3'd3: dot_col <= 8'b10111101;
							3'd4: dot_col <= 8'b11111111;
							3'd5: dot_col <= 8'b00111100;
							3'd6: dot_col <= 8'b00111100;
							3'd7: dot_col <= 8'b00000000;	
						endcase
					end
					
			//red
			default: begin
						row_count <= row_count + 1;
						case(row_count)//row
							3'd0: dot_row <= 8'b01111111;
							3'd1: dot_row <= 8'b10111111;
							3'd2: dot_row <= 8'b11011111;
							3'd3: dot_row <= 8'b11101111;
							3'd4: dot_row <= 8'b11110111;
							3'd5: dot_row <= 8'b11111011;
							3'd6: dot_row <= 8'b11111101;
							3'd7: dot_row <= 8'b11111110;
						endcase
						case(row_count)//col
							3'd0: dot_col <= 8'b00011000;
							3'd1: dot_col <= 8'b00011000;
							3'd2: dot_col <= 8'b00111100;
							3'd3: dot_col <= 8'b00111100;
							3'd4: dot_col <= 8'b01011010;
							3'd5: dot_col <= 8'b00011000;
							3'd6: dot_col <= 8'b00011000;
							3'd7: dot_col <= 8'b00100100;	
						endcase
					end
		endcase
	
	
	
	
	
	
		
		
	end
	
end

endmodule