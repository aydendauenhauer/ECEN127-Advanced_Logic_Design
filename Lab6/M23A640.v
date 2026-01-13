module M23A640(csb, so, holdb, sck, si);
input csb, holdb, sck, si;
output so;

wire [3:0] cs;
wire [7:0] inst, data;
wire [12:0] addr;
wire we, re;

spi dut1 (sck, si, csb, so, we, re, data, addr, inst, cs);
sram dut2 (addr, re, we, data);

endmodule

