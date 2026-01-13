module testbench();
    reg clk, write_enable;
    reg [2:0] write_addr, read_addr0, read_addr1;
    reg [7:0] write_data;
    wire [7:0] read_data0, read_data1;


register_file dut(clk, write_enable, write_addr, write_data, read_addr0, read_addr1, read_data0, read_data1);

initial begin
	$display("Start of the register file test");
	$monitor("write_enable=%d, write_addr=%d, write_data = %d, read_addr0=%d, read_addr1=%d, read_data0=%d, read_data1=%d, @ %d", write_enable, write_addr, write_data, read_addr0, read_addr1, read_data0, read_data1, $time);
$display("Start of the register file test");
write_enable=1; write_addr=3'd2; write_data=8'hA5; read_addr0=3'd2; read_addr1=3'd1; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd5; write_data=8'h5A; read_addr0=3'd5; read_addr1=3'd2; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd0; write_data=8'h9C; read_addr0=3'd2; read_addr1=3'd0; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd7; write_data=8'hE1; read_addr0=3'd7; read_addr1=3'd7; clk=1;
#10
clk=0;
#10;
write_enable=0; read_addr0=3'd1; read_addr1=3'd4; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd3; write_data=8'h3C; read_addr0=3'd1; read_addr1=3'd6; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd2; write_data=8'h2A; read_addr0=3'd2; read_addr1=3'd5; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd4; write_data=8'h4D; read_addr0=3'd0; read_addr1=3'd7; clk=1;
#10
clk=0;
#10;
write_enable=0; read_addr0=3'd0; read_addr1=3'd1; clk=1;
#10
clk=0;
#10;

write_enable=1; write_addr=3'd2; write_data=8'hA5; read_addr0=3'd4; read_addr1=3'd1; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd2; write_data=8'h21; read_addr0=3'd2; read_addr1=3'd0; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd1; write_data=8'hA5; read_addr0=3'd2; read_addr1=3'd1; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd5; write_data=8'h32; read_addr0=3'd5; read_addr1=3'd0; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd2; write_data=8'h09; read_addr0=3'd2; read_addr1=3'd3; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd0; write_data=8'h5B; read_addr0=3'd0; read_addr1=3'd6; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd7; write_data=8'hA5; read_addr0=3'd7; read_addr1=3'd1; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd7; write_data=8'hA6; read_addr0=3'd7; read_addr1=3'd1; clk=1;
#10
clk=0;
#10;
write_enable=1; write_addr=3'd7; write_data=8'hA6; read_addr0=3'd0; read_addr1=3'd0; clk=1;
#10
clk=0;
#10;

$display("End of the register file test");
$finish;

end

endmodule

