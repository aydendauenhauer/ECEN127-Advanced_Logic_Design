module rounder(phase_acc_out, interpolator_in1, wavetable1_in, wavetable2_in);
    input [15:0] phase_acc_out;
    output [8:0] interpolator_in1;
    output [6:0] wavetable1_in, wavetable2_in;

    assign interpolator_in1 = phase_acc_out[8:0];
    assign wavetable1_in = phase_acc_out[15:9];
    assign wavetable2_in = phase_acc_out[15:9] + 1'b1;
endmodule
