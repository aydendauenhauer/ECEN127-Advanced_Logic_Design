module testbench();

reg [2:0] charval0;
reg [2:0] charval1;
reg [2:0] charval2;
reg [2:0] charval3;

wire [6:0] sega;
wire [6:0] segb;
wire [6:0] segc;
wire [6:0] segd;

reg [1:0] sel;

// instantiate your module here:
wire [2:0] muxoutA;
wire [2:0] muxoutB;
wire [2:0] muxoutC;
wire [2:0] muxoutD;
mux4to1(charval3, charval2, charval1, charval0, sel, muxoutA);
mux4to1(charval2, charval3, charval0, charval1, sel, muxoutB);
mux4to1(charval1, charval0, charval3, charval2, sel, muxoutC);
mux4to1(charval0, charval1, charval2, charval3, sel, muxoutD);

alphabet_ayden(muxoutA, sega);
alphabet_ayden(muxoutB, segb);
alphabet_gwyn(muxoutC, segc);
alphabet_gwyn(muxoutD, segd);

initial begin
	$display("Start of the decoder test");
	$monitor("sel = %d, charval0=%d, charval1=%d,charval2=%d,charval3=%d, sega=%b,segb=%b, segc=%b, segd=%b, @ %d", sel, charval0, charval1, charval2, charval3, sega, segb, segc, segd, $time);
charval0 = 3'd0; charval1 = 3'd1; charval2 = 3'd2; charval3 = 3'd3;
sel = 0;
#10
sel = 3'd1;
#10
sel = 3'd2;
#10
sel = 3'd3;
#10
charval0 = 3'd2; charval1 = 3'd1; charval2 = 3'd2; charval3 = 3'd1;
sel = 0;
#10
sel = 3'd1;
#10
sel = 3'd2;
#10
sel = 3'd3;
#10
charval0 = 3'd6; charval1 = 3'd1; charval2 = 3'd0; charval3 = 3'd7;
sel = 0;
#10
sel = 3'd1;
#10
sel = 3'd2;
#10
sel = 3'd3;
#10
charval0 = 3'd0; charval1 = 3'd1; charval2 = 3'd2; charval3 = 3'd3;
sel = 0;
#10
charval0 = 3'd1;
#10
charval0 = 3'd2;
#10
charval0 = 3'd3;
#10
charval1 = 3'd7;
#10
charval1 = 3'd6;
#10
charval1 = 3'd5;
#10
$finish;

end

endmodule


