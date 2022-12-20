module Lab12_VGA(clk, reset, r, g, b, vga_R, vga_G, vga_B, vga_HS, vga_VS);
input clk, reset, r, g, b; //three buttons for controling color
output [3:0] vga_R;
output [3:0] vga_G;
output [3:0] vga_B;
output vga_HS, vga_VS;

reg [3:0] vga_R;
reg [3:0] vga_G;
reg [3:0] vga_B;

reg [11:0] h_count; //for row
reg [11:0] v_count; //for col
wire active_flag; //print RGB on screen

reg [3:0] tempRed;
reg [3:0] tempGreen;
reg [3:0] tempBlue;

parameter   h_pulse = 96, 
            h_back = 48,
            h_active = 640,
            h_front = 16,
            h_line_period = 800;
parameter   v_pulse = 2,
            v_back = 33,
            v_active = 480,
            v_front = 10,
            v_frame_period = 525;

wire div_clk;
FrequencyDivider divClock(.clk(clk), .rst(reset), .div_clk(div_clk));

//Using buttons to set change RGB
always @(negedge reset or negedge r)begin //press reset or red
    if(!reset)begin
        tempRed <= 4'd0;
    end
    else 
        tempRed <= tempRed + 4'd1;
end
always @(negedge reset or negedge g) begin //press green
	if(!reset)begin
        tempGreen <= 4'd0;
    end
	else 
        tempGreen <= tempGreen + 4'd1;
end
always @(negedge reset or negedge b) begin //press blue
    if(!reset)begin
        tempBlue <= 4'd0;
    end
	else 
        tempBlue <= tempBlue + 4'd1;
end

//for row(HS)
always @(posedge div_clk or negedge reset)begin
    if(!reset)
        h_count <= 12'd0;
    else if(h_count == h_line_period - 1'b1)
        h_count <= 12'd0;
    else
        h_count <= h_count + 1'b1;
end
assign vga_HS = (h_count < h_pulse) ? 1'b0 : 1'b1;

//for col(VS)
always @(posedge div_clk or negedge reset)
begin
    if(!reset)
        v_count <=  12'd0;
    else if(v_count == v_frame_period - 1'b1)
        v_count <=  12'd0;
    else if(h_count == h_line_period - 1'b1)
        v_count <=  v_count + 1'b1;
    else
        v_count <=  v_count;                        
end                
assign vga_VS =   (v_count < v_pulse) ? 1'b0 : 1'b1; 

assign active_flag =  (h_count >= (h_pulse + h_back - 1'b1    ))  &&
                      (h_count <  (h_pulse + h_back + h_active))  && 
                      (v_count >= (v_pulse + v_back - 1'b1    ))  &&
                      (v_count < (v_pulse + v_back + v_active))
                      ? 1'b1 : 1'b0;

//show RGB(assign temp to output)
always @(posedge div_clk or negedge reset) begin
    if(!reset)begin
        vga_R <= 4'd0;
        vga_G <= 4'd0;
        vga_B <= 4'd0;
    end
    else if(active_flag)begin
        vga_R <= tempRed;
        vga_G <= tempGreen;
        vga_B <= tempBlue;
    end
    else begin
        vga_R <= 4'd0;
        vga_G <= 4'd0;
        vga_B <= 4'd0;
    end
end
endmodule
