`timescale 1ns/1ns
module FullAdder(input A, B, Cin, output Co, S);
 wire [2:0] w;
 assign #(17,19) w[0] = A ^ B;
 assign #(17,19) S = w[0] ^ Cin;
 assign #(10,8) w[1] = ~(Cin & w[0]);
 assign #(10,8) w[2] = ~(A & B);
 assign #(10,8) Co = ~(w[1] & w[2]);
endmodule

module n_bit_adder #(parameter n = 4) (input [n - 1 : 0] A, B, input Cin, output [n - 1 : 0] S, output Co);
 wire [n : 0] #(37,35) Ci;
 wire [n : 0] #(37,35) s;
 assign Ci[0] = Cin;
 genvar i;
 for(i = 0  ; i < n ; i = i + 1) begin
    assign #(36,38) {Ci[i+1], s[i]} = A[i] + B[i] + Ci[i];
 end
 assign S = s;
 assign Co = Ci[n];
endmodule

module onescounter127bit #(parameter n = 6) (input [2**(n+1) : 0] I, output [n : 0] out);
 wire [65 : 0] w1;
 wire [47 : 0] w2;
 wire [31 : 0] w3;
 wire [19 : 0] w4;
 wire [11 : 0] w5;
 wire [6 : 0] w6;
 generate
 genvar i;
  for(i = 0; i < 32; i = i + 1) begin
    n_bit_adder #1 nbitadder(I[3*i], I[3*i + 1], I[3*i + 2],  w1[2*i], w1[2*i + 1]);
  end
  for(i = 0; i < 16; i = i + 1) begin
    n_bit_adder #2 nbitadder(w1[4*i+1 : 4*i], w1[4*i+3 : 4*i+2], I[96+i],  w2[3*i+1 : 3*i], w2[3*i+2]);
  end
  for(i = 0; i < 8; i = i + 1) begin
    n_bit_adder #3 nbitadder(w2[6*i+2 : 6*i], w2[6*i+5 : 6*i+3], I[112+i],  w3[4*i+2 : 4*i], w3[4*i+3]);
  end
  for(i = 0; i < 4; i = i + 1) begin
    n_bit_adder #4 nbitadder(w3[8*i+3 : 8*i], w3[8*i+7 : 8*i+4], I[120+i],  w4[5*i+3 : 5*i], w4[5*i+4]);
  end
  for(i = 0; i < 2; i = i + 1) begin
    n_bit_adder #5 nbitadder(w4[10*i+4 : 10*i], w4[10*i+9 : 10*i+5], I[124+i],  w5[6*i+4 : 6*i], w5[6*i+5]);
  end
  n_bit_adder #6 nbitadder(w5[5:0], w5[11:6], I[126],  w6[5 : 0], w6[6]);
 endgenerate
 assign out = w6;
endmodule

module onescount127bit_always #(parameter n = 6) (input [126 : 0] in, output [n : 0] out);
	integer i, temp = 0;
	always@(in) begin
		temp = 0;
		for(i = 0; i < 127; i = i + 1) begin
			temp = temp + in[i];
		end
	end
	assign #798 out = temp;
endmodule