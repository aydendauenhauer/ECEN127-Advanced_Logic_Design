module sram_tb();
reg [12:0] addr;
reg RE, WE;
reg flag;
reg [7:0] write_data;
wire [7:0] data;

assign data = flag ? write_data : 8'bz;
sram dut(addr, RE, WE, data);

initial begin
$display("Start of the SRAM test");
$monitor("addr=%b, RE=%b, WE=%b, data=%b @ %d", addr, RE, WE, data, $time);
addr = 13'b0000000000000; write_data = 8'b00000000; flag = 0; RE = 0; WE = 0;
#10
$display("Check if it can write");
addr = 13'b0000000000001; write_data = 8'b10101010; flag = 1; RE = 0; WE = 1;
#10;
$display("Check if it can read");
addr = 13'b0000000000001; RE = 1; WE = 0;
#10
$display("Check if it is high impedence when both are high");
addr = 13'b0000000000010; flag = 0; RE = 1; WE = 1;
#10
$display("Check if it is high impedence when both are low");
addr = 13'b0000000000011; RE = 0; WE = 0;
#10
$display("Check if it can write back to back different addresses");
addr = 13'b0000000000100; write_data = 8'b11011001; flag = 1; RE = 0; WE = 1;
#10
write_data = 8'bz; WE = 0;
#10
addr = 13'b0000000000101; write_data = 8'b01010101; RE = 0; WE = 1;
#10
$display("Check if it can read back to back different addresses");
addr = 13'b0000000000100; flag = 0; RE = 1; WE = 0;
#10
addr = 13'b0000000000101; RE = 1; WE = 0;
#10
$display("Check if it can write to last address");
addr = 13'b1111111111111; write_data = 8'b11111111; flag = 1; RE = 0; WE = 1;
#10;
$display("Check if it can read from last address");
addr = 13'b1111111111111; RE = 1; WE = 0;
#10
$finish;
end
endmodule
