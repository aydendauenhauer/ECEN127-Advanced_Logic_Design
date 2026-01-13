module generator(phase_in, load, clk, rst, interpolator_out);
    input load, clk, rst;
    input [15:0] phase_in;
    output [11:0] interpolator_out;

    wire [15:0] phase_reg_out, alu_out, phase_acc_out;
    wire [8:0] interpolator_in1;
    wire [7:0] wavetable1_out, wavetable2_out;
    wire [6:0] wavetable1_in, wavetable2_in;
    phase_register dut(phase_in, load, clk, phase_reg_out);
    alu dut2(phase_reg_out, phase_acc_out, alu_out);
    phase_accumulator dut3(alu_out, clk, rst, phase_acc_out);
    rounder dut4(phase_acc_out, interpolator_in1, wavetable1_in, wavetable2_in);
    wavetable wavetable1(wavetable1_in, wavetable1_out);
    wavetable wavetable2(wavetable2_in, wavetable2_out);
    interpolator dut5(interpolator_in1, wavetable1_out, wavetable2_out, interpolator_out);
endmodule
