//main
module Lab10_Traffic_Light(clock, reset, dot_row, dot_col, out);
input clock, reset;
output [7:0] dot_row;
output [7:0] dot_col;
output [6:0] out; //seven display

wire div_clock1; //for seven-display
wire div_clock2; //for dot matrix
wire [7:0] dot_row;
wire [7:0] dot_col;
wire [1:0] gyr; //current light color
wire [3:0] count;
wire [6:0] out;

FrequencyDivider1 u_FreqDiv1(.clk(clock), .rst(reset), .div_clk(div_clock1));
FrequencyDivider2 u_FreqDiv2(.clk(clock), .rst(reset), .div_clk(div_clock2));

Counter u_counter(.clk(div_clock1), .reset(reset), .count(count), .gyr(gyr));
SevenDisplay u_sevenDisplay(.count(count), .out(out));

DotMatrixController u_dotMatirx(.div_clk(div_clock2), .rst(reset), .gyr(gyr), .dot_row(dot_row), .dot_col(dot_col));

endmodule 