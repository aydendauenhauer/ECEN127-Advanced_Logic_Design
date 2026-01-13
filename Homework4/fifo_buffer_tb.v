module fifo_buffer_tb();
reg clk, push, pop;
reg [7:0] Din;
wire full, empty;
wire [7:0] Dout;

fifo_buffer dut (clk, Din, push, pop, Dout, full, empty);

always begin
#5 clk = ~clk;
$display("clk=%b, Din=%h, push=%b, pop=%b, Dout=%h, full=%b, empty=%b, @ %d", clk, Din, push, pop, Dout, full, empty, $time);
#5 clk = ~clk;
end

initial begin
$display("Start of the fifo buffer test");
clk = 0; Din = 8'h0; push = 0; pop = 0;
#1
$display("Check push");
Din = 8'h11; push = 1; pop = 0;
#10
$display("Check pop");
push = 0; pop = 1;
#10
$display("Fill all registers and check if full = 1 at the end");
Din = 8'h00; push = 1; pop = 0;
#10
Din = 8'h01;
#10
Din = 8'h02;
#10
Din = 8'h03;
#10
Din = 8'h04;
#10
Din = 8'h05;
#10
Din = 8'h06;
#10
Din = 8'h07;
#10
Din = 8'h08;
#10
Din = 8'h09;
#10
Din = 8'h0A;
#10
Din = 8'h0B;
#10
push = 0;
#10
$display("Empty all registers and check if empty = 1 at the end");
pop = 1;
#10
#10
#10
#10
#10
#10
#10
#10
#10
#10
#10
#10
#10
pop = 0;
$display("End of the fifo buffer test");
$finish;
end

endmodule
