module lights(stalk, clk, rst, l_outer, l_middle, l_inner, r_inner, r_middle, r_outer);
input clk, rst;
input [1:0] stalk;
output reg l_outer, l_middle, l_inner, r_inner, r_middle, r_outer;

reg [6:0] cs, ns;
parameter [6:0] A = 7'b0000001, B = 7'b0000010, C = 7'b0000100, D = 7'b0001000, E = 7'b0010000, F = 7'b0100000, G = 7'b1000000;

always @(posedge clk) begin
   if (rst || stalk==2'b11 || stalk==2'b00) cs <= A;
   else cs <= ns;
end

always @(*) begin
case (cs)
A: if (stalk == 2'b01) ns = B;
   else if (stalk == 2'b10) ns = E;
   else ns = A;
B: if (stalk == 2'b00 || stalk == 2'b11) ns = A;
   else ns = C;
C: if (stalk == 2'b00 || stalk == 2'b11) ns = A;
   else ns = D;
D: ns = A;
E: if (stalk == 2'b00 || stalk == 2'b11) ns = A;
   else ns = F;
F: if (stalk == 2'b00 || stalk == 2'b11) ns = A;
   else ns = G;
G: ns = A;
endcase
end

always @(*) begin
l_outer = 0; l_middle = 0; l_inner = 0; r_inner = 0; r_middle = 0; r_outer = 0;
case (cs)
B: r_inner = 1;
C: begin 
   r_inner = 1; 
   r_middle = 1; 
   end
D: begin 
   r_inner = 1; 
   r_middle = 1; 
   r_outer = 1; 
   end
E: l_inner = 1;
F: begin 
   l_inner = 1; 
   l_middle = 1; 
   end
G: begin 
   l_inner = 1; 
   l_middle = 1; 
   l_outer = 1; 
   end
endcase
end
endmodule
