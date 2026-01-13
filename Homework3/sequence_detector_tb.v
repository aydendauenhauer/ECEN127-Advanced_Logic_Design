module sequence_detector_tb();
reg InD, CLK, RST;
wire match;

sequence_detector dut(InD, CLK, RST, match);

always begin
#5 CLK = ~CLK;
#5 CLK = ~CLK;
end

initial begin
$display("Start of the sequence detector test");
$monitor("InD=%d, CLK=%d, RST=%d, match=%d, @ %d", InD, CLK, RST, match, $time);
CLK <= 0;
$display("Start with reset to start in state A");
RST = 1;
#10
$display("Check if match is 1 when input is 1100");
RST = 0; InD = 1;
#10
InD = 1;
#10
InD = 0;
#10
InD = 0;
#10
$display("Check if overlap works (11001100)");
InD = 1;
#10
InD = 1;
#10
InD = 0;
#10
InD = 0;
#10
$display("Check extra 1 in C (11100)");
RST = 1;
#10
InD = 1;
#10
InD = 1;
#10
InD = 1;
#10
InD = 0;
#10
InD = 0;
#10
$display("Check D->B (1101100)");
RST = 1;
#10
InD = 1;
#10
InD = 1;
#10
InD = 0;
#10
InD = 1;
#10
InD = 1;
#10
InD = 0;
#10
InD = 0;
#10
$display("Check E->A (11000)");
RST = 1;
#10
InD = 1;
#10
InD = 1;
#10
InD = 0;
#10
InD = 0;
#10
InD = 0;
#10
$display("Check near miss (1000)");
InD = 1;
#10
InD = 0;
#10
InD = 0;
#10
InD = 0;
#10
$display("Check near miss (0100)");
RST = 1;
#10
InD = 0;
#10
InD = 1;
#10
InD = 0;
#10
InD = 0;
#10
$display("Check near miss (1101)");
RST = 1;
#10
InD = 1;
#10
InD = 1;
#10
InD = 0;
#10
InD = 1;
#10

$display("End of the sequence detector test");
$finish;

end

endmodule

