module spi(sclk, si, csb, so, we, re, data, addr, inst, cs);
input sclk, si, csb;
output reg so, we, re;
output reg [12:0] addr;
output reg [7:0] inst;
output reg [3:0] cs;

reg flag;
reg [5:0] count;
reg [4:0] count2;
reg [7:0] writedata;
reg [3:0] ns;

inout [7:0] data;

parameter [3:0] IDLE = 4'b1000, DECODE = 4'b0100, READ = 4'b0010, WRITE = 4'b0001;

always @(negedge csb) begin
    re <= 0;
    we <= 0;
    count <= 0;
    inst <= 0;
    addr <= 0;
    flag <= 0;
    count2 <= 0;
    cs <= DECODE;
    ns <= DECODE;
    writedata <= 0;
    so <= 0;
end

always @(*) begin
    case (cs)
        DECODE: begin
            if (count == 24) begin
                if (inst[1:0] == 2'b10) begin
                    ns <= WRITE;
                end
		else if (inst[1:0] == 2'b11) begin
                    flag <= 1'b1;
                    re <= 1'b1;
                    ns <= READ;
                end
            end
            else ns <= DECODE;
        end
        READ: begin
            re <= 1'b1;
            we <= 1'b0;
            flag <= 1'b1;
            ns <= READ;
        end
        WRITE: begin
            re <= 1'b0;
            if (count2 == 8) begin
                we <= 1'b1;
            end
            flag <= 1'b0;
            ns <= WRITE;
        end
    endcase
end

always @(posedge sclk) begin
    if (!csb) begin
        case (ns)
            DECODE: begin
                if (count < 8) begin
                    inst <= {inst[6:0], si};
                end
                else if (count < 24) begin
                    addr <= {addr[11:0], si};
                end
                count <= count + 1;
            end
            WRITE: begin
                if (count2 < 8) begin
                    writedata <= {writedata[6:0], si};
                    count2 <= count2 + 1;
                end
            end
        endcase
        cs <= ns;
    end
end 

always @(negedge sclk) begin
    if (!csb && ns == READ) begin
        if (count2 < 8) begin
            so <= data[3'd7-count2];
            count2 <= count2 + 1;
        end
	else so <= 1'bz;
    end
end

assign data = (flag) ? 8'bz : writedata;

endmodule
