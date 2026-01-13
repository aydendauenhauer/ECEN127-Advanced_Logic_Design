module game(clk, rst, move_farmer, move_entities, win, lose, impossible, state);
    input clk, rst, move_farmer;
    input [1:0] move_entities;
    output reg win, lose, impossible;
    output reg [3:0] state;

    reg [3:0] current_state, next_state;
    parameter [3:0] A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110, H = 4'b0111, I = 4'b1000, J = 4'b1001, K = 4'b1010, L = 4'b1011, M = 4'b1100, N = 4'b1101, O = 4'b1110, P = 4'b1111;

    always @(posedge clk) begin
        if (rst) 
            current_state <= A;
        else 
            current_state <= next_state;
    end

    always @(*) begin
        impossible = 0;
        case (current_state)
            A: if (move_entities == 2'b00 && move_farmer == 1) next_state = I;
               else if (move_entities == 2'b01 && move_farmer == 1) next_state = M;
               else if (move_entities == 2'b10 && move_farmer == 1) next_state = K;
               else if (move_entities == 2'b11 && move_farmer == 1) next_state = J;
               else next_state = A;
            B: if (move_entities == 2'b00 && move_farmer == 1) next_state = J;
               else if (move_entities == 2'b01 && move_farmer == 1) next_state = N;
               else if (move_entities == 2'b10 && move_farmer == 1) next_state = L;
               else if (move_entities == 2'b11 && move_farmer == 1) begin next_state = B; impossible = 1; end
               else next_state = B;
            C: if (move_entities == 2'b00 && move_farmer == 1) next_state = K;
               else if (move_entities == 2'b01 && move_farmer == 1) next_state = O;
               else if (move_entities == 2'b10 && move_farmer == 1) begin next_state = C; impossible = 1; end
               else if (move_entities == 2'b11 && move_farmer == 1) next_state = L;
               else next_state = C;
            D: next_state = D;
            E: if (move_entities == 2'b00 && move_farmer == 1) next_state = M;
               else if (move_entities == 2'b01 && move_farmer == 1) begin next_state = E; impossible = 1; end
               else if (move_entities == 2'b10 && move_farmer == 1) next_state = O;
               else if (move_entities == 2'b11 && move_farmer == 1) next_state = N;
               else next_state = E;
            F: if (move_entities == 2'b00 && move_farmer == 1) next_state = N;
               else if (move_entities == 2'b01 && move_farmer == 1) begin next_state = F; impossible = 1; end
               else if (move_entities == 2'b10 && move_farmer == 1) next_state = P;
               else if (move_entities == 2'b11 && move_farmer == 1) begin next_state = F; impossible = 1; end
               else next_state = F;
            G: next_state = G;
            H: next_state = H;
            I: next_state = I;
            J: next_state = J;
            K: if (move_entities == 2'b00 && move_farmer == 1) next_state = C;
               else if (move_entities == 2'b01 && move_farmer == 1) begin next_state = K; impossible = 1; end
               else if (move_entities == 2'b10 && move_farmer == 1) next_state = A;
               else if (move_entities == 2'b11 && move_farmer == 1) begin next_state = K; impossible = 1; end
               else next_state = K;
            L: if (move_entities == 2'b00 && move_farmer == 1) next_state = D;
               else if (move_entities == 2'b01 && move_farmer == 1) begin next_state = L; impossible = 1; end
               else if (move_entities == 2'b10 && move_farmer == 1) next_state = B;
               else if (move_entities == 2'b11 && move_farmer == 1) next_state = C;
               else next_state = L;
            M: next_state = M;
            N: if (move_entities == 2'b00 && move_farmer == 1) next_state = F;
               else if (move_entities == 2'b01 && move_farmer == 1) next_state = B;
               else if (move_entities == 2'b10 && move_farmer == 1) begin next_state = N; impossible = 1; end
               else if (move_entities == 2'b11 && move_farmer == 1) next_state = E;
               else next_state = N;
            O: if (move_entities == 2'b00 && move_farmer == 1) next_state = G;
               else if (move_entities == 2'b01 && move_farmer == 1) next_state = C;
               else if (move_entities == 2'b10 && move_farmer == 1) next_state = E;
               else if (move_entities == 2'b11 && move_farmer == 1) begin next_state = O; impossible = 1; end
               else next_state = O;
            P: next_state = P;
        endcase
    end

    always @(*) begin
        win = 0; lose = 0;
        case (current_state)
            A: state = 4'b0000;
            B: state = 4'b0001;
            C: state = 4'b0010;
            D: begin lose = 1; state = 4'b0011; end
            E: state = 4'b0100;
            F: state = 4'b0101;
            G: begin lose = 1; state = 4'b0110; end
            H: state = 4'b0111;
            I: begin lose = 1; state = 4'b1000; end
            J: begin lose = 1; state = 4'b1001; end
            K: state = 4'b1010;
            L: state = 4'b1011;
            M: begin lose = 1; state = 4'b1100; end
            N: state = 4'b1101;
            O: state = 4'b1110;
            P: begin win = 1; state = 4'b1111; end
        endcase
    end
endmodule
