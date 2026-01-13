module counters(
  input clk,
  input rstn,
  input en,
  output out);

wire [3:0] upval;
wire [4:0] downval;


down5 d1(clk, rstn, en, downval);
up4 u1(clk, rstn, en, upval);

assign out = ({1'b0,upval} == downval);

endmodule

module counter
  #(	parameter N = 2,
	parameter DOWN = 0)

  (	input	clk,
	input	rstn,
	input	en,
	output reg [N-1:0] out);


endmodule

module up4(
  input clk,
  input rstn,
  input en,
  output reg [3:0] out);

  always @(posedge clk) begin
    if (!rstn) begin
      out <= 0;
    end else begin
      if (en) 
         out <= out + 1;
      else out <= out;
    end
  end
endmodule

module down5(
  input clk,
  input rstn,
  input en,
  output reg [4:0] out);

  always @(posedge clk) begin
    if (!rstn) begin
      out <= 0;
    end else begin
      if (en) 
         out <= out - 1;
      else out <= out;
    end
  end
endmodule
