module register_load_enable(clk, enable, data_in, data_out);
    input clk, enable;
    input [7:0] data_in;
    output reg [7:0] data_out;
    
    always @(posedge clk) begin
        if (enable) data_out <= data_in;
    end
endmodule

