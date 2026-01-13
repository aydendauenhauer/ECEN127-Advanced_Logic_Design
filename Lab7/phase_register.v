module phase_register(phase_in, load, clk, phase_reg_out);
    input [15:0] phase_in;
    input load, clk;
    output reg [15:0] phase_reg_out;

    always @(posedge clk) begin
        if (load) begin
            phase_reg_out <= phase_in;
        end
    end
endmodule
