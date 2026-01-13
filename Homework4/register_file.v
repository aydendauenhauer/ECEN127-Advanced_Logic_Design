module register_file(clk, WE, write_addr, write_data, read_addr, read_data);
    input clk, WE;
    input [3:0] write_addr, read_addr;
    input [7:0] write_data;
    output reg [7:0] read_data;

    reg [7:0] registers [0:11];
    always @(posedge clk) begin
        if (WE)
            registers[write_addr] <= write_data;
    end

    always @(*) begin
        read_data = registers[read_addr];
    end
endmodule
