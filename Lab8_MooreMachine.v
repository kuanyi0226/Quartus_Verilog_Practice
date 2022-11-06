module Lab8_MooreMachine(clock, reset, in, out);
input clock, reset, in;
output [6:0] out;

wire [6:0] out; //if not using "always", use wire instead of reg.
wire div_clock;
wire [2:0] out_data; //temp store the output data from machine



FrequencyDivider u_FreqDiv(.clk(clock), .rst(reset), .div_clk(div_clock));
MooreMachine u_MooreMachine(.Clk(div_clock), .Reset(reset), .In_Data(in), .Out_Data(out_data));
SevenDisplay u_display(.Out_Data(out_data), .Seven_Out(out));


endmodule