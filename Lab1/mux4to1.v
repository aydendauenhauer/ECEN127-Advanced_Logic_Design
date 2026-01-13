module mux4to1(in1,in2,in3,in4,s,out);
input[2:0] in1, in2, in3, in4;
input[1:0] s;
output reg[2:0] out;

always @* begin
case(s)
2'b00:out = in1;
2'b01:out = in2;
2'b10:out = in3;
2'b11:out = in4;
endcase
end
endmodule
