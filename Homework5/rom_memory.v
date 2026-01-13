module rom_memory(clk, addr, data);
    input clk;
    input [9:0] addr;
    output reg [11:0] data;

    reg [11:0] memory [0:1023];
    initial begin
        $readmemh("data.mem", memory);
    end

    always @(posedge clk) begin
        data <= memory[addr];
    end
endmodule
