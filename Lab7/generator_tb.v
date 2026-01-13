module testbench();
    reg load, clk, rst;
    reg [15:0] phase_in;
    wire [11:0] interpolator_out;

    generator dut(phase_in, load, clk, rst, interpolator_out);

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("phase_in=%h, load=%b, rst=%b, interpolator_out=%h @ %d", phase_in, load, rst, interpolator_out, $time);
    end

    // 100 samples per cycle → 65536/100 = 655
    localparam [15:0] PHASE_INC = 16'd655;
    integer fd;
    integer sample_count;
    initial begin
        $display("Start of the generator test");
        fd = $fopen("verilog_output.csv", "w");
        sample_count = 0;
        rst = 1; load = 1; phase_in = PHASE_INC;
        #10
        rst = 0; load = 0;
    end

    // 100 samples per cycle for 2 cycles -> 100*2 = 200
    localparam integer NUM_SAMPLES = 200;
    always @(posedge clk) begin
        if (!rst) begin
            $fdisplay(fd, "%0d, %0d", dut.dut3.phase_acc_out[15:9], interpolator_out);
            sample_count = sample_count + 1;
            if (sample_count == NUM_SAMPLES) begin
                $fclose(fd);
                $display("Finished writing %0d samples to verilog_output.csv", NUM_SAMPLES);
                $finish;
            end
        end
    end
endmodule

