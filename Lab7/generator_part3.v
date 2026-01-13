module generator_part3(phase_in, load, clk, rst, interpolator_out, sample);
    input load, clk, rst;
    input [15:0] phase_in;
    output [11:0] interpolator_out;
    output sample;

    wire [15:0] phase_reg_out, alu_out, phase_acc_out;
    phase_register dut(phase_in, load, clk, phase_reg_out);
    alu dut2(phase_reg_out, phase_acc_out, alu_out);

    reg en;
    phase_accumulator_part3 dut3(alu_out, clk, rst, en, phase_acc_out);

    wire [6:0] addr_int;
    assign addr_int = phase_acc_out[15:9];

    wire [8:0] frac;
    assign frac = phase_acc_out[8:0];

    reg  [6:0] wavetable_in;
    wire [7:0] wavetable_out;
    wavetable dut4(wavetable_in, wavetable_out);

    reg [7:0] s1_reg;
    reg [8:0] frac_reg;
    reg [6:0] addr_reg;
    reg state;
    reg sample_reg;
    assign sample = sample_reg;
    interpolator dut5(frac_reg, s1_reg, wavetable_out, interpolator_out);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 1'b0;
            sample_reg <= 1'b0;
            en <= 1'b0;
            s1_reg <= 8'd0;
            frac_reg <= 9'd0;
            wavetable_in <= 7'd0;
            addr_reg <= 7'd0;
        end
        else begin
            case (state)
                1'b0: begin
                    addr_reg <= addr_int;
                    frac_reg <= frac;
                    wavetable_in <= addr_int;
                    sample_reg <= 1'b0;
                    en  <= 1'b0;
                    state <= 1'b1;
                end

                1'b1: begin
                    s1_reg <= wavetable_out;
                    wavetable_in <= addr_reg + 7'd1;
                    sample_reg <= 1'b1;
                    en <= 1'b1;
                    state <= 1'b0;
                end
            endcase
        end
    end
endmodule

