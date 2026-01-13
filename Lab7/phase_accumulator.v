module phase_accumulator(alu_out, clk, rst, phase_acc_out);
    input [15:0] alu_out;
    input clk, rst;
    output reg [15:0] phase_acc_out;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            phase_acc_out <= 16'b0;
        end
        else begin
            phase_acc_out <= alu_out;
        end
    end
endmodule
