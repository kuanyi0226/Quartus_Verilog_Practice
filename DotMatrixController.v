module DotMatrixController(div_clk1, div_clk2,rst, keypadBuf,dot_row, dot_col);
input div_clk1, div_clk2, rst;
input [3:0] keypadBuf;
output [7:0] dot_row;
output [7:0] dot_col;

reg [7:0] dot_row;
reg [7:0] dot_col;
reg [2:0] row_count;
reg [7:0] dot_col_buf [0:7];

always@ (posedge div_clk2 or negedge rst)
begin
	if(~rst) begin
		dot_row <= 8'b0;
		dot_col <= 8'b0;
		row_count <= 3'd0;
	end
	else begin
		row_count <= row_count +1;
		dot_col <= dot_col_buf[row_count];
		case(row_count)
			3'd0: dot_row <= 8'b01111111;
			3'd1: dot_row <= 8'b10111111;
			3'd2: dot_row <= 8'b11011111;
			3'd3: dot_row <= 8'b11101111;
			3'd4: dot_row <= 8'b11110111;
			3'd5: dot_row <= 8'b11111011;
			3'd6: dot_row <= 8'b11111101;
			3'd7: dot_row <= 8'b11111110;
		endcase
		
	end
	
end

always @ (posedge div_clk2 or negedge rst)
begin
	if(!rst)
	begin
		dot_col_buf[0] <= 8'd0;
		dot_col_buf[1] <= 8'd0;
		dot_col_buf[2] <= 8'd0;
		dot_col_buf[3] <= 8'd0;
		dot_col_buf[4] <= 8'd0;
		dot_col_buf[5] <= 8'd0;
		dot_col_buf[6] <= 8'd0;
		dot_col_buf[7] <= 8'd0;
	end
	else
	begin
		case(keypadBuf)
			4'h0:begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000 ;
				dot_col_buf[2] <= 8'b00000000 ;
				dot_col_buf[3] <= 8'b00000000 ;
				dot_col_buf[4] <= 8'b00000000 ;
				dot_col_buf[5] <= 8'b00000000 ;
				dot_col_buf[6] <= 8'b11000000 ;
				dot_col_buf[7] <= 8'b11000000 ;
			end
			5'h1: begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000	;
				dot_col_buf[2] <= 8'b00000000	;
				dot_col_buf[3] <= 8'b00000000	;
				dot_col_buf[4] <= 8'b00000000	;
				dot_col_buf[5] <= 8'b00000000	;
				dot_col_buf[6] <= 8'b00110000	;
				dot_col_buf[7] <= 8'b00110000	;
			end
			5'h2: begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000 ;
				dot_col_buf[2] <= 8'b00000000 ;
				dot_col_buf[3] <= 8'b00000000 ;
				dot_col_buf[4] <= 8'b00110000 ;
				dot_col_buf[5] <= 8'b00110000 ;
				dot_col_buf[6] <= 8'b00000000 ;
				dot_col_buf[7] <= 8'b00000000 ;
			end
			5'h3: begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000 ;
				dot_col_buf[2] <= 8'b00110000 ;
				dot_col_buf[3] <= 8'b00110000 ;
				dot_col_buf[4] <= 8'b00000000 ;
				dot_col_buf[5] <= 8'b00000000 ;
				dot_col_buf[6] <= 8'b00000000 ;
				dot_col_buf[7] <= 8'b00000000 ;
			end
			5'h4: begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000 ;
				dot_col_buf[2] <= 8'b00000000 ;
				dot_col_buf[3] <= 8'b00000000 ;
				dot_col_buf[4] <= 8'b00000000 ;
				dot_col_buf[5] <= 8'b00000000 ;
				dot_col_buf[6] <= 8'b00001100 ;
				dot_col_buf[7] <= 8'b00001100 ;
			end
			5'h5: begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000 ;
				dot_col_buf[2] <= 8'b00000000 ;
				dot_col_buf[3] <= 8'b00000000 ;
				dot_col_buf[4] <= 8'b00001100 ;
				dot_col_buf[5] <= 8'b00001100 ;
				dot_col_buf[6] <= 8'b00000000 ;
				dot_col_buf[7] <= 8'b00000000 ;
			end
			5'h6: begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000 ;
				dot_col_buf[2] <= 8'b00001100 ;
				dot_col_buf[3] <= 8'b00001100 ;
				dot_col_buf[4] <= 8'b00000000 ;
				dot_col_buf[5] <= 8'b00000000 ;
				dot_col_buf[6] <= 8'b00000000 ;
				dot_col_buf[7] <= 8'b00000000 ;
			end
			5'h7: begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000 ;
				dot_col_buf[2] <= 8'b00000000 ;
				dot_col_buf[3] <= 8'b00000000 ;
				dot_col_buf[4] <= 8'b00000000 ;
				dot_col_buf[5] <= 8'b00000000 ;
				dot_col_buf[6] <= 8'b00000011 ;
				dot_col_buf[7] <= 8'b00000011 ;
			end
			5'h8: begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000 ;
				dot_col_buf[2] <= 8'b00000000 ;
				dot_col_buf[3] <= 8'b00000000 ;
				dot_col_buf[4] <= 8'b00000011 ;
				dot_col_buf[5] <= 8'b00000011 ;
				dot_col_buf[6] <= 8'b00000000 ;
				dot_col_buf[7] <= 8'b00000000 ;
			end
			5'h9: begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000 ;
				dot_col_buf[2] <= 8'b00000011 ;
				dot_col_buf[3] <= 8'b00000011 ;
				dot_col_buf[4] <= 8'b00000000 ;
				dot_col_buf[5] <= 8'b00000000 ;
				dot_col_buf[6] <= 8'b00000000 ;
				dot_col_buf[7] <= 8'b00000000 ;
			end
			5'ha: begin
				dot_col_buf[0] <= 8'b00000000;
				dot_col_buf[1] <= 8'b00000000;
				dot_col_buf[2] <= 8'b00000000;
				dot_col_buf[3] <= 8'b00000000;
				dot_col_buf[4] <= 8'b11000000;
				dot_col_buf[5] <= 8'b11000000;
				dot_col_buf[6] <= 8'b00000000;
				dot_col_buf[7] <= 8'b00000000;
			end
			5'hb: begin
				dot_col_buf[0] <= 8'b00000000;
				dot_col_buf[1] <= 8'b00000000;
				dot_col_buf[2] <= 8'b11000000;
				dot_col_buf[3] <= 8'b11000000;
				dot_col_buf[4] <= 8'b00000000;
				dot_col_buf[5] <= 8'b00000000;
				dot_col_buf[6] <= 8'b00000000;
				dot_col_buf[7] <= 8'b00000000;
			end
			5'hc: begin
				dot_col_buf[0] <= 8'b00000011;
				dot_col_buf[1] <= 8'b00000011;
				dot_col_buf[2] <= 8'b00000000;
				dot_col_buf[3] <= 8'b00000000;
				dot_col_buf[4] <= 8'b00000000;
				dot_col_buf[5] <= 8'b00000000;
				dot_col_buf[6] <= 8'b00000000;
				dot_col_buf[7] <= 8'b00000000;
			end
			5'hd: begin
				dot_col_buf[0] <= 8'b00001100;
				dot_col_buf[1] <= 8'b00001100;
				dot_col_buf[2] <= 8'b00000000;
				dot_col_buf[3] <= 8'b00000000;
				dot_col_buf[4] <= 8'b00000000;
				dot_col_buf[5] <= 8'b00000000;
				dot_col_buf[6] <= 8'b00000000;
				dot_col_buf[7] <= 8'b00000000;
			end
			5'he: begin
				dot_col_buf[0] <= 8'b00110000;
				dot_col_buf[1] <= 8'b00110000;
				dot_col_buf[2] <= 8'b00000000;
				dot_col_buf[3] <= 8'b00000000;
				dot_col_buf[4] <= 8'b00000000;
				dot_col_buf[5] <= 8'b00000000;
				dot_col_buf[6] <= 8'b00000000;
				dot_col_buf[7] <= 8'b00000000;
			end
			5'hf: begin
				dot_col_buf[0] <= 8'b11000000;
				dot_col_buf[1] <= 8'b11000000 ;
				dot_col_buf[2] <= 8'b00000000 ;
				dot_col_buf[3] <= 8'b00000000 ;
				dot_col_buf[4] <= 8'b00000000 ;
				dot_col_buf[5] <= 8'b00000000 ;
				dot_col_buf[6] <= 8'b00000000 ;
				dot_col_buf[7] <= 8'b00000000 ;
			end
			default
			begin
				dot_col_buf[0] <= 8'b00000000 ;
				dot_col_buf[1] <= 8'b00000000 ;
				dot_col_buf[2] <= 8'b00000000 ;
				dot_col_buf[3] <= 8'b00000000 ;
				dot_col_buf[4] <= 8'b00000000 ;
				dot_col_buf[5] <= 8'b00000000 ;
				dot_col_buf[6] <= 8'b00000000 ;
				dot_col_buf[7] <= 8'b00000000 ;
			end


		endcase
	end
	
	
end

endmodule