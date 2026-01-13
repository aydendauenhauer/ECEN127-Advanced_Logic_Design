module fifo_buffer(clk, Din, push, pop, Dout, full, empty);
    input clk, push, pop;
    input [7:0] Din;
    output full, empty;
    output [7:0] Dout;

    reg [3:0] head, tail, count;
    initial begin
        head = 0;
        tail = 0;
        count = 0;
    end

    register_file dut(clk, push && ~full, tail, Din, head, Dout);
    assign full = (count == 12);
    assign empty = (count == 0);

    always @(posedge clk) begin
        if (push && ~full) begin
            tail <= tail + 1;
            count <= count + 1;
        end
        if (pop && ~empty) begin
            head <= head + 1;
            count <= count - 1;
        end
    end
endmodule
