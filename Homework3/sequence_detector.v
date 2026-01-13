module sequence_detector(InD, CLK, RST, match);
input InD, CLK, RST;
output reg match;

reg [4:0] current_state, next_state;
parameter [4:0] A = 5'b00001, B = 5'b00010, C = 5'b00100, D = 5'b01000, E = 5'b10000;

always @(posedge CLK) begin
   if (RST) current_state <= A;
   else current_state <= next_state;
end

always @(*) begin
case (current_state)
A: if (InD == 1) next_state = B;
   else next_state = A;
B: if (InD == 1) next_state = C;
   else next_state = A;
C: if (InD == 0) next_state = D;
   else next_state = C;
D: if (InD == 0) next_state = E;
   else next_state = B;
E: if (InD == 0) next_state = A;
   else next_state = B;
endcase
end

always @(*) begin
case (current_state)
A: match = 0;
B: match = 0;
C: match = 0;
D: match = 0;
E: match = 1;
endcase
end
endmodule
