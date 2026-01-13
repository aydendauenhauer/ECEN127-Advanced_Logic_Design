module testbench();
reg sck, si, csb;
wire so, we, re;
wire [7:0] data;
wire [12:0] addr;
wire [7:0] inst;
wire [31:0] buffer;
wire [3:0] cs;
reg [7:0] write_data;

assign data = write_data;

spi dut(sck, si, csb, so, we, re, data, addr, inst, cs);

initial begin
$display("Start of the spi test");
$monitor("si=%b, csb=%b, so=%b, we=%b, re=%b, data=%b, addr=%b, inst=%b, cs=%b@ %d", si, csb, so, we, re, data, addr, inst, cs, $time);
    write_data = 8'h42;
    csb = 0;				// Start Transaction
    si = 0; #5 sck = 1; 		// Send read instruction 0000 0011
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 1; sck = 0; #5 sck = 1;
    #5 si = 1; sck = 0; #5 sck = 1;

    #5 si = 0; sck = 0; #5 sck = 1;	// Send address MSB first
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;


    #5 sck = 0; #5 sck = 1;	// Receive data MSB first
    #5 sck = 0; #5 sck = 1;
    #5 sck = 0; #5 sck = 1;
    #5 sck = 0; #5 sck = 1;
    #5 sck = 0; #5 sck = 1;
    #5 sck = 0; #5 sck = 1;
    #5 sck = 0; #5 sck = 1;
    #5 sck = 0; #5 sck = 1;
    #5 sck = 0; #5 csb = 1; #5;

$finish;
end
endmodule

