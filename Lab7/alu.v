module alu(alu_in1, alu_in2, alu_out);
    input [15:0] alu_in1, alu_in2;
    output [15:0] alu_out;

    assign alu_out = alu_in1 + alu_in2;
endmodule
