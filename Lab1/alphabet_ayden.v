module alphabet_ayden(DataIn, DataOut);
input[2:0] DataIn;
output reg[6:0] DataOut;

always @* begin
case (DataIn)
3'b000:DataOut = 7'b1110111;
3'b001:DataOut = 7'b0111001;
3'b010:DataOut = 7'b1111001;
3'b011:DataOut = 7'b1110001;
3'b100:DataOut = 7'b1110110;
3'b101:DataOut = 7'b0011110;
3'b110:DataOut = 7'b0111000;
3'b111:DataOut = 7'b1110011;
endcase
end
endmodule
