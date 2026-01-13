module register_file(clk, write_enable, write_addr, write_data, read_addr0, read_addr1, read_data0, read_data1);
    input clk, write_enable;
    input [2:0] write_addr, read_addr0, read_addr1;
    input [7:0] write_data;
    output [7:0] read_data0, read_data1;
    
    wire [7:0] data_out0, data_out1, data_out2, data_out3, data_out4, data_out5, data_out6, data_out7;
    wire enable0, enable1, enable2, enable3, enable4, enable5, enable6, enable7;
    assign enable0 = write_enable && (write_addr == 3'd0);
    assign enable1 = write_enable && (write_addr == 3'd1);
    assign enable2 = write_enable && (write_addr == 3'd2);
    assign enable3 = write_enable && (write_addr == 3'd3);
    assign enable4 = write_enable && (write_addr == 3'd4);
    assign enable5 = write_enable && (write_addr == 3'd5);
    assign enable6 = write_enable && (write_addr == 3'd6);
    assign enable7 = write_enable && (write_addr == 3'd7);

    register_load_enable register0(clk, enable0, write_data, data_out0);
    register_load_enable register1(clk, enable1, write_data, data_out1);
    register_load_enable register2(clk, enable2, write_data, data_out2);
    register_load_enable register3(clk, enable3, write_data, data_out3);
    register_load_enable register4(clk, enable4, write_data, data_out4);
    register_load_enable register5(clk, enable5, write_data, data_out5);
    register_load_enable register6(clk, enable6, write_data, data_out6);
    register_load_enable register7(clk, enable7, write_data, data_out7);

    function [7:0] read_mux(input [2:0] read_addr);
        begin
	    case(read_addr)
	        3'd0: read_mux = data_out0;
	        3'd1: read_mux = data_out1;
	        3'd2: read_mux = data_out2;
	        3'd3: read_mux = data_out3;
	        3'd4: read_mux = data_out4;
	        3'd5: read_mux = data_out5;
	        3'd6: read_mux = data_out6;
	        3'd7: read_mux = data_out7;
	    endcase
        end
    endfunction

    assign read_data0 = (write_enable && (read_addr0 == write_addr)) ? write_data : read_mux(read_addr0);
    assign read_data1 = (write_enable && (read_addr1 == write_addr)) ? write_data : read_mux(read_addr1);
endmodule

