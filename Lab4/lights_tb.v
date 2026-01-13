module lights_tb();
reg clk, rst;
reg [1:0] stalk;
wire l_outer, l_middle, l_inner, r_inner, r_middle, r_outer;

lights dut(stalk, clk, rst, l_outer, l_middle, l_inner, r_inner, r_middle, r_outer);

always begin
#5 clk = ~clk;
#5 clk = ~clk;
end

initial begin
$display("Start of the lights test");
$monitor("clk=%b, rst=%b, stalk=%b, l_outer=%b, l_middle=%b, l_inner=%b, r_inner=%b, r_middle=%b, r_outer=%b, @ %d", clk, rst, stalk, l_outer, l_middle, l_inner, r_inner, r_middle, r_outer, $time);
clk <= 0;
//start with reset
rst = 1;
#10
//check if turn right works
rst = 0; stalk = 2'b01;
#10
stalk = 2'b01;
#10
stalk = 2'b01;
#10
//check if turn left works
stalk = 2'b10;
#10
stalk = 2'b10;
#10
stalk = 2'b10;
#10
//check if wrap around to same signal works 
stalk = 2'b10;
#10
stalk = 2'b10;
#10
stalk = 2'b10;
#10
//check if straight from left works
stalk = 2'b00;
#10
stalk = 2'b00;
#10
stalk = 2'b01;
#10
//check if straight from right works
stalk = 2'b11;
#10
stalk = 2'b11;
#10
//check if turn left works with right signal
stalk = 2'b10;
#10
stalk = 2'b01;
#10
stalk = 2'b01;
#10
//check if turn left works with right signal
stalk = 2'b00;
#10
stalk = 2'b10;
#10
stalk = 2'b00;
#10

$display("End of the lights test");
$finish;

end

endmodule

