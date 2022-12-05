module Lab11_KeyPad(clk, reset, keypadRow, keypadCol, dot_row, dot_col);
input clk, reset;
input [3:0] keypadCol;
output [3:0] keypadRow;
output [7:0] dot_row;
output [7:0] dot_col;

wire clk_pad, clk_dot;
wire [3:0] keypadBuf;

FrequencyDivider clk1 (.clk(clk), .rst(reset), .div_clk(clk_pad));
FrequencyDivider clk2 (.clk(clk), .rst(reset), .div_clk(clk_dot));

checkkeypad check_pad (.clk(clk), .rst(reset), .keypadRow(keypadRow), .keypadCol(keypadCol), .keypadBuf(keypadBuf));
DotMatrixController dotmatrix(.div_clk1(clk_pad), .div_clk2(clk_dot), .rst(reset), .keypadBuf(keypadBuf), .dot_row(dot_row), .dot_col(dot_col));

endmodule
