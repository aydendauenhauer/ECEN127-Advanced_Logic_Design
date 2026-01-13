module mux(select, data_in, data_out);
    input [4:0] select;
    input [31:0] data_in;
    output data_out;

    assign data_out = data_in[select];
endmodule
