module phase_accumulator_part3(alu_out, clk, rst, en, phase_acc_out);
    input [15:0] alu_out;
    input clk, rst, en;
    output reg [15:0] phase_acc_out;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            phase_acc_out <= 16'b0;
        end
        else if (en) begin
            phase_acc_out <= alu_out;
        end
    end
endmodule
