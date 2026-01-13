module tb();

reg clk;
reg rstn, en;
wire out;



counters c1(
  clk,
  rstn,
  en,
  out);



always begin
  #5 clk <= !clk;
  if (clk == 1) $display("out = %b,  reset = %b, enable = %b", out, !rstn, en);
end


initial begin

  clk = 0;
  rstn = 0;
  en = 1;
  #30;
  rstn = 1;
  #300
  en = 0;
  #30
  en = 1;
  #40
  $finish;
end

endmodule
