module wavetable(wavetable_in, wavetable_out);
    input [6:0] wavetable_in;
    output reg [7:0] wavetable_out;

    reg [7:0] memory [0:127];
    initial begin
        $readmemh("rom.hex", memory);
    end
    always @(*) begin
        wavetable_out <= memory[wavetable_in];
    end
endmodule
