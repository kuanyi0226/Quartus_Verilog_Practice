module Lab7_Counter(clock, reset, Up_Down, out);
input clock, reset, Up_Down;
output [6:0] out;

wire [6:0] out; //if not using "always", use wire instead of reg.
wire div_clock;
wire [4:0] count;



FrequencyDivider u_FreqDiv(.clk(clock), .rst(reset), .div_clk(div_clock));
Counter u_counter(.clk(div_clock), .reset(reset), .updown(Up_Down), .count(count));
SevenDisplay u_display(.count(count), .out(out));


endmodule







