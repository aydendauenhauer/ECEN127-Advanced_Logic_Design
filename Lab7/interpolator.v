module interpolator(interpolator_in1, wavetable1_out, wavetable2_out, interpolator_out);
    input [8:0] interpolator_in1;
    input [7:0] wavetable1_out, wavetable2_out;
    output [11:0] interpolator_out;

    localparam [9:0] PHASE_UNIT = 10'd512; // 2^9 for 7.9 format
    wire [17:0] prod2 = interpolator_in1 * wavetable2_out; // frac * s2
    wire [17:0] prod1 = (PHASE_UNIT - interpolator_in1) * wavetable1_out; // (PHASE_UNIT-frac)*s1
    wire [18:0] sum = prod1 + prod2;
    // Shift right by 5 bits (8 + 9 - 12) and take 12 bits
    assign interpolator_out = sum[16:5];  // (sum >> 5)
endmodule
