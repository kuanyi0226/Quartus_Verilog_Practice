//Counter:
module Counter(clk, reset, count, gyr);
input clk, reset;
output [3:0] count; //0~15
output [2:0] gyr;

reg [3:0] g_count;
reg [3:0] y_count;
reg [3:0] r_count;
reg [2:0] gyr; //0:green, 1:yellow, 2:red
reg [3:0] count;

always @(posedge clk or negedge reset)
begin 
	if (!reset)
	begin
		g_count <= 4'd15;
		y_count <= 4'd5;
		r_count <= 4'd10;
		gyr <= 4'd0;
		
	end
	
	else
	begin
		case(gyr)
		4'd0: begin
					g_count <= g_count -1;
					count <= g_count;
					if(g_count == 4'd0)begin
						gyr <= 4'd1;//change to yellow
					end
				end
				
		4'd1: begin
					y_count <= y_count -1;
					count <= y_count;
					if(y_count == 4'd0)begin
						y_count <= 4'd5;
						gyr <= 4'd2;//change to red
					end
				end
				
		default: begin
					r_count <= r_count -1;
					count <= r_count;
					if(r_count == 4'd0)begin
						r_count <= 4'd10;
						gyr <= 4'd0;//change to green
					end
				end
		
		endcase
		
	end
	
end


endmodule