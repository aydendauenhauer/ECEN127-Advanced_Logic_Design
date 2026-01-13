module sram(addr, RE, WE, data);
    input [12:0] addr;
    input RE, WE;
    inout [7:0] data;

    reg [7:0] memory [0:8191];
    always @(posedge WE) begin
        if (~RE) begin
            memory[addr] <= data;
        end
    end
    
    assign data = (RE && ~WE) ? memory[addr] : 8'bz;
endmodule
