module game_tb();
reg clk, rst, move_farmer;
reg [1:0] move_entities;
wire win, lose, impossible;
wire [3:0] state;

game dut(clk, rst, move_farmer, move_entities, win, lose, impossible, state);

always begin
#5 clk = ~clk;
$display("clk=%b, rst=%b, move_farmer=%b, move_entities=%b, state=%b, win=%b, lose=%b, impossible=%b, @ %d", clk, rst, move_farmer, move_entities, state, win, lose, impossible, $time);
#5 clk = ~clk;
end

initial begin

$display("Start of the farmer game test");
clk <= 0;
#1
$display("Start with reset");
rst = 1'b1; 
#10
rst = 1'b0;
#10
$display("Check state progression to win");
move_farmer = 1'b1; move_entities = 2'b10;
#10
move_entities = 2'b00;
#10
move_entities = 2'b01;
#10
move_entities = 2'b10;
#10
$display("Check no move");
move_farmer = 1'b0;
#10
move_farmer = 1'b1; move_entities = 2'b11;
#10
move_entities = 2'b00;
#10
move_entities = 2'b10;
#10
$display("Check win state goes nowhere");
move_entities = 2'b10;
#10
$display("Reset");
rst = 1'b1;
#10
rst = 1'b0;
#10
$display("Check state progression to state I lose");
move_entities = 2'b00;
#10
$display("Check lose state goes nowhere");
move_entities = 2'b10;
#10
$display("Reset");
rst = 1'b1;
#10
rst = 1'b0;
#10
$display("Check impossible");
move_entities = 2'b10;
#10
move_entities = 2'b01;
#10
$display("Reset");
rst = 1'b1;
#10
rst = 1'b0;
#10
$display("Check state progression to state M lose");
move_entities = 2'b01;
#10
$display("Reset");
rst = 1'b1;
#10
rst = 1'b0;
#10
$display("Check state progression to state J lose");
move_entities = 2'b11;
#10
$display("Reset");
rst = 1'b1;
#10
rst = 1'b0;
#10
$display("Check state progression to state G lose");
move_entities = 2'b10;
#10
move_entities = 2'b00;
#10
move_entities = 2'b01;
#10
move_entities = 2'b00;
#10
$display("Reset");
rst = 1'b1;
#10
rst = 1'b0;
#10
$display("Check state progression to state D lose");
move_entities = 2'b10;
#10
move_entities = 2'b10;
#10
move_entities = 2'b11;
#10
move_entities = 2'b00;
#10
$display("Reset");
rst = 1'b1;
#10
rst = 1'b0;
#10
$display("Check other win");
move_entities = 2'b10;
#10
move_entities = 2'b00;
#10
move_entities = 2'b11;
#10
move_entities = 2'b10;
#10
move_entities = 2'b01;
#10
move_entities = 2'b00;
#10
move_entities = 2'b10;
#10
$display("Reset");
rst = 1'b1;
#10
rst = 1'b0;
#10


$display("End of the farmer game test");
$finish;

end
endmodule
