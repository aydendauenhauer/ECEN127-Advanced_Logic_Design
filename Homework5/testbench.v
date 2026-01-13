module rom_memory_tb();
    reg clk;
    reg [9:0] addr;
    wire [11:0] data;

    rom_memory dut(clk, addr, data);

    always #5 clk = ~clk;

    integer i;
    initial begin
        $display("Start of the ROM test");
        addr = 0; clk = 0;
        for (i = 0; i < 1024; i = i + 1) begin
            @(posedge clk);
            #1;
            $display("Address = %0d---Data = %0d", addr, data);
            addr = addr + 1;
        end
        $finish;
    end
endmodule

