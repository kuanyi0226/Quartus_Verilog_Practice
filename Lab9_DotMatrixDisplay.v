//main
module Lab9_DotMatrixDisplay(clock, reset, dot_row, dot_col);
input clock, reset;
output [7:0] dot_row;
output [7:0] dot_col;

wire div_clock;
wire [7:0] dot_row;
wire [7:0] dot_col;

FrequencyDivider u_freqDiv(.clk(clock), .rst(reset), .div_clk(div_clock));
DotMatrixController u_dotMaxtirx(.div_clk(clock), .rst(reset), .dot_row(dot_row), .dot_col(dot_col));

endmodule


