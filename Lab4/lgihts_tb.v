module lights_tb();
reg clk, rst;
reg [1:0] stalk;
wire l_outer, l_middle, l_inner, r_outer, r_middle, r_inner;

lights dut(stalk, clk, rst, l_outer, l_middle, l_inner, r_inner, r_middle, r_outer);

initial begin
	$display("Start of the lights test");
	$monitor("stalk=%d, l_outer=%d, l_middle = %d, l_inner=%d, r_inner=%d, r_middle=%d, r_outer=%d, @ %d", stalk, l_outer, l_middle, l_inner, r_inner, r_middle, r_outer, $time);


$display("Start of the lights test");
//start with reset
rst = 1; 
#10
//check if turn right works
stalk = 2'b01;
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
//check if straight ahead work

$display("End of the lights test");
$finish;

end

endmodule


